#include <thrust/device_vector.h>
#include <thrust/host_vector.h>
#include <thrust/transform.h>
#include <thrust/sequence.h>
#include <thrust/copy.h>
#include <thrust/fill.h>
#include <thrust/replace.h>
#include <thrust/functional.h>
#include <thrust/scan.h>

class randn_transform {

public:

    double a, b;
    int *seed;

    randn_transform(double a, double b, thrust::device_vector<int>::iterator seed) {
        
        this->a = a;
        this->b = b;
        this->seed = (int *) thrust::raw_pointer_cast(&(*seed));
    }

    __device__ double operator() (double &d, int i) {

        return d + a + b * d_randn(seed, i);
    }
};

class ind_calc {

public:

    double *arrayX;
    double *arrayY;
    int *objxy;
    int *ind;
    int countOnes, max_size, IszY, Nfr, k;

    ind_calc(thrust::device_vector<double>::iterator arrayX,
             thrust::device_vector<double>::iterator arrayY,
             thrust::device_vector<int>::iterator objxy,
             thrust::device_vector<int>::iterator ind,
             int countOnes, int max_size, int IszY, int Nfr, int k) {

        this->arrayX = (double *) raw_pointer_cast(&(*arrayX));
        this->arrayY = (double *) raw_pointer_cast(&(*arrayY));
        this->objxy = (int *) raw_pointer_cast(&(*objxy));
        this->ind = (int *) raw_pointer_cast(&(*ind));

        this->countOnes = countOnes;
        this->max_size = max_size;
        this->IszY = IszY;
        this->Nfr = Nfr;
        this->k = k;
    }

    __device__ void operator() (int i) {

        int y, indX, indY;

        for (y = 0; y < countOnes; y++) {
        
            indX = dev_round_double(arrayX[i]) + objxy[y * 2 + 1];
            indY = dev_round_double(arrayY[i]) + objxy[y * 2];

            
            
            ind[i * countOnes + y] = abs(indX * IszY * Nfr + indY * Nfr + k);
            if (ind[i * countOnes + y] >= max_size)
                ind[i * countOnes + y] = 0;
        }
    }
};

class calc_likelihood_sum {

public:

    int *ind;
    unsigned char *I;
    int numOnes;

    calc_likelihood_sum(thrust::device_vector<unsigned char>::iterator I, thrust::device_vector<int>::iterator ind, int numOnes){

        this->I = (unsigned char *) raw_pointer_cast(&(*I));
        this->ind = (int *) raw_pointer_cast(&(*ind));
        this->numOnes = numOnes;
    }

    __device__ double operator() (double &l, int i) {

        return calcLikelihoodSum(I, ind, numOnes, i);
    }
};

class normalize_weights {

public:
    double sumWeights;

    normalize_weights(double sumWeights) {
        this->sumWeights = sumWeights;
    }

    __device__ void operator() (double &d) {
        d = d / sumWeights;
    }
};

class exp_transform {

public:

    __device__ double operator() (double &l, double &w) {
        
        return w + exp(l);
    }
};

class update_u {

public:
    int Nparticles;
    double u_0;
    
    update_u(int Nparticles, thrust::device_reference<double> u_0, thrust::device_reference<int> seed_0) {

        this->Nparticles = Nparticles;

        int num = A * seed_0 + C;
        seed_0 = num % M;
        u_0 = (1 / ((double) (Nparticles))) * fabs(seed_0 / ((double) M));
        this->u_0 = u_0;        
    }

    __device__ void operator() (double &i) {

        i = u_0 + i / ((double) (Nparticles));
    }
};

class get_index {

public:
    double *CDF;
    int Nparticles;

    get_index(thrust::device_vector<double>::iterator CDF, int Nparticles) {

        this->CDF = (double *) thrust::raw_pointer_cast(&(*CDF));
        this->Nparticles = Nparticles;
    }

    __device__ int operator() (double &u, double &v) {

        int index = Nparticles - 1;
        int x;

        for (x = 0; x < Nparticles; x++) {
            if (CDF[x] >= u) {
                index = x;
                break;
            }
        }

        return index;
    } 
};

class update_coords {

public:
    double *array;

    update_coords(thrust::device_vector<double>::iterator array) {
        this->array = thrust::raw_pointer_cast(&(*array));
    }

    __device__ double operator() (double &d, int &index) {
        return array[index];
    }
};

