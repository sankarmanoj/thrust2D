#include <opencv2/opencv.hpp>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#include <math.h>

#define PI 3.14159
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
  printf("Total = %f,newTotal=%f\n",total,newTotal);
}

class pyrdownTransformFunctor : public thrust::shared_window_for_each_functor<float>
{
public:
  thrust::block_2d<float> *inBlock;

pyrdownTransformFunctor(thrust::block_2d<float> * inBlock)
  {
    this->inBlock = inBlock->device_pointer;
  }
  __device__ void operator() (const thrust::window_2d<float> &outputWindow) const
  {
    int x_in, y_in;
    if(outputWindow.start_x%2 && outputWindow.start_y%2)
    {
      x_in = outputWindow.start_x/2;
      y_in = outputWindow.start_y/2;
      outputWindow[0][0]=(*inBlock)[y_in][x_in];
    }
  }
};

int main()
{
  int dim = 5;
  thrust::block_2d<float> kernel(dim,dim);
  getGaussianKernelBlock(dim,1.0,kernel);
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image=small;
  // resize(small,image,Size(1500,1500));
  std::cout<<dim<<"  "<<image.isContinuous()<<std::endl;
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::block_2d<float> float_image_block (image.cols,image.rows);
  thrust::block_2d<float> outBlock (image.cols*2,image.rows*2);
  thrust::fill(outBlock.begin(),outBlock.end(),0.0f);
  float * img = (float * )malloc(sizeof(float)*(image_block.end()-image_block.begin()));
  float * img_out = (float * )malloc(sizeof(float)*(outBlock.end()-outBlock.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  thrust::window_vector<float> inputVector(&outBlock,1,1,1,1);
  pyrdownTransformFunctor ptf(&float_image_block);
  thrust::for_each(inputVector.begin(),inputVector.end(),ptf);
  cudaDeviceSynchronize();
  thrust::convolve(outBlock.begin(),outBlock.end(),kernel.begin());
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(outBlock.end()-outBlock.begin()));
  cudaMemcpy(img_out,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(outBlock.end()-outBlock.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows*4;i++)
  {
    outputFloatImageData[i]=(unsigned char)img_out[i];
  }
  Mat output (Size(image.cols*2,image.rows*2),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("pyrdown.png",output);
  return 0;
}
