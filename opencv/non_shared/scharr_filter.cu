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
  thrust::block_2d<float> kernelx(dim,dim);
  thrust::block_2d<float> kernely(dim,dim);
  //Scharr Filter
  kernelx[0][0]=-3;
  kernelx[0][1]=0;
  kernelx[0][2]=+3;
  kernelx[1][0]=-10;
  kernelx[1][1]=0;
  kernelx[1][2]=+10;
  kernelx[2][0]=-3;
  kernelx[2][1]=0;
  kernelx[2][2]=+3;
  kernely[0][0]=-3;
  kernely[0][1]=-10;
  kernely[0][2]=-3;
  kernely[1][0]=0;
  kernely[1][1]=0;
  kernely[1][2]=0;
  kernely[2][0]=+3;
  kernely[2][1]=+10;
  kernely[2][2]=+3;
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> convolve1_block (image.cols,image.rows);
  thrust::block_2d<uchar> convolve2_block (image.cols,image.rows);
  thrust::block_2d<uchar> outBlock (image.cols,image.rows);
  thrust::block_2d<uchar> zero_image_block (image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(image_block.end()-image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.assign(img,img+image.cols*image.rows);
  convolve1_block.assign(uchar_image_block.begin(),uchar_image_block.end());
  convolve2_block.assign(uchar_image_block.begin(),uchar_image_block.end());

  thrust::window_vector<uchar> input_wv(&uchar_image_block,dim,dim,1,1);
  thrust::window_vector<uchar> output_wv_x(&convolve1_block,dim,dim,1,1);
  thrust::window_vector<uchar> output_wv_y(&convolve2_block,dim,dim,1,1);

  thrust::transform(input_wv.begin(),input_wv.end(),output_wv_x.begin(),zero_image_block.begin(),convolutionFunctor(kernelx.device_pointer,dim));
  thrust::transform(input_wv.begin(),input_wv.end(),output_wv_y.begin(),zero_image_block.begin(),convolutionFunctor(kernely.device_pointer,dim));
  thrust::transform(convolve1_block.begin(),convolve1_block.end(),convolve2_block.begin(),outBlock.begin(),transFunctor());
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()),cudaMemcpyDeviceToHost);
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