void particleFilter(unsigned char *I, int IszX, int IszY, int Nfr, int *seed, int Nparticles) {

    thrust::host_vector<int> objxy(countOnes * 2);
    getneighbors(disk, countOnes, thrust::raw_pointer_cast(&(*objxy.begin())), radius);
    
    thrust::host_vector<double> arrayX(Nparticles);         //the important ones
    thrust::host_vector<double> arrayY(Nparticles);
    thrust::host_vector<double> xj(Nparticles);
    thrust::host_vector<double> yj(Nparticles);
    thrust::host_vector<double> weights(Nparticles);

    thrust::fill(xj.begin(), xj.end(), xe);
    thrust::fill(yj.begin(), yj.end(), ye);
    
    thrust::device_vector<double> arrayX_GPU(Nparticles);
    thrust::device_vector<double> arrayY_GPU(Nparticles);
    thrust::device_vector<double> CDF_GPU(Nparticles);
    thrust::device_vector<double> u_GPU(Nparticles);    
    thrust::device_vector<double> likelihood_GPU(Nparticles, 0);
    thrust::device_vector<double> weights_GPU(Nparticles);
    thrust::device_vector<int> ind_GPU(countOnes * Nparticles);

    thrust::device_vector<int> indices(Nparticles); 
    
 
    thrust::device_vector<unsigned char> I_GPU(I, I + (IszX * IszY * Nfr));
    thrust::device_vector<int> objxy_GPU = objxy;
    thrust::device_vector<double> xj_GPU = xj;
    thrust::device_vector<double> yj_GPU = yj;
    thrust::device_vector<int> seed_GPU(seed, seed + Nparticles);
    
    thrust::counting_iterator<int> it_begin(0);		// used when thread ID is required
    thrust::counting_iterator<int> it_end = it_begin + Nparticles;
    
    double sumWeights;  //to hold the result of the reduce operation

    for(k = 1; k < Nfr; k++) {

	    // Code for likelihood_kernel starts
	    thrust::fill(weights_GPU.begin(), weights_GPU.end(), 1 / ((double) (Nparticles)));
	    
	    randn_transform func_1(1.0, 5.0, seed_GPU.begin());
	    thrust::transform(xj_GPU.begin(), xj_GPU.end(), it_begin, arrayX_GPU.begin(), func_1);

	    randn_transform func_2(-2.0, 2.0, seed_GPU.begin());
	    thrust::transform(yj_GPU.begin(), yj_GPU.end(), it_begin, arrayY_GPU.begin(), func_2);

	    // Difficult to port code

	    ind_calc func_3(arrayX_GPU.begin(), arrayY_GPU.begin(), objxy_GPU.begin(), ind_GPU.begin(), countOnes, max_size, IszY, Nfr, k);
	    thrust::for_each(it_begin, it_end, func_3);

	    // End of difficult bit

	    calc_likelihood_sum func_4(I_GPU.begin(), ind_GPU.begin(), countOnes);
	    thrust::transform(likelihood_GPU.begin(), likelihood_GPU.end(), it_begin, likelihood_GPU.begin(), func_4);

        normalize_weights func_5(countOnes);
	    thrust::for_each(likelihood_GPU.begin(), likelihood_GPU.end(), func_5);

        exp_transform func_6;
	    thrust::transform(likelihood_GPU.begin(), likelihood_GPU.end(), weights_GPU.begin(), weights_GPU.begin(), func_6);
	    // Code for likelihood_kernel ends


        // Code for sum_kernel starts
	    sumWeights = thrust::reduce(weights_GPU.begin(), weights_GPU.end());
	    // Code for sum_kernel ends

	    // Code for normalize_weights_kernel starts
	    normalize_weights func_7(sumWeights);
	    thrust::for_each(weights_GPU.begin(), weights_GPU.end(), func_7);

	    thrust::inclusive_scan(weights_GPU.begin(), weights_GPU.end(), CDF_GPU.begin());

	    update_u func_8(Nparticles, u_GPU[0], seed_GPU[0]);
	    thrust::sequence(u_GPU.begin(), u_GPU.end());
	    thrust::for_each(u_GPU.begin(), u_GPU.end(), func_8); 
	    // Code for normalize_weights_kernel ends

		// Code for find_index_kernel starts
        get_index func_9(CDF_GPU.begin(), Nparticles);
        thrust::transform(u_GPU.begin(), u_GPU.end(), u_GPU.begin(), indices.begin(), func_9);

        update_coords func_10(arrayX_GPU.begin());
        thrust::transform(xj_GPU.begin(), xj_GPU.end(), indices.begin(), xj_GPU.begin(), func_10);

        update_coords func_11(arrayY_GPU.begin());
        thrust::transform(yj_GPU.begin(), yj_GPU.end(), indices.begin(), yj_GPU.begin(), func_11);

	    // Code for find_index_kernel ends
	}

	arrayX = arrayX_GPU;

	arrayY = arrayY_GPU;

	weights = weights_GPU;
