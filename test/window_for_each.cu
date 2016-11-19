#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <thrust/window_transform.h>
#define X 32
#define Y 32
#define XSTART 0
#define XRANGE 10
#define YSTART 0
#define YRANGE 10

class printFunctor : public thrust::shared_binary_window_transform_functor<float>
{
public:
  __device__ void operator() (const thrust::window_2d<float> &inputWindow,const thrust::window_2d<float> &inputWindow1, const thrust::window_2d<float> &outputWindow) const
  {
  printf("%f=%f+%f\n",(float)outputWindow[0][0],(float) inputWindow[0][0],(float)inputWindow1[0][0]);
     outputWindow[0][0]=inputWindow[0][0] + inputWindow1[0][0];
  }
};

class printFunctor1 : public thrust::shared_unary_window_transform_functor<float>
{
public:
  __device__ void operator() (const thrust::window_2d<float> &inputWindow, const thrust::window_2d<float> &outputWindow) const
  {
    printf("%f - %d - %d\n",tex2D<float>(inputWindow.texref,blockIdx.x*blockDim.x + threadIdx.x,blockIdx.y*blockDim.y + threadIdx.y),blockIdx.x*blockDim.x + threadIdx.x,blockIdx.y*blockDim.y + threadIdx.y);
  }
};

class forEachFunctor : public thrust::shared_window_for_each_functor<float>
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
  srand(13);
  thrust::block_2d<float> inBlock(X,Y);
  thrust::block_2d<float> outBlock(X,Y);
  thrust::sequence(inBlock.begin(),inBlock.end());
  thrust::fill(outBlock.begin(),outBlock.end(),777.0f);
  thrust::window_vector<float> myVector = thrust::window_vector<float>(&inBlock,3,3,2,2);
  thrust::window_vector<float> mySecondVector = thrust::window_vector<float>(&outBlock,3,3,2,2);
  // for (int j=YSTART;j<YSTART + YRANGE;j++)
  // {
  //   for (int i=XSTART; i<XSTART + XRANGE;i++)
  //   {
  //       int2 pos = make_int2(i,j);
  //       printf("%5.0f ",inBlock[pos]);
  //   }
  //   std::cout<<"\n";
  // }
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start);
  // thrust::transform(thrust::cuda::shared,myVector.begin(),myVector.end(),myVector1.begin(),mySecondVector.begin(),printFunctor());
  thrust::transform_texture(thrust::cuda::shared,myVector.begin(),myVector.end(),mySecondVector.begin(),printFunctor1());
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  float milliseconds = 0;
  cudaEventElapsedTime(&milliseconds, start, stop);
  printf("\nTime Taken = %f\n",milliseconds);
  //
  // for (int j=YSTART;j<YSTART + YRANGE;j++)
  // {
  //   for (int i=XSTART; i<XSTART + XRANGE;i++)
  //   {
  //       int2 pos = make_int2(i,j);
  //       printf("%5.0f  ",(float)outBlock[pos]);
  //   }
  //   std::cout<<"\n";
  // }
}
