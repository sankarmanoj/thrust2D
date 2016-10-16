#include <opencv2/opencv.hpp>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#include <math.h>


#define PI 3.14159
using namespace cv;
class transFunctor : public thrust::shared_binary_window_transform_functor<float>
{
public:
  __device__ void operator() (const thrust::window_2d<float> &inputWindow1,const thrust::window_2d<float> &inputWindow2,const thrust::window_2d<float> &outputWindow) const
  {
    (outputWindow)[outputWindow.window_dim_y/2][outputWindow.window_dim_x/2] = sqrt((inputWindow1)[inputWindow1.window_dim_y/2][inputWindow1.window_dim_x/2]*(inputWindow1)[inputWindow1.window_dim_y/2][inputWindow1.window_dim_x/2] + (inputWindow2)[inputWindow2.window_dim_y/2][inputWindow2.window_dim_x/2]*(inputWindow2)[inputWindow2.window_dim_y/2][inputWindow2.window_dim_x/2]);
  }
};
int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 3;
  image = small;
  // resize(small,image,Size(50,50));
  thrust::block_2d<float> kernelx(dim,dim);
  thrust::block_2d<float> kernely(dim,dim);
  //Sobel Filter
  kernelx[0][0]=-1;
  kernelx[0][1]=0;
  kernelx[0][2]=+1;
  kernelx[1][0]=-2;
  kernelx[1][1]=0;
  kernelx[1][2]=+2;
  kernelx[2][0]=-1;
  kernelx[2][1]=0;
  kernelx[2][2]=+1;
  kernely[0][0]=-1;
  kernely[0][1]=-2;
  kernely[0][2]=-1;
  kernely[1][0]=0;
  kernely[1][1]=0;
  kernely[1][2]=0;
  kernely[2][0]=+1;
  kernely[2][1]=+2;
  kernely[2][2]=+1;

  //Scharr Filter
  // kernelx[0][0]=-3;
  // kernelx[0][1]=0;
  // kernelx[0][2]=+3;
  // kernelx[1][0]=-10;
  // kernelx[1][1]=0;
  // kernelx[1][2]=+10;
  // kernelx[2][0]=-3;
  // kernelx[2][1]=0;
  // kernelx[2][2]=+3;
  // kernely[0][0]=-3;
  // kernely[0][1]=-10;
  // kernely[0][2]=-3;
  // kernely[1][0]=0;
  // kernely[1][1]=0;
  // kernely[1][2]=0;
  // kernely[2][0]=+3;
  // kernely[2][1]=+10;
  // kernely[2][2]=+3;

  std::cout<<dim<<"  "<<image.isContinuous()<<std::endl;
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::block_2d<float> float_image_block (image.cols,image.rows);
  thrust::block_2d<float> convolve1_block (image.cols,image.rows);
  thrust::block_2d<float> convolve2_block (image.cols,image.rows);
  thrust::block_2d<float> outBlock (image.cols,image.rows);
  float * img = (float * )malloc(sizeof(float)*(image_block.end()-image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  convolve1_block.assign(float_image_block.begin(),float_image_block.end());
  convolve2_block.assign(float_image_block.begin(),float_image_block.end());


  thrust::convolve(convolve1_block.begin(),convolve1_block.end(),kernelx.begin());
  thrust::convolve(convolve2_block.begin(),convolve2_block.end(),kernely.begin());
  thrust::window_vector<float> myVector1 = thrust::window_vector<float>(&convolve1_block,3,3,1,1);
  thrust::window_vector<float> myVector2 = thrust::window_vector<float>(&convolve2_block,3,3,1,1);
  thrust::window_vector<float> myVector3 = thrust::window_vector<float>(&outBlock,3,3,1,1);
  thrust::transform(thrust::cuda::shared,myVector1.begin(),myVector1.end(),myVector2.begin(),myVector3.begin(),transFunctor());

  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
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
