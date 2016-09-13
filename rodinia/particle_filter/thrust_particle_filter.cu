#include <stdio.h>

#include <thrust/device_vector.h>
#include <thrust/host_vector.h>
#include <thrust/transform.h>
#include <thrust/sequence.h>
#include <thrust/copy.h>
#include <thrust/fill.h>
#include <thrust/replace.h>
#include <thrust/functional.h>
#include <thrust/scan.h>
#include <thrust/block_2d.h>
#include <thrust/window_2d.h>

#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <math.h>
#include <unistd.h>
#include <fcntl.h>
#include <float.h>
#include <sys/time.h>
#define PI 3.1415926535897932

long M = INT_MAX;
int A = 1103515245;
int C = 12345;

long long get_time() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (tv.tv_sec * 1000000) +tv.tv_usec;
}
// Returns the number of seconds elapsed between the two specified times

double elapsed_time(long long start_time, long long end_time) {
    return (double) (end_time - start_time) / (1000 * 1000);
}

/*****************************
 * CHECK_ERROR
 * Checks for CUDA errors and prints them to the screen to help with
 * debugging of CUDA related programming
 *****************************/
void check_error(cudaError e) {
    if (e != cudaSuccess) {
        printf("\nCUDA error: %s\n", cudaGetErrorString(e));
        exit(1);
    }
}

void cuda_print_double_array(double *array_GPU, size_t size) {
    //allocate temporary array for printing
    double* mem = (double*) malloc(sizeof (double) *size);

    //transfer data from device
    cudaMemcpy(mem, array_GPU, sizeof (double) *size, cudaMemcpyDeviceToHost);


    printf("PRINTING ARRAY VALUES\n");
    //print values in memory
    for (size_t i = 0; i < size; ++i) {
        printf("[%ld]:%0.6f\n", i, mem[i]);
    }
    printf("FINISHED PRINTING ARRAY VALUES\n");

    //clean up memory
    free(mem);
    mem = NULL;
}

/********************************
 * CALC LIKELIHOOD SUM
 * DETERMINES THE LIKELIHOOD SUM BASED ON THE FORMULA: SUM( (IK[IND] - 100)^2 - (IK[IND] - 228)^2)/ 100
 * param 1 I 3D matrix
 * param 2 current ind array
 * param 3 length of ind array
 * returns a double representing the sum
 ********************************/
__device__ double calcLikelihoodSum(unsigned char * I, int * ind, int numOnes, int index) {
    double likelihoodSum = 0.0;
    int x;
    for (x = 0; x < numOnes; x++)
        likelihoodSum += (pow((double) (I[ind[index * numOnes + x]] - 100), 2.0) - pow((double) (I[ind[index * numOnes + x]] - 228), 2.0)) / 50.0;
    return likelihoodSum;
}

__device__ double d_randu(int * seed, int index) {

    int M = INT_MAX;
    int A = 1103515245;
    int C = 12345;
    int num = A * seed[index] + C;
    seed[index] = num % M;

    return fabs(seed[index] / ((double) M));
}/**
* Generates a uniformly distributed random number using the provided seed and GCC's settings for the Linear Congruential Generator (LCG)
* @see http://en.wikipedia.org/wiki/Linear_congruential_generator
* @note This function is thread-safe
* @param seed The seed array
* @param index The specific index of the seed to be advanced
* @return a uniformly distributed number [0, 1)
*/

double randu(int * seed, int index) {
    int num = A * seed[index] + C;
    seed[index] = num % M;
    return fabs(seed[index] / ((double) M));
}

/**
 * Generates a normally distributed random number using the Box-Muller transformation
 * @note This function is thread-safe
 * @param seed The seed array
 * @param index The specific index of the seed to be advanced
 * @return a double representing random number generated using the Box-Muller algorithm
 * @see http://en.wikipedia.org/wiki/Normal_distribution, section computing value for normal random distribution
 */
double randn(int * seed, int index) {
    /*Box-Muller algorithm*/
    double u = randu(seed, index);
    double v = randu(seed, index);
    double cosine = cos(2 * PI * v);
    double rt = -2 * log(u);
    return sqrt(rt) * cosine;
}

