#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <thrust/window_for_each.h>
#include <thrust/window_transform.h>
#define X 70
#define Y 70
#define XSTART 25
#define XRANGE 40
#define YSTART 25
#define YRANGE 40

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
    outputWindow[1][1]=inputWindow[make_int2(0,0)]+inputWindow[make_int2(0,1)]+inputWindow[make_int2(2,1)]+
                inputWindow[make_int2(1,0)]+inputWindow[make_int2(1,2)]+
                inputWindow[make_int2(0,0)]+inputWindow[make_int2(2,2)]+
                inputWindow[make_int2(0,2)]+inputWindow[make_int2(2,0)];
    printf("@ %dx%d, val = %d (%d x %d):(%d x %d)\n",outputWindow.start_x,outputWindow.start_y,outputWindow[1][1],blockIdx.x,blockIdx.y,threadIdx.x,threadIdx.y);

  }
};

class forEachFunctor
{
public:

  __device__ void operator() (const thrust::window_2d<int> &inputWindow) const
  {
     inputWindow[0][0]=inputWindow.start_y*inputWindow.start_x;
     printf("%d x %d\n",inputWindow.start_y,inputWindow.start_x);
  }
};
int main()
{
  srand(13);
  thrust::block_2d<int> inBlock(X,Y);
  thrust::block_2d<int> outBlock(X,Y);
  thrust::host_block_2d<int> h_inBlock(X,Y);
  thrust::host_block_2d<int> h_outBlock(X,Y);
  thrust::fill(inBlock.begin(),inBlock.end(),1);

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
  thrust::transform(thrust::cuda::shared,myVector.begin(),myVector.end(),mySecondVector.begin(),printFunctor1());
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  float milliseconds = 0;
  cudaEventElapsedTime(&milliseconds, start, stop);
  h_outBlock = outBlock;
  printf("\nTime Taken = %f\n",milliseconds);

  printf("   " );
  for (int i=XSTART; i<XSTART + XRANGE;i++)
  {
      printf("%d  ",i);
  }
  std::cout<<"\n";

  for (int j=YSTART;j<YSTART + YRANGE;j++)
  {printf("%d  ",j);
    for (int i=XSTART; i<XSTART + XRANGE;i++)
    {
        int2 pos = make_int2(i,j);
        printf("%d   ",(int)h_outBlock[pos]);

    }
    std::cout<<"\n";
  }
}
