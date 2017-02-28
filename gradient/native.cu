#include <fstream>
#include "native_kernel.h"
int main(int argc, char **argv)
{
  std::ifstream values;
  values.open("/dev/shm/values.txt");
  int D,N;
  int niter = atoi(argv[1]);
  float learn = atof(argv[2]);
  float *xvalues,*y_actual,*real_weights,*weights;
  values>>D>>N;
  xvalues = new float [D*N];
  for(int i = 0 ; i<N;i++)
  {
    for (int j = 0; j<D;j++)
    {
      values>>xvalues[j*N + i];
    }
  }
  y_actual = new float[N];
  for(int i = 0; i<N;i++)
  {
    values>>y_actual[i];
  }
  real_weights = new float[D];
  for(int i = 0; i<D;i++)
  {
    values>>real_weights[i];
  }
  weights = new float[D];
  for(int i = 0; i<D;i++)
  {
    values>>weights[i];
  }
  printf("Done Reading Data\n");
  float * d_xval, *d_yval,* d_weights, *d_error,*h_error;
  cudaMalloc((void**)&d_xval,sizeof(float)*D*N);
  cudaMalloc((void**)&d_weights,sizeof(float)*D);
  cudaMalloc((void**)&d_yval,sizeof(float)*N);
  cudaMalloc((void**)&d_error,sizeof(float)*N);
  cudaMemcpy(d_xval,xvalues,sizeof(float)*D*N,cudaMemcpyHostToDevice);
  cudaMemcpy(d_yval,(void *)y_actual,sizeof(float)*N,cudaMemcpyHostToDevice);
  cudaMemcpy(d_weights,(void *)weights,sizeof(float)*D,cudaMemcpyHostToDevice);
  int count = 0;
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start);
  printf("Loop Start\n");
  while(count<niter)
  {
    cudaMemcpyToSymbol(c_weights,d_weights,sizeof(float)*D,0,cudaMemcpyDeviceToDevice);
    getError<<<iDivUp(N,1024),1024>>>(N,D,d_xval,d_yval,d_error);
    updateWeight<<<iDivUp(D,1024),1024>>>(N,D,learn,d_xval,d_error,d_weights);
    count++;
  }
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  float time_in_ms;
  cudaEventElapsedTime(&time_in_ms,start,stop);
  h_error = new float[N];
  cudaMemcpy(h_error,d_error,sizeof(float)*N,cudaMemcpyDeviceToHost);
  for(int i = 0; i<100;i++)
  {
    printf("%f ",h_error[i]);
    if(i%10==0)
      printf("\n");
  }
  printf("Compute Time = %f\n",time_in_ms);
  // sdiff = sqrt(sdiff/D);
  // printf("Final Error = %f\n",sdiff);

}
