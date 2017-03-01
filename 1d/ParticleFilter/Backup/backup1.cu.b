#include <stdio.h>

#include <thrust/device_vector.h>
#include <thrust/transform.h>
#include <thrust/sequence.h>
#include <thrust/copy.h>
#include <thrust/fill.h>
#include <thrust/replace.h>
#include <thrust/functional.h>
#include <thrust/scan.h>

#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <math.h>
#include <unistd.h>
#include <fcntl.h>
#include <float.h>
#include <sys/time.h>

long M = INT_MAX;
int A = 1103515245;
int C = 12345;

// using namespace thrust;

typedef thrust::device_vector<double>::iterator DoubleIterator;
typedef thrust::tuple<DoubleIterator,DoubleIterator,DoubleIterator> IteratorTuple;
typedef thrust::zip_iterator<IteratorTuple> ZipIterator;

__device__ double d_randu(int * seed, int index) {

	int M = INT_MAX;
    int A = 1103515245;
    int C = 12345;
    int num = A * seed[index] + C;
    seed[index] = num % M;

    return fabs(seed[index] / ((double) M));
}

__device__ double d_randn(int * seed, int index) {
    //Box-Muller algortihm
    double pi = 3.14159265358979323846;
    double u = d_randu(seed, index);
    double v = d_randu(seed, index);
    double cosine = cos(2 * pi * v);
    double rt = -2 * log(u);
    return sqrt(rt) * cosine;
}

__device__ double calcLikelihoodSum(unsigned char * I, int * ind, int numOnes, int index) {
    double likelihoodSum = 0.0;
    int x;
    for (x = 0; x < numOnes; x++)
        likelihoodSum += (pow((double) (I[ind[index * numOnes + x]] - 100), 2) - pow((double) (I[ind[index * numOnes + x]] - 228), 2)) / 50.0;
    return likelihoodSum;
}

__device__ double dev_round_double(double value) {
    int newValue = (int) (value);
    if (value - newValue < .5f)
        return newValue;
    else
        return newValue++;
}

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

    void operator() (double &d) {
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

    void operator() (double &i) {

        i = u_0 + i / ((double) (Nparticles));
    }
};

class find_index {

public:
    
    double *arrayX;
    double *arrayY;
    double *CDF;
   
    int Nparticles;

    find_index(thrust::device_vector<double>::iterator arrayX,
               thrust::device_vector<double>::iterator arrayY,
               thrust::device_vector<double>::iterator CDF,
               int Nparticles) {

        this->arrayX = (double *) thrust::raw_pointer_cast(&(*arrayX));
        this->arrayX = (double *) thrust::raw_pointer_cast(&(*arrayY));
        this->arrayX = (double *) thrust::raw_pointer_cast(&(*CDF));
        this->Nparticles = Nparticles;        
    }

    void operator() (thrust::tuple<double&, double&, double&> tup) {

        int index = Nparticles - 1;
        int x;

        for (x = 0; x < Nparticles; x++) {
            if (CDF[x] >= thrust::get<0>(tup)) {
                index = x;
                break;
            }
        }

        thrust::get<1>(tup) = arrayX[index];
        thrust::get<2>(tup) = arrayY[index];
    }
};

int main() {

    // Declaring variables to be used
    int Nparticles = 100;
    int sumWeights = 0;
    int countOnes = 10;
    int max_size = 2, IszY = 0, Nfr = 0, k = 0;
    
    thrust::device_vector<double> likelihood	(100,0);
    thrust::device_vector<double> weights		(100,0);
    thrust::device_vector<double> arrayX		(100,0);
    thrust::device_vector<double> arrayY		(100,0);
    thrust::device_vector<double> CDF			(100,0);
    thrust::device_vector<double> u 			(100,0);
    thrust::device_vector<double> xj			(100,0);
    thrust::device_vector<double> yj			(100,0);

    thrust::device_vector<int> seed	    		(100,0);
    thrust::device_vector<int> ind	    		(1500,0);
    thrust::device_vector<int> objxy			(100,0);

   	thrust::device_vector<unsigned char> I		(100,0);

    thrust::counting_iterator<int> it_begin(0);		// used when thread ID is required
    thrust::counting_iterator<int> it_end = it_begin + Nparticles;

    // Code for likelihood_kernel starts
    thrust::fill(weights.begin(), weights.end(), 1 / ((double) (Nparticles)));
    
    randn_transform func_1(1.0, 5.0, seed.begin());
    thrust::transform(xj.begin(), xj.end(), it_begin, arrayX.begin(), func_1);

    randn_transform func_2(-2.0, 2.0, seed.begin());
    thrust::transform(yj.begin(), yj.end(), it_begin, arrayY.begin(), func_2);

    // Difficult to port code
    ind_calc func_3(arrayX.begin(), arrayY.begin(), objxy.begin(), ind.begin(), countOnes, max_size, IszY, Nfr, k);
    thrust::for_each(it_begin, it_begin + 100, func_3);
    // End of difficult bit

    calc_likelihood_sum func_4(I.begin(), ind.begin(), countOnes);
    thrust::transform(likelihood.begin(), likelihood.end(), it_begin, likelihood.begin(), func_4);

    normalize_weights func_5(countOnes);
    thrust::for_each(likelihood.begin(), likelihood.end(), func_5);

    exp_transform func_6;
    thrust::transform(likelihood.begin(), likelihood.end(), weights.begin(), weights.begin(), func_6);
    // Code for likelihood_kernel ends

    // Code for sum_kernel starts
    sumWeights = thrust::reduce(weights.begin(), weights.end());
    // Code for sum_kernel ends

    // Code for normalize_weights_kernel starts
    normalize_weights func_7(sumWeights);
    thrust::for_each(weights.begin(), weights.end(), func_7);

    thrust::inclusive_scan(weights.begin(), weights.end(), CDF.begin());

    update_u func_8(Nparticles, u[0], seed[0]);
    thrust::sequence(u.begin(), u.end());
    thrust::for_each(u.begin(), u.end(), func_8); 
    // Code for normalize_weights_kernel ends

	// Code for find_index_kernel starts
   	ZipIterator it1 = thrust::make_tuple(u.begin(), xj.begin(), yj.begin());
   	ZipIterator it2 = thrust::make_tuple(u.end(), xj.end(), yj.end());

    find_index func_9(arrayX.begin(), arrayY.begin(), CDF.begin(), Nparticles);

    thrust::for_each(it1, it2, func_9);
    // Code for find_index_kernel ends

    return 0;
}