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
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  resize(small,image,Size(dim,dim));
  float kernelx[9], kernely[9];
  //Sobel Filter
  kernelx[0]=-1;
  kernelx[1]=0;
  kernelx[2]=+1;
  kernely[0]=+(1/4);
  kernely[1]=+(2/4);
  kernely[2]=+(1/4);
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> convolve1_block (image.cols,image.rows);
  thrust::block_2d<uchar> convolve2_block (image.cols,image.rows);
  thrust::block_2d<uchar> outBlock (image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.upload(img);
  convolve1_block.upload(img);
  convolve2_block.upload(img);
  thrust::convolve(thrust::cuda::texture,&convolve1_block,kernelx,3,&convolve1_block);
  thrust::convolve(thrust::cuda::texture,&convolve2_block,kernely,3,&convolve2_block);
  thrust::transform(convolve1_block.begin(),convolve1_block.end(),convolve2_block.begin(),outBlock.begin(),transFunctor());
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  outBlock.download(&img);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  #ifdef OWRITE
  imwrite("input.png",image);
  imwrite("sobel.png",output);
  #endif
  #ifdef SHOW
  imshow("input.png",image);
  imshow("sobel.png",output);
  waitKey(0);
  #endif

  return 0;
}
