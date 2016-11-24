#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#define PI 3.14159
using namespace cv;
class transFunctor
{
public:
  __device__ uchar operator() (const uchar a,const uchar b) const
  {
    return sqrt((float)a*a + b*b);
  }
};
int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  image = small;
  float kernelx[3], kernely[3];
  //Scharr Filter
  kernelx[0]=-3;
  kernelx[1]=0;
  kernelx[2]=+3;
  kernely[0]=+3;
  kernely[1]=+10;
  kernely[2]=+3;
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> convolve1_block (image.cols,image.rows);
  thrust::block_2d<uchar> convolve2_block (image.cols,image.rows);
  thrust::block_2d<uchar> outBlock (image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.assign(img,img+image.cols*image.rows);
  convolve1_block.assign(uchar_image_block.begin(),uchar_image_block.end());
  convolve2_block.assign(uchar_image_block.begin(),uchar_image_block.end());
  thrust::convolve(thrust::cuda::texture,&convolve1_block,kernelx);
  thrust::convolve(thrust::cuda::texture,&convolve2_block,kernely);
  thrust::transform(convolve1_block.begin(),convolve1_block.end(),convolve2_block.begin(),outBlock.begin(),transFunctor());
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("scharr.png",output);
  return 0;
}
