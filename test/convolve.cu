#include <thrust/window_transform.h>
#include <thrust/generate.h>
#include <thrust/sequence.h>
#include <thrust/execution_policy.h>
#include <iostream>
int main(int argc, char** argv)
{
    int x;
    x = atoi(argv[1]);
    thrust::block_2d<float> inBlock(x,x);
    thrust::sequence(inBlock.begin(),inBlock.end());
    for (int i=0; i<x;i++)
    {
      for (int j=0;j<x  ;j++)
      {
          std::cout<<inBlock[make_int2(j,i)]<<" ";
      }
      std::cout<<"\n";
    }
    float kernel[3] = {0.25,1,0.25};
    thrust::convolve(thrust::cuda::texture,&inBlock,kernel);
    for (int i=0; i<x;i++)
    {
      for (int j=0;j<x;j++)
      {
            std::cout<<inBlock[make_int2(j,i)]<<" ";
      }
      std::cout<<"\n";
    }
}
