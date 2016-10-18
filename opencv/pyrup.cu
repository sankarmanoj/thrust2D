#include <opencv2/opencv.hpp>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#include <math.h>

#define PI 3.14159
using namespace cv;

void createFilter(float multiplier,float sigma,int dim,thrust::block_2d<float> &gKernel)
{
  // double r, s = 2.0 * sigma * sigma;
  int hdim = dim/2;
  // sum is for normalization
  double sum = 0.0;

  // generate dimxdim kernel
  // for (int x = -hdim; x <= hdim; x++)
  // {
  //     for(int y = -hdim; y <= hdim; y++)
  //     {
  //         r = sqrt(x*x + y*y);
  //         (gKernel)[x + hdim][y + hdim] = (exp(-(r*r)/s))/(M_PI * s);
  //         sum += (gKernel)[x + hdim][y + hdim];
  //     }
  // }
  (gKernel)[0][0] = 1.0/16.0;
  (gKernel)[0][1] = 4.0/16.0;
  (gKernel)[0][2] = 6.0/16.0;
  (gKernel)[0][3] = 4.0/16.0;
  (gKernel)[0][4] = 1.0/16.0;
  (gKernel)[1][0] = 4.0/16.0;
  (gKernel)[1][1] = 16.0/16.0;
  (gKernel)[1][2] = 24.0/16.0;
  (gKernel)[1][3] = 16.0/16.0;
  (gKernel)[1][4] = 4.0/16.0;
  (gKernel)[2][0] = 6.0/16.0;
  (gKernel)[2][1] = 24.0/16.0;
  (gKernel)[2][2] = 36.0/16.0;
  (gKernel)[2][3] = 24.0/16.0;
  (gKernel)[2][4] = 6.0/16.0;
  (gKernel)[3][0] = 4.0/16.0;
  (gKernel)[3][1] = 16.0/16.0;
  (gKernel)[3][2] = 24.0/16.0;
  (gKernel)[3][3] = 16.0/16.0;
  (gKernel)[3][4] = 4.0/16.0;
  (gKernel)[4][0] = 1.0/16.0;
  (gKernel)[4][1] = 4.0/16.0;
  (gKernel)[4][2] = 6.0/16.0;
  (gKernel)[4][3] = 4.0/16.0;
  (gKernel)[4][4] = 1.0/16.0;
  for (int x = -hdim; x <= hdim; x++)
  {
      for(int y = -hdim; y <= hdim; y++)
      {
          // (gKernel)[x + hdim][y + hdim] *= multiplier;
          sum += (gKernel)[x + hdim][y + hdim];
      }
  }

  // normalize the Kernel
  for(int i = 0; i < dim; ++i)
  {
    for(int j = 0; j < dim; ++j)
    {
      (gKernel)[i][j] /= sum;
      (gKernel)[i][j] *= multiplier;
    }
  }
}

class pyrupTransformFunctor : public thrust::shared_window_for_each_functor<float>
{
public:
  thrust::block_2d<float> *inBlock;

pyrupTransformFunctor(thrust::block_2d<float> * inBlock)
  {
    this->inBlock = inBlock->device_pointer;
  }
  __device__ void operator() (const thrust::window_2d<float> &inputWindow) const
  {
    int x_out, y_out;
    if(inputWindow.start_x%2 && inputWindow.start_y%2)
    {
      x_out = inputWindow.start_x/2;
      y_out = inputWindow.start_y/2;
      inputWindow[0][0]=(*inBlock)[y_out][x_out];
    }
  }
};

int main()
{
  int dim = 5;
  thrust::block_2d<float> kernel(dim,dim);
  createFilter(2.0,1.0,dim,kernel);
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image=small;
  // resize(small,image,Size(1500,1500));
  std::cout<<dim<<"  "<<image.isContinuous()<<std::endl;
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::block_2d<float> float_image_block (image.cols,image.rows);
  thrust::block_2d<float> outBlock (image.cols*2,image.rows*2);
  thrust::fill(outBlock.begin(),outBlock.end(),0.0f);
  float * img = (float * )malloc(sizeof(float)*(image_block.end()-image_block.begin()));
  float * img_out = (float * )malloc(sizeof(float)*(image_block.end()-image_block.begin())*4);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  thrust::window_vector<float> inputVector(&outBlock,1,1,1,1);
  pyrupTransformFunctor ptf(&float_image_block);
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
  imwrite("output.png",output);
  return 0;
}