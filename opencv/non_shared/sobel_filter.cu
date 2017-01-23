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
    return (uchar) sqrt((float) a*a + b*b);
  }
};

class convolutionFunctor //:public thrust::shared_unary_window_transform_functor<uchar>
{
public:
  int dim;
  thrust::block_2d<float> * kernel;
  convolutionFunctor( thrust::block_2d<float> * kernel,int dim)
  {
    this->dim =dim;
    this->kernel = kernel;
  }
  __device__ uchar operator() (const thrust::window_2d<uchar> & input_window,const thrust::window_2d<uchar> & output_window) const
  {
    uchar temp = 0;
    for(int i = 0; i< dim; i++)
    {
      for(int j = 0; j<dim; j++)
      {
        temp+=input_window[i][j]*(*kernel)[i][j];
      }
    }
    output_window[1][1]=temp;
    return 0.0 ;
  }
};

int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 3;
  image = small;
  thrust::host_block_2d<float> kernelx(dim,dim);
  thrust::host_block_2d<float> kernely(dim,dim);
  thrust::block_2d<float> dkernelx(dim,dim);
  thrust::block_2d<float> dkernely(dim,dim);
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
  dkernelx=kernelx;
  dkernely=kernely;
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> convolve1_block (image.cols,image.rows);
  thrust::block_2d<uchar> convolve2_block (image.cols,image.rows);
  thrust::block_2d<uchar> outBlock (image.cols,image.rows);
  thrust::block_2d<uchar> zero_image_block (image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.upload(img);
  convolve1_block.upload(img);
  convolve2_block.upload(img);
  thrust::window_vector<uchar> input_wv(&uchar_image_block,dim,dim,1,1);
  thrust::window_vector<uchar> output_wv_x(&convolve1_block,dim,dim,1,1);
  thrust::window_vector<uchar> output_wv_y(&convolve2_block,dim,dim,1,1);

  thrust::transform(input_wv.begin(),input_wv.end(),output_wv_x.begin(),zero_image_block.begin(),convolutionFunctor(dkernelx.device_pointer,dim));
  thrust::transform(input_wv.begin(),input_wv.end(),output_wv_y.begin(),zero_image_block.begin(),convolutionFunctor(dkernely.device_pointer,dim));
  thrust::transform(convolve1_block.begin(),convolve1_block.end(),convolve2_block.begin(),outBlock.begin(),transFunctor());
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  outBlock.download(&img);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  cudaCheckError();
  imwrite("input.png",image);
  imwrite("output.png",output);

  return 0;
}
