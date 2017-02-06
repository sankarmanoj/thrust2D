#include <thrust/iterator/functional_iterator.h>
#include <thrust/device_vector.h>
#include <thrust/shared_for_each.h>
#include <thrust/execution_policy.h>
#include <thrust/random.h>
#include <cstdlib>
#include <ctime>
#define D 32
#define N 10000
__constant__ float weights[D];
struct GenRand
{
    __host__ __device__ float operator() (float idx)
    {
        thrust::default_random_engine randEng;
        thrust::uniform_real_distribution<float> uniDist;
        randEng.discard(idx);
        return uniDist(randEng)*5;
    }
};
class funcOp
{
public:
  __host__ __device__ long operator() (long index) const
  {
    return index/D;
  }
};
class funcOp2
{
public:
  __host__ __device__ long operator() (long index) const
  {
    return index/D + (index%D)*N;
  }
};
class funcOp3
{
public:
  __host__ __device__ long operator() (long index) const
  {
    return index/N;
  }
};
struct floatsD
{
float data[D];
__host__ __device__ float& operator[] (int index)
{
  return data[index];
}
};

struct dotProductFunctor
{
  __device__ float operator() (floatsD &vector)
  {
    float temp;
    for(int i = 0; i<D;i++)
    {
      temp+=vector[i]*weights[i];
    }
    return temp;
  }
};
struct gradSub
{
  float operator() (float &weight, float&gradient)
  {
    return weight - 0.00001*gradient/N;
  }
};
int main()
{
  srand (static_cast <unsigned> (time(0)));
  float hostRandomArray[D*N];
  for(int i = 0; i<D*N;i++)
  {
    hostRandomArray[i]=static_cast <float> (rand()) / static_cast <float> (RAND_MAX/5);
  }
  thrust::host_vector<float> host_gradient(D),host_weights(D);
  for(int i = 0; i<D;i++)
  {
    host_weights[i]=0.1*(static_cast <float> (rand()) / static_cast <float> (RAND_MAX));
  }
  thrust::device_vector<floatsD>Xinput(N);
  thrust::device_vector<float>Y_actual(N);
  thrust::device_vector<float>Xtemp(D*N);
  thrust::device_vector<float>Xtemp2(D*N);
  thrust::device_vector<float> y_pred(N),error(N);
  thrust::device_vector<float> gradient(D);
  cudaMemcpy(Xinput.data().get(),hostRandomArray,sizeof(float)*D*N,cudaMemcpyHostToDevice);
  cudaMemcpy(Xtemp.data().get(),Xinput.data().get(),sizeof(float)*D*N,cudaMemcpyDeviceToDevice);
  thrust::transform(thrust::make_counting_iterator(0),thrust::make_counting_iterator(N),Y_actual.begin(),GenRand());
  int count = 0;
  while(count<1000)
  {
  cudaMemcpyToSymbol(weights,host_weights.data(),sizeof(float)*D);
  thrust::transform(Xinput.begin(),Xinput.end(),y_pred.begin(),dotProductFunctor());
  // for(int i = 0; i< 100;i++)
  // {
  //   printf("%f\n",((floatD)Xinput[i])[0]);
  // }
  for(int i = 0; i< 10;i++)
  {
    printf("%f-%f\n",(float)Y_actual[i],(float)y_pred[i]);
  }
  printf("-----\n");
  thrust::transform(y_pred.begin(),y_pred.end(),Y_actual.begin(),error.begin(),thrust::minus<float>());
  auto xtb =   thrust::make_permutation_iterator(Xtemp2.begin(),thrust::functional_iterator<funcOp2>(funcOp2()));
  auto erb = thrust::make_permutation_iterator(error.begin(),thrust::functional_iterator<funcOp>(funcOp()));

  thrust::transform(Xtemp.begin(),Xtemp.end(),erb,xtb, thrust::multiplies<float>());
  auto new_end = thrust::reduce_by_key(thrust::functional_iterator<funcOp3>(funcOp3()),
                                       thrust::functional_iterator<funcOp3>(funcOp3(),D*N),
                                       Xtemp2.begin(),Xtemp.begin(),gradient.begin());
  // printf("Size of gradient = %d\n",new_end.second-gradient.begin());
  host_gradient = gradient;
  thrust::transform(thrust::host,host_weights.begin(),host_weights.end(),host_gradient.begin(),host_weights.begin(),gradSub());
  // printf("alkdsf");
  count++;
  }
  return 0;
}
