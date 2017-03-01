#include <thrust/device_vector.h>
#include <thrust/constant_memory.h>
#include <thrust/shared_for_each.h>
#include "descent-struct.h"
#include <fstream>

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
  // printf("Done Reading Data\n");
  thrust::device_vector<float> d_Xvalues(xvalues,xvalues+D*N);
  thrust::device_vector<float> d_Yactual(y_actual,y_actual+N);
  thrust::device_vector<float> d_Ypredict(N);
  thrust::device_vector<float> d_error(N);
  thrust::host_vector<floatD> h_XD(N);
  thrust::host_vector<float> h_gradient(D);
  thrust::host_vector<float> h_error(N);
  for(int i = 0; i<N;i++)
  {
    h_XD[i].data = d_Xvalues.data().get() + i;
    h_XD[i].N=N;
  }
  thrust::device_vector<floatD> d_XD;
  d_XD = h_XD;
  int count = 0;
  while(count<niter)
  {
    float* ca_weights = thrust::get_constant_memory_pointer(weights,weights+D,cudaMemoryTypeHost);
    // float *ca_weights = d_weights.data().get();
    thrust::transform(thrust::cuda::shared,d_XD.begin(),d_XD.end(),d_Ypredict.begin(),dotProductFunctor(D,ca_weights));
    thrust::transform(thrust::cuda::shared,d_Ypredict.begin(),d_Ypredict.end(),d_Yactual.begin(),d_error.begin(),thrust::minus<float>());
    // for (size_t i = 0; i < 10; i++)
    // {
    //   printf("%f\n",(float) d_Ypredict[i]);
    // }
    printf("%d Error = %.9f\n",count,(float)thrust::transform_reduce(thrust::cuda::shared,d_error.begin(),d_error.end(),squareOp(),0,thrust::plus<float>())/N);
    for(int i = 0; i<30;i++)
    {
      h_gradient[i]=thrust::transform_reduce(thrust::cuda::shared,d_Xvalues.begin()+i*N,d_Xvalues.begin()+(i+1)*N,d_error.begin(),thrust::multiplies<float>())/N;
      // h_gradient[i]=thrust::reduce(thrust::cuda::shared,d_Ypredict.begin(),d_Ypredict.end())/N;
      // printf("%f\n",h_gradient[i]);
    }
    for(int i = 0; i<D;i++)
    {
      weights[i] = weights[i] - learn*h_gradient[i];
    }
    count++;
  }
  h_error = d_error;
  for(int i = 0; i<100;i++)
  {
    printf("%f ",h_error[i]);
    if(i%10==0)
      printf("\n");
  }
  // printf("Compute Time = %f\n",time_in_ms);
  // sdiff = sqrt(sdiff/D);
  // printf("Final Error = %f\n",sdiff);
  // delete xvalues;
  // delete real_weights;
  // delete y_actual;
  // delete weights;
  return 0;
}
