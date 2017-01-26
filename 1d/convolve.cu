#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>

#define RG 10
#define USECPSEC 1000000ULL
#define nTPB 256
#define DSIZE (32768*1024)
#define FSIZE 17

//cuda error checking macros
#ifdef DEBUG
#define CUDA_CALL(F)  if( (F) != cudaSuccess ) \
  {printf("Error %s at %s:%d\n", cudaGetErrorString(cudaGetLastError()), \
   __FILE__,__LINE__); exit(-1);}
#define CUDA_CHECK()  if( (cudaPeekAtLastError()) != cudaSuccess ) \
  {printf("Error %s at %s:%d\n", cudaGetErrorString(cudaGetLastError()), \
   __FILE__,__LINE__-1); exit(-1);}
#else
#define CUDA_CALL(F) (F)
#define CUDA_CHECK()
#endif


typedef float mytype;
// host function to compute convolution reference results
void conv(const mytype *A, const mytype *B, mytype* out, int N, int P) {
// P is assumed to be odd, and greater than 1
    int rb = (P-1)/2;
    int lb = -rb;
    for (int i = rb; i < N-rb; ++i)
        for (int j = lb; j <= rb; ++j)
            out[i] += A[i+j] * B[j+rb];
}
// timing measurement function
unsigned long long dtime_usec(unsigned long long prev){
  timeval tv1;
  gettimeofday(&tv1,0);
  return ((tv1.tv_sec * USECPSEC)+tv1.tv_usec) - prev;
}
// convolution GPU kernel - not using shared memory
// Task 2
__global__ void conv_Kernel(const mytype * __restrict__ A, const mytype * __restrict__ B, mytype *C, const int N, const int P){
    int idx = threadIdx.x+blockDim.x*blockIdx.x;
    int radius = (P-1)/2;
    if ((idx < (N-radius)) && (idx >= radius)){
      mytype my_sum = 0;
      for (int j = -radius; j <= radius; j++)
        my_sum += A[idx+j]*B[j+radius];
      C[idx] = my_sum;
    }
}

__global__ void conv_shared_Kernel(const mytype * __restrict__ A, const mytype * __restrict__ B, mytype *C, const int N, const int P){
    __shared__ mytype sA[nTPB+FSIZE];
    __shared__ mytype sB[FSIZE];
    int idx = threadIdx.x+blockDim.x*blockIdx.x;
    int radius = (P-1)/2;
    int lidx = threadIdx.x + radius;
    if (threadIdx.x < P) sB[threadIdx.x] = B[threadIdx.x];
    if (idx < N){
      sA[lidx] = A[idx];
      if (threadIdx.x < radius) {
        if (idx >= radius)   sA[threadIdx.x] = A[idx - radius];
        if ((idx + nTPB)< N) sA[nTPB + lidx] = A[idx + nTPB];}}
    __syncthreads();
    if ((idx < (N-radius)) && (idx >= radius)){
      mytype my_sum = 0;
      for (int j = -radius; j <= radius; j++)
        my_sum += sA[lidx+j] * sB[j+radius];
      C[idx] = my_sum;
    }
}


int main(int argc, char *argv[]){

  mytype *d_A, *A, *d_B, *B, *d_C, *C, *h_C;
  int my_N = DSIZE;
  int my_P = FSIZE;
// allocate host data
  A   = (mytype *)malloc(my_N*sizeof(mytype));
  B   = (mytype *)malloc(my_P*sizeof(mytype));
  C   = (mytype *)malloc(my_N*sizeof(mytype));
  h_C = (mytype *)malloc(my_N*sizeof(mytype));
// allocate device data
  CUDA_CALL(cudaMalloc(&d_A, my_N*sizeof(mytype)));
  CUDA_CALL(cudaMalloc(&d_B, my_P*sizeof(mytype)));
  CUDA_CALL(cudaMalloc(&d_C, my_N*sizeof(mytype)));
//initialize host input data
  for (int i=0; i < my_N; i++)
    A[i] = rand()%RG;
  for (int i=0; i < my_P; i++)
    B[i] = 1;
//zero out host result data
  for (int i=0; i < my_N; i++){
    C[i]   = 0;
    h_C[i] = 0;}
//begin timing for host reference function
  unsigned long long cpu_time = dtime_usec(0);
  conv(A, B, C, my_N, my_P);
  cpu_time = dtime_usec(cpu_time);
//initialize device result data
  CUDA_CALL(cudaMemset(d_C, 0, my_N*sizeof(mytype)));
//begin timing for device function
  unsigned long long gpu_time = dtime_usec(0);
//copy host input data to device
  CUDA_CALL(cudaMemcpy(d_A, A, my_N*sizeof(mytype), cudaMemcpyHostToDevice));
  CUDA_CALL(cudaMemcpy(d_B, B, my_P*sizeof(mytype), cudaMemcpyHostToDevice));
//run convolution kernel on GPU
  conv_shared_Kernel<<<(my_N+nTPB-1)/nTPB,nTPB>>>(d_A, d_B, d_C, my_N, my_P);
  CUDA_CHECK();
//copy results from device to host
  CUDA_CALL(cudaMemcpy(h_C, d_C, my_N*sizeof(mytype), cudaMemcpyDeviceToHost));
  gpu_time = dtime_usec(gpu_time);
//check validity of results
  for (int i = 0; i < my_N; i++) if (C[i] != h_C[i]) {printf("FAIL at %d, cpu: %f, gpu %f\n", i, C[i], h_C[i]); return 1;}
//print timing and speed comparison
  printf("PASS.  cpu time: %ldus, gpu time: %ldus\n", cpu_time, gpu_time);
  printf("Speedup: cpu/gpu = %f\n", cpu_time/(float)gpu_time);
//all host and device allocated data will be implicitly freed at program termination
  return 0;
} 
