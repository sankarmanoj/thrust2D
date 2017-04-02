#include <thrust/host_vector.h>
#include <thrust/for_each.h>
#include <thrust/transform.h>
#include <thrust/transform_reduce.h>
#include <thrust/reduce.h>
#include <thrust/system/omp/execution_policy.h>
#include "descent-struct.h"
#include <fstream>

int main(int argc, char **argv)
{
  std::ifstream values;
  values.open("./values.txt");
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
  float threshold_error = N;
  thrust::host_vector<float> d_Xvalues(xvalues,xvalues+D*N);
  thrust::host_vector<float> d_Yactual(y_actual,y_actual+N);
  thrust::host_vector<float> d_Ypredict(N);
  thrust::host_vector<float> d_error(N);
  thrust::host_vector<float> d_weights(D);
  d_weights.assign(weights, weights + D);
  thrust::host_vector<floatD> d_XD(N);
  thrust::host_vector<float> h_gradient(D);
  for(int i = 0; i<N;i++)
  {
    d_XD[i].data = d_Xvalues.data() + i;
    d_XD[i].N=N;
  }
  double start, end;
  int count = 0;
  float error;
  start = omp_get_wtime();
  do
  {
    float *ca_weights = d_weights.data();
    thrust::transform(thrust::omp::par,d_XD.begin(),d_XD.end(),d_Yactual.begin(),d_error.begin(),dotProductFunctor<float *>(D,ca_weights));
    error = thrust::transform_reduce(thrust::omp::par,d_error.begin(),d_error.end(),squareOp(),0,thrust::plus<float>());
    for(int i = 0; i<D;i++)
    {
      thrust::transform(thrust::omp::par,d_Xvalues.begin()+i*N,d_Xvalues.begin()+(i+1)*N,d_error.begin(),d_Ypredict.begin(),thrust::multiplies<float>());
      h_gradient[i]=thrust::reduce(thrust::omp::par,d_Ypredict.begin(),d_Ypredict.end())/N;
    }
    thrust::transform(thrust::omp::par,d_weights.begin(),d_weights.end(),h_gradient.begin(),d_weights.begin(),update_weights(learn));
    count++;
  }
  while(error>threshold_error);
  end = omp_get_wtime();
  printf("%f\n",(end-start)/count);
  return 0;
}
