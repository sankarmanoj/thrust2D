#include <thrust/iterator/functional_iterator.h>
#include <thrust/device_vector.h>
#include <thrust/shared_for_each.h>
#include <thrust/execution_policy.h>
#include <thrust/random.h>
#include <cstdlib>
#include <ctime>
#define D 500
#define N 10
__constant__ float weights[D];

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
    return index/N + 1;
  }
};
class squareOp
{
public:
  __host__ __device__ float operator() (float index) const
  {
    return index*index;
  }
};
class printFunctor
{
public:
  __host__ __device__ void operator() (long index) const
  {
    printf("PF - %ld\n",index);
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
    return weight - 0.001*gradient/N;
  }
};
int main()
{
 srand (time(NULL));
  float hostRandomArray[D*N];
  float hostYval[N];
  printf("Begin\n");
  for(int i = 0; i<D*N;i++)
  {
    hostRandomArray[i]=static_cast <float> (rand()) / static_cast <float> (RAND_MAX/5);
    // printf("%f\n",hostRandomArray[i]);
  }
  thrust::host_vector<float> host_gradient(D),host_weights(D);
  for(int i = 0; i<D;i++)
  {
    host_weights[i]=-0.1*(static_cast <float> (rand()) / static_cast <float> (RAND_MAX));
    // printf("%f\n",host_weights[i]);
  }
  for(int i = 0; i<N;i++)
  {
    hostYval[i]=5.0*(static_cast <float> (rand()) / static_cast <float> (RAND_MAX));
    // printf("%f\n",host_weights[i]);
  }
  thrust::device_vector<floatsD>Xinput(N);
  thrust::device_vector<float>Y_actual(N);
  thrust::device_vector<float>Xtemp(D*N);
  thrust::device_vector<float>Xtemp2(D*N);
  thrust::device_vector<float> y_pred(N),error(N);
  thrust::device_vector<int> emptyVector(D*N);
  thrust::device_vector<float> gradient(D);
  thrust::device_vector<float>errSquare(N);
  cudaMemcpy(Xinput.data().get(),hostRandomArray,sizeof(float)*D*N,cudaMemcpyHostToDevice);
  cudaMemcpy(Xtemp.data().get(),hostRandomArray,sizeof(float)*D*N,cudaMemcpyHostToDevice);
  cudaMemcpy(Y_actual.data().get(),hostYval,sizeof(float)*N,cudaMemcpyHostToDevice);
  int count = 0;
  while(count<10000)
  {
  cudaMemcpyToSymbol(weights,host_weights.data(),sizeof(float)*D);
  thrust::transform(Xinput.begin(),Xinput.end(),y_pred.begin(),dotProductFunctor());
  // for(int i = 0; i< N;i++)
  // {
  //   printf("%f\n",((float)Xtemp[i]));
  // }

  thrust::transform(y_pred.begin(),y_pred.end(),Y_actual.begin(),error.begin(),thrust::minus<float>());
  thrust::transform(error.begin(),error.end(),errSquare.begin(),squareOp());
  float errorVal = thrust::reduce(errSquare.begin(),errSquare.end());
  printf("@ %d Error = %f\n",count,errorVal);


  // auto xtb =   thrust::make_permutation_iterator(Xtemp2.begin(),thrust::functional_iterator<funcOp2>(funcOp2()));
  // auto erb = thrust::make_permutation_iterator(error.begin(),thrust::functional_iterator<funcOp>(funcOp()));
  //
  // thrust::transform(Xtemp.begin(),Xtemp.end(),erb,xtb, thrust::multiplies<float>());
  // thrust::transform(thrust::functional_iterator<funcOp3>(funcOp3()),thrust::functional_iterator<funcOp3>(funcOp3(),D*N),emptyVector.begin(),thrust::identity<long>());
  // // printf("Keys\n");
  // // for(int i = 0; i<3;i++)
  // // {
  // //   printf("%d\n",(int)emptyVector[i]);
  // // }
  // auto new_end = thrust::reduce_by_key(emptyVector.begin(),emptyVector.end(),
  //                                      Xtemp2.begin(),y_pred.begin(),gradient.begin());

  // printf("Size of gradient = %d\n",new_end.second-gradient.begin());

  // host_gradient = gradient;
  // printf("Gradient\n");
  // for(int i = 0; i<D;i++)
  // {
  //   printf("%f\n",(float)host_gradient[i]);
  // }
  // printf("Error\n");
  // for(int i = 0; i<N;i++)
  // {
  //   printf("%f\n",(float)error[i]);
  // }
  // printf("X values\n");
  // for(int i = 0; i<N;i++)
  // {
  //   for(int j = 0; j<D;j++)
  //   {
  //     printf("%f ",(float)Xtemp2[i*D + j]);
  //   }
  //   printf("|---------|");
  //   for(int j = 0; j<D;j++)
  //   {
  //     printf("%f ",(float)Xtemp[i*D+j]);
  //   }
  //   printf("\n");
  // }

  // thrust::transform(thrust::host,host_weights.begin(),host_weights.end(),host_gradient.begin(),host_weights.begin(),gradSub());
  // printf("alkdsf");
  count++;
  }
  return 0;
}
