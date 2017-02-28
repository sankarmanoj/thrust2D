#include <cublas_v2.h>
#include <iostream>
#include <thrust/block_2d.h>
#include <thrust/sequence.h>
void gpu_blas_mmul(cublasHandle_t &handle, thrust::block_2d<float> *A, thrust::block_2d<float> *B, thrust::block_2d<float> *C, const int m, const int k, const int n) {
  int lda=A->pitch/sizeof(float),ldb=B->pitch/sizeof(float),ldc=C->pitch/sizeof(float);
  const float alf = 1;
  const float bet = 0;
  const float *alpha = &alf;
  const float *beta = &bet;

  // Do the actual multiplication
  cublasSgemm(handle, CUBLAS_OP_N, CUBLAS_OP_N, m, n, k, alpha, A->data_pointer, lda, B->data_pointer, ldb, beta, C->data_pointer, ldc);
}
//Print matrix A(nr_rows_A, nr_cols_A) storage in column-major format
void print_matrix(const float *A, int nr_rows_A, int nr_cols_A) {

  for(int i = 0; i < nr_rows_A; ++i){
    for(int j = 0; j < nr_cols_A; ++j){
      std::cout << A[j * nr_rows_A + i] << " ";
    }
    std::cout << std::endl;
  }
  std::cout << std::endl;
}
int main()
{
  // Allocate 3 arrays on CPU
  int nr_rows_A, nr_cols_A, nr_rows_B, nr_cols_B, nr_rows_C, nr_cols_C;

  // for simplicity we are going to use square arrays
  nr_rows_A = nr_cols_A = nr_rows_B = nr_cols_B = nr_rows_C = nr_cols_C = 100;

  float *h_A = (float *)malloc(nr_rows_A * nr_cols_A * sizeof(float));
  float *h_B = (float *)malloc(nr_rows_B * nr_cols_B * sizeof(float));
  float *h_C = (float *)malloc(nr_rows_C * nr_cols_C * sizeof(float));

  // Allocate 3 arrays on GPU
  thrust::block_2d<float> d_A(nr_rows_A,nr_cols_A),d_B(nr_rows_B,nr_cols_B),d_C(nr_rows_C,nr_cols_C);

  thrust::sequence(d_A.begin(),d_A.end());
  thrust::sequence(d_B.begin(),d_B.end());

  // Optionally we can copy the data back on CPU and print the arrays
  d_A.download(&h_A);
  d_B.download(&h_B);
  std::cout << "A =" << std::endl;
  print_matrix(h_A, nr_rows_A, nr_cols_A);
  std::cout << "B =" << std::endl;
  print_matrix(h_B, nr_rows_B, nr_cols_B);

  // Create a handle for CUBLAS
  cublasHandle_t handle;
  cublasCreate(&handle);

  // Multiply A and B on GPU
  gpu_blas_mmul(handle, &d_A, &d_B, &d_C, nr_rows_A, nr_cols_A, nr_cols_B);

  // Copy (and print) the result on host memory
  d_C.download(&h_C);
  std::cout << "C =" << std::endl;
  print_matrix(h_C, nr_rows_C, nr_cols_C);

  // //Free GPU memory
  // cudaFree(d_A);
  // cudaFree(d_B);
  // cudaFree(d_C);
  // Free CPU memory
  free(h_A);
  free(h_B);
  free(h_C);

  return 0;
}
