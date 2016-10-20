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
int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 13;
  image = small;
  // resize(small,image,Size(50,50));
  thrust::block_2d<float> kernel(dim,dim);
  getGaussianKernelBlock(dim,5,kernel);
  // thrust::fill(kernel.begin(),kernel.end(),0.0f);
  //
  // for(int i = 0; i<dim;i++)
  // {
  //   for(int j = 0; j<dim;j++)
  //   {
  //     float x = (kernel)[i][j];
  //     printf("%f ",x);
  //   }
  //   printf("\n");
  // }

  std::cout<<dim<<"  "<<image.isContinuous()<<std::endl;
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::block_2d<float> float_image_block (image.cols,image.rows);
  float * img = (float * )malloc(sizeof(float)*(image_block.end()-image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  Mat cvGB;
  GaussianBlur(image,cvGB,Size(3,3),3);
  thrust::convolve(float_image_block.begin(),float_image_block.end(),kernel.begin());
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(float_image_block.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  // std::cout<<output;
  cudaCheckError();
  // std::cout<<output.type()<<"  "<<Size(image.cols,image.rows)<<"="<<image_block.end()-image_block.begin()<<"\n";
  imshow("input",image);
  imshow("output",output);
  // imwrite("output.png",output);

  waitKey(0);
  // std::cout<<float_image<<"\n";
  return 0;
}
