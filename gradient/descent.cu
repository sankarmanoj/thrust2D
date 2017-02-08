#include <thrust/iterator/functional_iterator.h>
#include <thrust/device_vector.h>
#include <thrust/shared_for_each.h>
#include <thrust/execution_policy.h>
#include <thrust/random.h>
#include "descent-struct.h"
#include <fstream>

int main()
{
  std::ifstream values;
  values.open("values.txt");
  int D,N;
  float *xvalues,*y_actual,*real_weights,*weights;
  values>>D>>N;
  printf("D=%d N=%d\n",D,N);
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
  thrust::device_vector<float> d_Xvalues(xvalues,xvalues+D*N);
  thrust::device_vector<float> d_Yactual(y_actual,y_actual+N);
  thrust::device_vector<float> d_Ypredict(N);
  thrust::device_vector<float> d_error(N);
  thrust::device_vector<float> d_weights(weights,weights+D);
  thrust::host_vector<floatD> h_XD(N);
  thrust::host_vector<float> h_gradient(D);
  for(int i = 0; i<N;i++)
  {
    h_XD[i].data = d_Xvalues.data().get() + i;
    h_XD[i].N=N;
  }
  thrust::device_vector<floatD> d_XD;
  d_XD = h_XD;
  int count = 0;
  while(count<10)
  {
    cudaMemcpyToSymbol(c_weights,weights,sizeof(float)*D);
    thrust::transform(d_XD.begin(),d_XD.end(),d_Ypredict.begin(),dotProductFunctor(D));
    thrust::transform(d_Ypredict.begin(),d_Ypredict.end(),d_Yactual.begin(),d_error.begin(),thrust::minus<float>());
    printf("%d Error = %f\n",count,sqrt(thrust::transform_reduce(d_error.begin(),d_error.end(),squareOp(),0,thrust::plus<float>())/N));
    for(int i = 0; i<D;i++)
    {
      thrust::transform(d_Xvalues.begin()+i*N,d_Xvalues.begin()+(i+1)*N,d_error.begin(),d_Ypredict.begin(),thrust::multiplies<float>());
      h_gradient[i]=thrust::reduce(d_Ypredict.begin(),d_Ypredict.end())/N;
    }
    for(int i = 0; i<D;i++)
    {
      weights[i] = weights[i] -0.001*h_gradient[i];
    }
    count++;
  }
  float sdiff=0.0;
  for (int i=0; i<D; i++)
  {
    sdiff += (weights[i]-real_weights[i])*(weights[i]-real_weights[i]);
  }
  sdiff = sqrt(sdiff/D);
  printf("Final Error = %f\n",sdiff);
}
