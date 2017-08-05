#include <cublas_v2.h>
#include <curand.h>
#include <iostream>
 void GPU_fill_rand(float *A, int nr_rows_A, int nr_cols_A) {
     // Create a pseudo-random number generator
     curandGenerator_t prng;
     curandCreateGenerator(&prng, CURAND_RNG_PSEUDO_DEFAULT);

     // Set the seed for the random number generator using the system clock
     curandSetPseudoRandomGeneratorSeed(prng, (unsigned long long) clock());

     // Fill the array with random numbers on the device
     curandGenerateUniform(prng, A, nr_rows_A * nr_cols_A);
 }
 void gpu_blas_mmul(const float *A, const float *B, float *C, const int m, const int k, const int n) {
       int lda=m,ldb=k,ldc=m;
       const float alf = 1;
      const float bet = 0;
      const float *alpha = &alf;
      const float *beta = &bet;

      // Create a handle for CUBLAS
      cublasHandle_t handle;
      cublasCreate(&handle);

      // Do the actual multiplication
      cublasSgemm(handle, CUBLAS_OP_N, CUBLAS_OP_N, m, n, k, alpha, A, lda, B, ldb, beta, C, ldc);

      // Destroy the handle
      cublasDestroy(handle);
  }
 int main(int argc, char **argv) {
     // Allocate 3 arrays on CPU
     int nr_rows_A, nr_cols_A, nr_rows_B, nr_cols_B, nr_rows_C, nr_cols_C;

     if (argc ==2)
     nr_rows_A = nr_cols_A = nr_rows_B = nr_cols_B = nr_rows_C = nr_cols_C = atoi(argv[1]);
     else
     nr_rows_A = nr_cols_A = nr_rows_B = nr_cols_B = nr_rows_C = nr_cols_C = 100;

     float *h_A = (float *)malloc(nr_rows_A * nr_cols_A * sizeof(float));
     float *h_B = (float *)malloc(nr_rows_B * nr_cols_B * sizeof(float));
    float *h_C = (float *)malloc(nr_rows_C * nr_cols_C * sizeof(float));

     // Allocate 3 arrays on GPU
     float *d_A, *d_B, *d_C;
     cudaMalloc(&d_A,nr_rows_A * nr_cols_A * sizeof(float));
     cudaMalloc(&d_B,nr_rows_B * nr_cols_B * sizeof(float));
     cudaMalloc(&d_C,nr_rows_C * nr_cols_C * sizeof(float));

     // Fill the arrays A and B on GPU with random numbers
     GPU_fill_rand(d_A, nr_rows_A, nr_cols_A);
     GPU_fill_rand(d_B, nr_rows_B, nr_cols_B);

     // Optionally we can copy the data back on CPU and print the arrays
     cudaMemcpy(h_A,d_A,nr_rows_A * nr_cols_A * sizeof(float),cudaMemcpyDeviceToHost);
     cudaMemcpy(h_B,d_B,nr_rows_B * nr_cols_B * sizeof(float),cudaMemcpyDeviceToHost);


     // Multiply A and B on GPU
     gpu_blas_mmul(d_A, d_B, d_C, nr_rows_A, nr_cols_A, nr_cols_B);

   // Copy (and print) the result on host memory
   cudaMemcpy(h_C,d_C,nr_rows_C * nr_cols_C * sizeof(float),cudaMemcpyDeviceToHost);

     //Free GPU memory
     cudaFree(d_A);
     cudaFree(d_B);
   cudaFree(d_C);

     // Free CPU memory
     free(h_A);
 free(h_B);
     free(h_C);

     return 0;
 }
