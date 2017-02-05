#include <thrust/device_vector.h>
#include <thrust/iterator/permutation_iterator.h>
#include <thrust/sequence.h>
#include <thrust/for_each.h>
#include <thrust/random.h>
#include <thrust/reduce.h>

#define D 20
#define N 10000
__constant__ float weights[D];
struct indexfunctor1
{
  __device__ void operator() (int &i)
  {
    i= i/D;
  }
};
struct indexfunctor2
{
  __device__ void operator() (int &i)
  {
    i= (i%D)*N + i/D;
  }
};
struct GenRand
{
    __device__ float operator() (float idx)
    {
        thrust::default_random_engine randEng;
        thrust::uniform_real_distribution<float> uniDist;
        randEng.discard(idx);
        return uniDist(randEng)*5;
    }
};
struct dotFunctor
{
    __device__ float operator() (float &input,int &index)
    {
      return input*weights[index%D];
    }
};
struct dotFunctor2
{
    __device__ float operator() (float &input,float &index)
    {
      float returnval = input*index;
      // printf("%f*%f=%f\n",input,index,returnval);
      return returnval;
    }
};

int main()
{

  thrust::device_vector<int> map(D*N);
  thrust::device_vector<int> tap(N*D);
  thrust::sequence(map.begin(),map.end());
  thrust::for_each(map.begin(),map.end(),indexfunctor1());
  thrust::for_each(tap.begin(),tap.end(),indexfunctor2());
  thrust::device_vector<float>Xinput(D*N);
  thrust::device_vector<float>Y_actual(N);
  float host_weights[] = {2,3,4,5,2,2,3,4,5,2,2,3,4,5,2,2,3,4,5,2,2,3,4,5,2,2,3,4,5,2,2,3,4,5,2,2,3,4,5,2,2,3,4,5,2,2,3,4,5,2,2,3,4,5,2};
  cudaMemcpyToSymbol(weights,host_weights,sizeof(float)*D);
  thrust::transform(thrust::make_counting_iterator(0),thrust::make_counting_iterator(D*N),Xinput.begin(),GenRand());
  thrust::transform(thrust::make_counting_iterator(0),thrust::make_counting_iterator(N),Y_actual.begin(),GenRand());

  thrust::device_vector<float>Xtemp(D*N);
  thrust::transform(Xinput.begin(),Xinput.end(),thrust::make_counting_iterator(0),Xtemp.begin(),dotFunctor());
  // for(int i = 0; i<30;i++)
  // {
  //  printf("%f*%f=%f\n",(float)Xinput[i],host_weights[i%D],(float)Xtemp[i]);
  // }
  thrust::device_vector<int> map_out(N);
  thrust::device_vector<float> y_pred(N),error(N);
  thrust::pair<thrust::detail::normal_iterator<thrust::device_ptr<int> >,thrust::detail::normal_iterator<thrust::device_ptr<float> > > new_end;
  new_end = thrust::reduce_by_key(map.begin(),map.end(),Xtemp.begin(),map_out.begin(),y_pred.begin());
  // for(int i = 0; i<N;i++)
  // {
  //  printf("%f=%f___%f-%f-%f-%f-%f\n",(float) y_pred[i],(float) Xtemp[i*D]+(float) Xtemp[i*D+1]+(float) Xtemp[i*D+2]+(float) Xtemp[i*D+3]+(float) Xtemp[i*D+4],
  //                                               (float) Xtemp[i*D],(float) Xtemp[i*D+1],(float) Xtemp[i*D+2],(float) Xtemp[i*D+3],(float) Xtemp[i*D+4]);
  // }
  thrust::transform(y_pred.begin(),y_pred.end(),Y_actual.begin(),error.begin(),thrust::minus<float>());
  // for(int i = 0; i<N;i++)
  // {
  //   printf("%f-%f=%f\n",(float)y_pred[i],(float)Y_actual[i],(float)error[i]);
  // }
  // thrust::transform(thrust::make_permutation_iterator(Xinput.begin(),tap.begin()),
  //                   thrust::make_permutation_iterator(Xinput.end(),tap.end()),
  //                   thrust::make_permutation_iterator(error.begin(),map.begin()),Xtemp.begin(),dotFunctor2());
  // for(int i = 0; i<D;i++)
  // {
  //   for(int j = 0;j<N;j++)
  //     {
  //         printf("%f*%f=%f\n",(float)Xinput[i*N + j],(float)error[j],(float)Xtemp[i*N + j]);
  //     }
  // }

  return 0;
}
