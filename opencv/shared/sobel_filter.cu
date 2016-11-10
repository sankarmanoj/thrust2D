#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#define PI 3.14159
using namespace cv;
class transFunctor
{
public:
  __device__ float operator() (const float a,const float b) const
  {
    return sqrt(a*a + b*b);
  }
};
int main(int argc, char const *argv[]) {
  Mat small = imread("building.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 3;
  image = small;
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
  thrust::transform(convolve1_block.begin(),convolve1_block.end(),convolve2_block.begin(),outBlock.begin(),transFunctor());
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("sobel.png",output);

  return 0;
}
