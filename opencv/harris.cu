#include <opencv2/opencv.hpp>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#include <math.h>
using namespace cv;
// #define AFFINE

#define PI 3.14159
using namespace cv;
inline float gauss(int x, int y, int mid, float sigma )
{
  float temp = (pow(x-mid,2)+pow(y-mid,2))/sigma;
  temp= exp(-temp);
  return temp;
}
#define HARRIS
class AffineTransformFunctor : public thrust::shared_window_for_each_functor<float>
{
public:
  thrust::block_2d<float> *transformMatrix;
  thrust::block_2d<float> *outBlock;

  AffineTransformFunctor(thrust::block_2d<float> * tm,thrust::block_2d<float> * outBlock)
  {
    this->transformMatrix = tm->device_pointer;
    this->outBlock = outBlock->device_pointer;
  }
  __device__ void operator() (const thrust::window_2d<float> &inputWindow) const
  {
    int x_out, y_out;
    x_out = (int)((*transformMatrix)[0][0]*inputWindow.start_x+(*transformMatrix)[0][1]*inputWindow.start_y+(*transformMatrix)[0][2]*1);
    y_out = (int)((*transformMatrix)[1][0]*inputWindow.start_x+(*transformMatrix)[1][1]*inputWindow.start_y+(*transformMatrix)[1][2]*1);

    (*outBlock)[y_out][x_out]=inputWindow[0][0];
  }
};
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
class HarrisIntensityFunctor : public thrust::shared_unary_window_transform_functor<float>
{

public:
  thrust::block_2d<float> * kernel;
  HarrisIntensityFunctor(thrust::block_2d<float> * kernel)
  {
    this->kernel = kernel;
  }
  __device__ void operator() (const thrust::window_2d<float> &inputWindow,const thrust::window_2d<float> &outputWindow) const
  {
    float intensityValue;

    for(int xoffset = 1 ; xoffset <=1 ; xoffset++)
    {
      for(int yoffset = 1 ; yoffset <=1 ; yoffset++)
      {
        for(int i = 0; i< 3; i++)
        {
          for(int j = 0; j< 3; j++)
          {
              intensityValue += ((*kernel)[i][j])*(inputWindow[i + yoffset][j + xoffset]-inputWindow[i][j]);
          }
        }
      }
    }
    outputWindow[2][2]=intensityValue*0.08;
  }
};
class HarrisIntensityThrustFunctor
{

public:
  thrust::block_2d<float> * kernel;
  HarrisIntensityThrustFunctor(thrust::block_2d<float> * kernel)
  {
    this->kernel = kernel;
  }
  __device__ float operator() (const thrust::window_2d<float> &inputWindow,const thrust::window_2d<float> &outputWindow) const
  {
    float intensityValue;

    for(int xoffset = 1 ; xoffset <=1 ; xoffset++)
    {
      for(int yoffset = 1 ; yoffset <=1 ; yoffset++)
      {
        for(int i = 0; i< 3; i++)
        {
          for(int j = 0; j< 3; j++)
          {
              intensityValue += ((*kernel)[i][j])*(inputWindow[i + yoffset][j + xoffset]-inputWindow[i][j]);
          }
        }
      }
    }
    outputWindow[2][2]=intensityValue*0.08;
    return 0.0;
  }
};
int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  image = small;
  // resize(small,image,Size(50,50));
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  float milliseconds;
  std::cout<<image.isContinuous()<<image.type()<<std::endl;
  thrust::block_2d<float> float_image_block (image.cols,image.rows);

  thrust::block_2d<float> null_block (image.cols,image.rows);
  thrust::fill(float_image_block.begin(),float_image_block.end(),0.0f);
  thrust::block_2d<float> outBlock (image.cols,image.rows);
  thrust::fill(outBlock.begin(),outBlock.end(),0.0f);
  float * img = (float * )malloc(sizeof(float)*(image.cols*image.rows));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);

  thrust::block_2d<float> kernel(3,3);
  getGaussianKernelBlock(3,5,kernel);
  thrust::window_vector<float> inputVector = thrust::window_vector<float>(&float_image_block,5,5,1,1);
  thrust::window_vector<float> outputVector = thrust::window_vector<float>(&outBlock,5,5,1,1);
  cudaEventRecord(start);
  thrust::transform(inputVector.begin(),inputVector.end(),outputVector.begin(),null_block.begin(),HarrisIntensityThrustFunctor(kernel.device_pointer));
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  cudaEventElapsedTime(&milliseconds, start, stop);
  std::cout<<"Time taken on Shared = "<<milliseconds<<std::endl;
  cudaEventRecord(start);
  thrust::transform(thrust::cuda::shared,inputVector.begin(),inputVector.end(),outputVector.begin(),HarrisIntensityFunctor(kernel.device_pointer));
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  cudaEventElapsedTime(&milliseconds, start, stop);
  std::cout<<"Time taken on Thrust = "<<milliseconds<<std::endl;
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  // std::cout<<output;
  // cudaCheckError();
  // std::cout<<output.type()<<"  "<<Size(image.cols,image.rows)<<"="<<image_block.end()-image_block.begin()<<"\n";
  imwrite("ainput.png",image);
  // imwrite("output",output);
  imwrite("aoutput.png",output);

;
  return 0;
}
