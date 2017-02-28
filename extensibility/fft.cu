#include <cufft.h>
#include <iostream>
#include <thrust/block_2d.h>
#include <thrust/sequence.h>
//Print matrix A(nr_rows_A, nr_cols_A) storage in column-major format
using namespace thrust;
void print_matrix(const float *A, int nr_rows_A, int nr_cols_A) {

  for(int i = 0; i < nr_rows_A; ++i){
    for(int j = 0; j < nr_cols_A; ++j){
      std::cout << A[j * nr_rows_A + i] << " ";
    }
    std::cout << std::endl;
  }
  std::cout << std::endl;
}
class pointwise_product
{
public:
  float div;
  pointwise_product(float div)
  {
    this->div = div;
  }
  __device__ cufftComplex operator() (const cufftComplex &a, const cufftComplex &b) const
  {
    cufftComplex c;
    c.x = a.x*b.x - a.y*b.y;
    c.y = a.x*b.y + a.y*b.x;
    c.x *= div;
    c.y *= div;
    return c;
  }
};
void fft_convolve(block_2d<float> *x, block_2d<float> *h, block_2d<float> *y)
{
  assert(x->dim_x == h->dim_x);
  assert(x->dim_y == h->dim_y);
  cufftReal* d_inA, *d_inB;
  cufftComplex* d_outA, *d_outB;

  size_t real_size = x->dim_x * x->dim_y * sizeof(cufftReal);
  size_t complex_size = x->dim_x * (x->dim_y/2+1) * sizeof(cufftComplex);

  cudaMalloc((void**)&d_inA, real_size);
  cudaMalloc((void**)&d_inB, real_size);

  cudaMalloc((void**)&d_outA, complex_size);
  cudaMalloc((void**)&d_outB, complex_size);

  cudaMemset(d_inA,0,real_size);
  cudaMemset(d_inB,0,real_size);

  cudaMemcpy2D(d_inA,0, x->data_pointer,x->pitch, x->dim_x*sizeof(cufftReal),x->dim_y, cudaMemcpyHostToDevice);
  cudaMemcpy2D(d_inB,0, h->data_pointer,h->pitch, h->dim_x*sizeof(cufftReal),h->dim_y, cudaMemcpyHostToDevice);


  cufftHandle fwplanA, fwplanB, bwplan;
  cufftPlan2d(&fwplanA, x->dim_y, x->dim_x, CUFFT_R2C);
  cufftPlan2d(&fwplanB, x->dim_y, x->dim_x, CUFFT_R2C);
  cufftPlan2d(&bwplan, x->dim_y, x->dim_x, CUFFT_C2R);

  // cufftSetCompatibilityMode(fwplanA,CUFFT_COMPATIBILITY_NATIVE);
  // cufftSetCompatibilityMode(fwplanB,CUFFT_COMPATIBILITY_NATIVE);
  // cufftSetCompatibilityMode(bwplan,CUFFT_COMPATIBILITY_NATIVE);

  cufftExecR2C(fwplanA, d_inA, d_outA);
  cufftExecR2C(fwplanB, d_inB, d_outB);

  int blocksx = ceil((x->dim_x*(x->dim_y/2+1 )) / 256.0f);
  dim3 threads(256);
  dim3 grid(blocksx);
  // One complex product for each thread, scaled by the inverse of the
  // number of elements involved in the FFT
  thrust::transform(d_outA,d_outA + (x->dim_x * (x->dim_y/2+1)),d_outB,d_outA,pointwise_product(1.0f/(x->dim_x*x->dim_y)));
  cufftExecC2R(bwplan, d_outA, d_inA);
  cudaMemcpy2D(y->data_pointer,y->pitch, d_inA,0, y->dim_x*sizeof(cufftReal),y->dim_y,cudaMemcpyDeviceToHost);
}
int main()
{
  // Allocate 3 arrays on CPU
  int nr_rows_A, nr_cols_A, nr_rows_B, nr_cols_B, nr_rows_C, nr_cols_C;

  // for simplicity we are going to use square arrays
  nr_rows_A = nr_cols_A = nr_rows_B = nr_cols_B = nr_rows_C = nr_cols_C = 3;

  float *h_A = (float *)malloc(nr_rows_A * nr_cols_A * sizeof(float));
  float *h_B = (float *)malloc(nr_rows_B * nr_cols_B * sizeof(float));
  float *h_C = (float *)malloc((nr_rows_C/2+1) * nr_cols_C*2 * sizeof(float));

  // Allocate 3 arrays on GPU
  thrust::block_2d<float> d_A(nr_rows_A,nr_cols_A),d_B(nr_rows_B,nr_cols_B),d_C((nr_rows_C/2+1),nr_cols_C*2);

  thrust::sequence(d_A.begin(),d_A.end());
  thrust::sequence(d_B.begin(),d_B.end());

  // Optionally we can copy the data back on CPU and print the arrays
  d_A.download(&h_A);
  d_B.download(&h_B);
  std::cout << "A =" << std::endl;
  print_matrix(h_A, nr_rows_A, nr_cols_A);
  std::cout << "B =" << std::endl;
  print_matrix(h_B, nr_rows_B, nr_cols_B);

  // Multiply A and B on GPU
  fft_convolve(&d_A, &d_B, &d_C);

  // Copy (and print) the result on host memory
  d_C.download(&h_C);
  std::cout << "C =" << std::endl;
  print_matrix(h_C, nr_rows_C, nr_cols_C);

  free(h_A);
  free(h_B);
  free(h_C);
  return 0;
}
