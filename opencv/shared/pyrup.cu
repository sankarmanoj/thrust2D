#include <opencv2/opencv.hpp>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#include <math.h>
using namespace cv;
inline float gauss(int x, int y, int mid, float sigma )
{
  float temp = (pow(x-mid,2)+pow(y-mid,2))/sigma;
  temp= exp(-temp);
  return temp;
}
void getGaussianKernelBlock(int dim, float sigma,thrust::block_2d<float> &GaussianKernel )
{
  assert(dim%2);
  int mid = (dim-1)/2;
  float total = 0;
  for(int i = 0; i<dim;i++)
  {
    for(int j = 0; j<dim;j++)
    {
      total+=gauss(i,j,mid,sigma);
      (GaussianKernel)[i][j]=gauss(i,j,mid,sigma);
    }
  }
  float newTotal=0;
  for(int i = 0; i<dim;i++)
  {
    for(int j = 0; j<dim;j++)
    {
      (GaussianKernel)[i][j]/=total;
      newTotal +=  (GaussianKernel)[i][j];
    }
  }
}
// class pyrdownTransformFunctor
// {
// public:
//   thrust::block_2d<float> *outBlock;
//
// pyrdownTransformFunctor(thrust::block_2d<float> * outBlock)
//   {
//     this->outBlock = outBlock->device_pointer;
//   }
//   __device__ void operator() (const thrust::window_2d<float> &inputWindow) const
//   {
//     int x_out, y_out;
//     x_out = inputWindow.start_x*2;
//     y_out = inputWindow.start_y*2;
//     // if(threadIdx.x%31==0)
//     //   printf("%d-%d",inputWindow.start_x,inputWindow.start_y);
//     (*outBlock)[y_out][x_out] = inputWindow[0][0];
//   }
// };

class convolutionFunctor //:public thrust::shared_unary_window_transform_functor<float>
{
public:
  int dim;
  thrust::block_2d<float> * kernel;
  thrust::block_2d<float> * inBlock;
  convolutionFunctor( thrust::block_2d<float> * kernel, thrust::block_2d<float> * inBlock,int dim)
  {
    this->dim =dim;
    this->kernel = kernel;
    this->inBlock = inBlock;
  }
  __device__ void operator() (const thrust::window_2d<float> & window) const
  {
    window[1][1] = (*inBlock)[window.start_y/2][window.start_x/2];
    float temp = 0;
    for(int i = 0; i< dim; i++)
    {
      for(int j = 0; j<dim; j++)
      {
        temp+=window[i][j]*(*kernel)[i][j];
      }
    }
    window[1][1]=temp;
  }
};

int main(int argc, char const *argv[])
{
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  int dim = 3;
  thrust::block_2d<float> kernel(dim,dim);
  getGaussianKernelBlock(dim,5.0,kernel);
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim1 = 512;
  if(argc ==2)
  {
    dim1 = atoi(argv[1]);
  }
  resize(small,image,Size(dim1,dim1));
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::block_2d<float> float_image_block (image.cols,image.rows);
  thrust::block_2d<float> outBlock (image.cols*2,image.rows*2,0.0f);
  float * img = (float * )malloc(sizeof(float)*(image_block.end()-image_block.begin()));
  float * img_out = (float * )malloc(sizeof(float)*(outBlock.end()-outBlock.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  thrust::window_vector<float> inputVector(&float_image_block,1,1,1,1);
  thrust::window_vector<float> inputVector1(&outBlock,dim,dim,1,1);
  thrust::for_each(thrust::cuda::shared,inputVector1.begin(),inputVector1.end(),convolutionFunctor(kernel.device_pointer,float_image_block.device_pointer,dim));
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(outBlock.end()-outBlock.begin()));
  cudaMemcpy(img_out,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(outBlock.end()-outBlock.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows*4;i++)
  {
    outputFloatImageData[i]=(unsigned char)img_out[i];
  }
  Mat output (Size(image.cols*2,image.rows*2),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("pyrup.png",output);
  return 0;
}
