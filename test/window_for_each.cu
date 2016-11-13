#include <thrust/sequence.h>
#include <thrust/execution_policy.h>
#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#define X 10
#define Y 10
#define XSTART 9990
#define XRANGE 10
#define YSTART 990
#define YRANGE 10

class printFunctor
{
public:
  __device__ void operator() (const thrust::window_2d<float> &inputWindow,const thrust::window_2d<float> &inputWindow1, const thrust::window_2d<float> &outputWindow) const
  {
  printf("%f=%f+%f\n",(float)outputWindow[0][0],(float) inputWindow[0][0],(float)inputWindow1[0][0]);
     outputWindow[0][0]=inputWindow[0][0] + inputWindow1[0][0];
  }
};

class printFunctor1
{
public:
  __device__ void operator() (const thrust::window_2d<float> &inputWindow, const thrust::window_2d<float> &outputWindow) const
  {
     outputWindow[0][0]=inputWindow[0][0];
    //  printf("%d %d %d\n",outputWindow[0][0], inputWindow[0][0],inputWindow1[0][0]);
  }
};

class forEachFunctor
{
public:

  __device__ void operator() (const thrust::window_2d<float> &inputWindow) const
  {
     inputWindow[0][0]=934;
    //  printf("%d %d %d\n",outputWindow[0][0], inputWindow[0][0],inputWindow1[0][0]);
  }
};
int main()
{
  thrust::block_2d<float> outBlock(X,Y,0.0);
  thrust::window_vector<float> mySecondVector = thrust::window_vector<float>(&outBlock,3,3,1,1);
  // thrust::transform(thrust::cuda::shared,myVector.begin(),myVector.end(),myVector1.begin(),mySecondVector.begin(),printFunctor());
  // thrust::transform(thrust::cuda::shared,myVector.begin(),myVector.end(),mySecondVector.begin(),printFunctor1());
  thrust::for_each(mySecondVector.begin(),mySecondVector.end(),forEachFunctor());

  for (int j=0;j<Y;j++)
  {
    for (int i=0;i<X;i++)
    {
        int2 pos = make_int2(i,j);
        printf("%5.0f  ",(float)outBlock[pos]);
    }
    std::cout<<"\n";
  }
}