double test_randn(int * seed, int index) {
    //Box-Muller algortihm
    double pi = 3.14159265358979323846;
    double u = randu(seed, index);
    double v = randu(seed, index);
    double cosine = cos(2 * pi * v);
    double rt = -2 * log(u);
    return sqrt(rt) * cosine;
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

/** added this function. was missing in original double version.
 * Takes in a double and returns an integer that approximates to that double
 * @return if the mantissa < .5 => return value < input value; else return value > input value
 */
__device__ double dev_round_double(double value) {
    int newValue = (int) (value);
    if (value - newValue < .5f)
        return newValue;
    else
        return newValue++;
}

/**
 * Takes in a double and returns an integer that approximates to that double
 * @return if the mantissa < .5 => return value < input value; else return value > input value
 */
double roundDouble(double value) {
    int newValue = (int) (value);
    if (value - newValue < .5)
        return newValue;
    else
        return newValue++;
}

/**
 * Set values of the 3D array to a newValue if that value is equal to the testValue
 * @param testValue The value to be replaced
 * @param newValue The value to replace testValue with
 * @param array3D The image vector
 * @param dimX The x dimension of the frame
 * @param dimY The y dimension of the frame
 * @param dimZ The number of frames
 */
void setIf(int testValue, int newValue, unsigned char * array3D, int * dimX, int * dimY, int * dimZ) {
    int x, y, z;
    for (x = 0; x < *dimX; x++) {
        for (y = 0; y < *dimY; y++) {
            for (z = 0; z < *dimZ; z++) {
                if (array3D[x * *dimY * *dimZ + y * *dimZ + z] == testValue)
                    array3D[x * *dimY * *dimZ + y * *dimZ + z] = newValue;
            }
        }
    }
}

/**
 * Sets values of 3D matrix using randomly generated numbers from a normal distribution
 * @param array3D The video to be modified
 * @param dimX The x dimension of the frame
 * @param dimY The y dimension of the frame
 * @param dimZ The number of frames
 * @param seed The seed array
 */
void addNoise(unsigned char * array3D, int * dimX, int * dimY, int * dimZ, int * seed) {
    int x, y, z;
    for (x = 0; x < *dimX; x++) {
        for (y = 0; y < *dimY; y++) {
            for (z = 0; z < *dimZ; z++) {
                array3D[x * *dimY * *dimZ + y * *dimZ + z] = array3D[x * *dimY * *dimZ + y * *dimZ + z] + (unsigned char) (5 * randn(seed, 0));
            }
        }
    }
}

/**
 * Fills a radius x radius matrix representing the disk
 * @param disk The pointer to the disk to be made
 * @param radius  The radius of the disk to be made
 */
void strelDisk(int * disk, int radius) {
    int diameter = radius * 2 - 1;
    int x, y;
    for (x = 0; x < diameter; x++) {
        for (y = 0; y < diameter; y++) {
            double distance = sqrt(pow((double) (x - radius + 1), 2) + pow((double) (y - radius + 1), 2));
            if (distance < radius)
                disk[x * diameter + y] = 1;
        }
    }
}

/**
 * Dilates the provided video
 * @param matrix The video to be dilated
 * @param posX The x location of the pixel to be dilated
 * @param posY The y location of the pixel to be dilated
 * @param poxZ The z location of the pixel to be dilated
 * @param dimX The x dimension of the frame
 * @param dimY The y dimension of the frame
 * @param dimZ The number of frames
 * @param error The error radius
 */
void dilate_matrix(unsigned char * matrix, int posX, int posY, int posZ, int dimX, int dimY, int dimZ, int error) {
    int startX = posX - error;
    while (startX < 0)
        startX++;
    int startY = posY - error;
    while (startY < 0)
        startY++;
    int endX = posX + error;
    while (endX > dimX)
        endX--;
    int endY = posY + error;
    while (endY > dimY)
        endY--;
    int x, y;
    for (x = startX; x < endX; x++) {
        for (y = startY; y < endY; y++) {
            double distance = sqrt(pow((double) (x - posX), 2) + pow((double) (y - posY), 2));
            if (distance < error)
                matrix[x * dimY * dimZ + y * dimZ + posZ] = 1;
        }
    }
}

/**
 * Dilates the target matrix using the radius as a guide
 * @param matrix The reference matrix
 * @param dimX The x dimension of the video
 * @param dimY The y dimension of the video
 * @param dimZ The z dimension of the video
 * @param error The error radius to be dilated
 * @param newMatrix The target matrix
 */
void imdilate_disk(unsigned char * matrix, int dimX, int dimY, int dimZ, int error, unsigned char * newMatrix) {
    int x, y, z;
    for (z = 0; z < dimZ; z++) {
        for (x = 0; x < dimX; x++) {
            for (y = 0; y < dimY; y++) {
                if (matrix[x * dimY * dimZ + y * dimZ + z] == 1) {
                    dilate_matrix(newMatrix, x, y, z, dimX, dimY, dimZ, error);
                }
            }
        }
    }
}

/**
 * Fills a 2D array describing the offsets of the disk object
 * @param se The disk object
 * @param numOnes The number of ones in the disk
 * @param neighbors The array that will contain the offsets
 * @param radius The radius used for dilation
 */
void getneighbors(int * se, int numOnes, int * neighbors, int radius) {
    int x, y;
    int neighY = 0;
    int center = radius - 1;
    int diameter = radius * 2 - 1;
    for (x = 0; x < diameter; x++) {
        for (y = 0; y < diameter; y++) {
            if (se[x * diameter + y]) {
                neighbors[neighY * 2] = (int) (y - center);
                neighbors[neighY * 2 + 1] = (int) (x - center);
                neighY++;
            }
        }
    }
}

/**
 * The synthetic video sequence we will work with here is composed of a
 * single moving object, circular in shape (fixed radius)
 * The motion here is a linear motion
 * the foreground intensity and the background intensity is known
 * the image is corrupted with zero mean Gaussian noise
 * @param I The video itself
 * @param IszX The x dimension of the video
 * @param IszY The y dimension of the video
 * @param Nfr The number of frames of the video
 * @param seed The seed array used for number generation
 */
void videoSequence(unsigned char * I, int IszX, int IszY, int Nfr, int * seed) {
    int k;
    int max_size = IszX * IszY * Nfr;
    /*get object centers*/
    int x0 = (int) roundDouble(IszY / 2.0);
    int y0 = (int) roundDouble(IszX / 2.0);
    I[x0 * IszY * Nfr + y0 * Nfr + 0] = 1;

    /*move point*/
    int xk, yk, pos;
    for (k = 1; k < Nfr; k++) {
        xk = abs(x0 + (k-1));
        yk = abs(y0 - 2 * (k-1));
        pos = yk * IszY * Nfr + xk * Nfr + k;
        if (pos >= max_size)
            pos = 0;
        I[pos] = 1;
    }

    /*dilate matrix*/
    unsigned char * newMatrix = (unsigned char *) malloc(sizeof (unsigned char) * IszX * IszY * Nfr);
    imdilate_disk(I, IszX, IszY, Nfr, 5, newMatrix);
    int x, y;
    for (x = 0; x < IszX; x++) {
        for (y = 0; y < IszY; y++) {
            for (k = 0; k < Nfr; k++) {
                I[x * IszY * Nfr + y * Nfr + k] = newMatrix[x * IszY * Nfr + y * Nfr + k];
            }
        }
    }
    free(newMatrix);

    /*define background, add noise*/
    setIf(0, 100, I, &IszX, &IszY, &Nfr);
    setIf(1, 228, I, &IszX, &IszY, &Nfr);
    /*add noise*/
    addNoise(I, &IszX, &IszY, &Nfr, seed);

}

/**
 * Finds the first element in the CDF that is greater than or equal to the provided value and returns that index
 * @note This function uses sequential search
 * @param CDF The CDF
 * @param lengthCDF The length of CDF
 * @param value The value to be found
 * @return The index of value in the CDF; if value is never found, returns the last index
 */
int findIndex(double * CDF, int lengthCDF, double value) {
    int index = -1;
    int x;
    for (x = 0; x < lengthCDF; x++) {
        if (CDF[x] >= value) {
            index = x;
            break;
        }
    }
    if (index == -1) {
        return lengthCDF - 1;
    }
    return index;
}

/**
 * The implementation of the particle filter using OpenMP for many frames
 * @see http://openmp.org/wp/
 * @note This function is designed to work with a video of several frames. In addition, it references a provided MATLAB function which takes the video, the objxy matrix and the x and y arrays as arguments and returns the likelihoods
 * @param I The video to be run
 * @param IszX The x dimension of the video
 * @param IszY The y dimension of the video
 * @param Nfr The number of frames
 * @param seed The seed array used for random number generation
 * @param Nparticles The number of particles to be used
 */


class randn_transform {

public:

    double a, b;
    int *seed;

    randn_transform(double a, double b, thrust::block_iterator<int> seed) {

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

    ind_calc(thrust::block_iterator<double> arrayX,
             thrust::block_iterator<double> arrayY,
             thrust::block_iterator<int> objxy,
             thrust::block_iterator<int> ind,
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

            // printf("%d, ", i * countOnes + y);

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

    calc_likelihood_sum(thrust::block_iterator<unsigned char> I, thrust::block_iterator<int> ind, int numOnes){

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

// class find_index {

// public:

//     double *arrayX;
//     double *arrayY;
//     double *CDF;

//     int Nparticles;

//     find_index(thrust::block_iterator<double> arrayX,
//                thrust::block_iterator<double> arrayY,
//                thrust::block_iterator<double> CDF,
//                int Nparticles) {

//         this->arrayX = (double *) thrust::raw_pointer_cast(&(*arrayX));
//         this->arrayY = (double *) thrust::raw_pointer_cast(&(*arrayY));
//         this->CDF = (double *) thrust::raw_pointer_cast(&(*CDF));
//         this->Nparticles = Nparticles;
//     }

//     void operator() (thrust::tuple<double&, double&, double&> tup) {

//         int index = -1;
//         int x;

//         for (x = 0; x < Nparticles; x++) {
//             if (CDF[x] >= thrust::get<0>(tup)) {
//                 index = x;
//                 break;
//             }
//         }
//         if (index == -1) {
//             index = Nparticles - 1;
//         }

//         thrust::get<1>(tup) = arrayX[index];
//         thrust::get<2>(tup) = arrayY[index];
//     }
// };

class get_index {

public:
    double *CDF;
    int Nparticles;

    get_index(thrust::block_iterator<double> CDF, int Nparticles) {

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

    update_coords(thrust::block_iterator<double> array) {
        this->array = thrust::raw_pointer_cast(&(*array));
    }

    __device__ double operator() (double &d, int &index) {
        return array[index];
    }
};

void particleFilter(unsigned char *I, int IszX, int IszY, int Nfr, int *seed, int Nparticles) {

    int max_size = IszX * IszY * Nfr;

    double xe = roundDouble(IszY / 2.0);
    double ye = roundDouble(IszX / 2.0);

    //expected object locations, compared to center
    int radius = 5;
    int diameter = radius * 2 - 1;
    int * disk = (int*) malloc(diameter * diameter * sizeof (int));
    strelDisk(disk, radius);
    int countOnes = 0;
    int x, y;
    for (x = 0; x < diameter; x++) {
        for (y = 0; y < diameter; y++) {
            if (disk[x * diameter + y] == 1)
                countOnes++;
        }
    }
    thrust::host_vector<int> objxy(countOnes * 2);
    getneighbors(disk, countOnes, thrust::raw_pointer_cast(&(*objxy.begin())), radius);

    thrust::Block_2D<double> arrayX_GPU(Nparticles,1);
    thrust::Block_2D<double> arrayY_GPU(Nparticles,1);
    thrust::Block_2D<double> CDF_GPU(Nparticles,1);
    thrust::Block_2D<double> u_GPU(Nparticles,1);
    thrust::Block_2D<double> likelihood_GPU(Nparticles, 1, 0.0);

    thrust::Block_2D<double> weights_GPU(Nparticles,1);
    // thrust::hybrid::shared_vector<double> weights_GPU(Nparticles);

    thrust::Block_2D<int> ind_GPU(countOnes * Nparticles,1);

    thrust::Block_2D<int> indices(Nparticles,1);     // to hold intermediate indices in find_index kernel

    long long send_start = get_time();

    thrust::Block_2D<unsigned char> I_GPU(I, I + (IszX * IszY * Nfr));
    thrust::Block_2D<int> objxy_GPU(objxy.begin(),objxy.end());
    // getneighbors(disk, countOnes, thrust::raw_pointer_cast(objxy_GPU.device_pointer->data()), radius);
    thrust::Block_2D<double> xj_GPU(Nparticles,1);
    thrust::Block_2D<double> yj_GPU(Nparticles,1);

    thrust::fill(xj_GPU.begin(), xj_GPU.end(), xe);
    thrust::fill(yj_GPU.begin(), yj_GPU.end(), ye);

    thrust::Block_2D<int> seed_GPU(seed, seed + Nparticles);

    thrust::counting_iterator<int> it_begin(0);		// used when thread ID is required
    thrust::counting_iterator<int> it_end = it_begin + Nparticles;

    long long send_end = get_time();
    printf("TIME TO SEND TO GPU: %f\n", elapsed_time(send_start, send_end));

    int k;
    double sumWeights;  //to hold the result of the reduce operation

    // TODO: Do the whole __CUDA_ARCH__ thing in Block_2D::convert2D
    for(k = 1; k < Nfr; k++)
    {

	    // Code for likelihood_kernel starts
	    thrust::fill (weights_GPU.begin(), weights_GPU.end(), 1 / ((double) (Nparticles)));

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

	    thrust::inclusive_scan (weights_GPU.begin(), weights_GPU.end(), CDF_GPU.begin());

	    update_u func_8(Nparticles, u_GPU[0][0], seed_GPU[0][0]);
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

	long long back_time = get_time();
	long long free_time = get_time();

	// arrayX = arrayX_GPU;
	long long arrayX_time = get_time();

	// arrayY = arrayY_GPU;
	long long arrayY_time = get_time();

	// weights = weights_GPU;
	long long back_end_time = get_time();


    printf("GPU Execution: %lf\n", elapsed_time(send_end, back_time));
    printf("FREE TIME: %lf\n", elapsed_time(back_time, free_time));
    printf("TIME TO SEND BACK: %lf\n", elapsed_time(back_time, back_end_time));
    printf("SEND ARRAY X BACK: %lf\n", elapsed_time(free_time, arrayX_time));
    printf("SEND ARRAY Y BACK: %lf\n", elapsed_time(arrayX_time, arrayY_time));
    printf("SEND WEIGHTS BACK: %lf\n", elapsed_time(arrayY_time, back_end_time));

    xe = 0;
    ye = 0;
    // estimate the object location by expected values

	for (x = 0; x < Nparticles; x++) {
        xe += arrayX_GPU[0][x] * weights_GPU[0][x];
        ye += arrayY_GPU[0][x] * weights_GPU[0][x];
    }
    printf("XE: %lf\n", xe);
    printf("YE: %lf\n", ye);
    double distance = sqrt(pow((double) (xe - (int) roundDouble(IszY / 2.0)), 2) + pow((double) (ye - (int) roundDouble(IszX / 2.0)), 2));
    printf("%lf\n", distance);


}

int main(int argc, char * argv[]) {

    char* usage = "double.out -x <dimX> -y <dimY> -z <Nfr> -np <Nparticles>";
    //check number of arguments
    if (argc != 9) {
        printf("%s\n", usage);
        return 0;
    }
    //check args deliminators
    if (strcmp(argv[1], "-x") || strcmp(argv[3], "-y") || strcmp(argv[5], "-z") || strcmp(argv[7], "-np")) {
        printf("%s\n", usage);
        return 0;
    }

    int IszX, IszY, Nfr, Nparticles;

    //converting a string to a integer
    if (sscanf(argv[2], "%d", &IszX) == EOF) {
        printf("ERROR: dimX input is incorrect");
        return 0;
    }

    if (IszX <= 0) {
        printf("dimX must be > 0\n");
        return 0;
    }

    //converting a string to a integer
    if (sscanf(argv[4], "%d", &IszY) == EOF) {
        printf("ERROR: dimY input is incorrect");
        return 0;
    }

    if (IszY <= 0) {
        printf("dimY must be > 0\n");
        return 0;
    }

    //converting a string to a integer
    if (sscanf(argv[6], "%d", &Nfr) == EOF) {
        printf("ERROR: Number of frames input is incorrect");
        return 0;
    }

    if (Nfr <= 0) {
        printf("number of frames must be > 0\n");
        return 0;
    }

    //converting a string to a integer
    if (sscanf(argv[8], "%d", &Nparticles) == EOF) {
        printf("ERROR: Number of particles input is incorrect");
        return 0;
    }

    if (Nparticles <= 0) {
        printf("Number of particles must be > 0\n");
        return 0;
    }
    //establish seed
    int * seed = (int *) malloc(sizeof (int) *Nparticles);
    int i;
    for (i = 0; i < Nparticles; i++)
        seed[i] = time(0) * i;
    //malloc matrix
    unsigned char * I = (unsigned char *) malloc(sizeof (unsigned char) *IszX * IszY * Nfr);
    long long start = get_time();
    //call video sequence
    videoSequence(I, IszX, IszY, Nfr, seed);
    long long endVideoSequence = get_time();
    printf("VIDEO SEQUENCE TOOK %f\n", elapsed_time(start, endVideoSequence));
    //call particle filter
    particleFilter(I, IszX, IszY, Nfr, seed, Nparticles);
    long long endParticleFilter = get_time();
    printf("PARTICLE FILTER TOOK %f\n", elapsed_time(endVideoSequence, endParticleFilter));
    printf("ENTIRE PROGRAM TOOK %f\n", elapsed_time(start, endParticleFilter));

    free(seed);
    free(I);
    return 0;
}