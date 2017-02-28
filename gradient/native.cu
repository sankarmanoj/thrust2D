#include <fstream>
__constant__ float c_weights[10000];
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
  float * d_xval, *d_yval,* d_weights;
  cudaMalloc((void**)&d_xval,sizeof(float)*D*N);
  cudaMalloc((void**)&d_weights,sizeof(float)*D);
  cudaMalloc((void**)&d_yval,sizeof(float)*N);
  cudaMemcpy(d_xval,xvalues,sizeof(float)*D*N,cudaMemcpyHostToDevice);
  cudaMemcpy(d_yval,(void *)y_actual,sizeof(float)*N,cudaMemcpyHostToDevice);
  cudaMemcpy(d_weights,(void *)weights,sizeof(float)*D,cudaMemcpyHostToDevice);
  int count = 0;
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start);
  while(count<niter)
  {
    cudaMemcpyToSymbol(c_weights,d_weights,sizeof(float)*D,cudaMemcpyDeviceToDevice);
  }


}
