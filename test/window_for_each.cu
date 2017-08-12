#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <thrust/window_transform.h>
#define X 32
#define Y 32
#define XSTART 10
#define XRANGE 20
#define YSTART 10
#define YRANGE 20

class printFunctor
{
public:
  __device__ void operator() (const thrust::window_2d<int> &inputWindow,const thrust::window_2d<int> &inputWindow1, const thrust::window_2d<int> &outputWindow) const
  {
  printf("%f=%f+%f\n",(int)outputWindow[0][0],(int) inputWindow[0][0],(int)inputWindow1[0][0]);
     outputWindow[0][0]=inputWindow[0][0] + inputWindow1[0][0];
  }
};

class printFunctor1
{
public:
  __device__ void operator() (const thrust::window_2d<int> &inputWindow, const thrust::window_2d<int> &outputWindow) const
  {
    // printf("%f - %d - %d\n",tex2D<int>(inputWindow.texref,blockIdx.x*blockDim.x + threadIdx.x,blockIdx.y*blockDim.y + threadIdx.y),blockIdx.x*blockDim.x + threadIdx.x,blockIdx.y*blockDim.y + threadIdx.y);
    outputWindow[0][0]=inputWindow[make_int2(1,1)];
  }
};

class forEachFunctor
{
public:

  __device__ void operator() (const thrust::window_2d<int> &inputWindow) const
  {
     inputWindow[0][0]=934;
    //  printf("%d %d %d\n",outputWindow[0][0], inputWindow[0][0],inputWindow1[0][0]);
  }
};
int main()
{
  srand(13);
  thrust::block_2d<int> inBlock(X,Y);
  thrust::block_2d<int> outBlock(X,Y);
  thrust::host_block_2d<int> h_inBlock(X,Y);
  thrust::host_block_2d<int> h_outBlock(X,Y);
  thrust::sequence(inBlock.begin(),inBlock.end());
  thrust::fill(outBlock.begin(),outBlock.end(),777.0f);
  h_inBlock =inBlock;
  thrust::window_vector<int> myVector = thrust::window_vector<int>(&inBlock,3,3,1,1);
  thrust::window_vector<int> mySecondVector = thrust::window_vector<int>(&outBlock,3,3,1,1);
  for (int j=YSTART;j<YSTART + YRANGE;j++)
  {
    for (int i=XSTART; i<XSTART + XRANGE;i++)
    {
        int2 pos = make_int2(i,j);
        printf("%d ",h_inBlock[pos]);
    }
    std::cout<<"\n";
  }
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start);
  // thrust::transform(thrust::cuda::shared,myVector.begin(),myVector.end(),myVector1.begin(),mySecondVector.begin(),printFunctor());
  thrust::transform(thrust::cuda::texture,myVector.begin(),myVector.end(),mySecondVector.begin(),printFunctor1());
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  float milliseconds = 0;
  cudaEventElapsedTime(&milliseconds, start, stop);
  h_outBlock = outBlock;
  printf("\nTime Taken = %f\n",milliseconds);

  for (int j=YSTART;j<YSTART + YRANGE;j++)
  {
    for (int i=XSTART; i<XSTART + XRANGE;i++)
    {
        int2 pos = make_int2(i,j);
        printf("%d  ",(int)h_outBlock[pos]);
    }
    std::cout<<"\n";
  }
}
