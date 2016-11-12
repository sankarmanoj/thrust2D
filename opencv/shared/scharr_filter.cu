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

class convolutionFunctor //:public thrust::shared_unary_window_transform_functor<float>
{
public:
  int dim;
  thrust::block_2d<float> * kernel;
  convolutionFunctor( thrust::block_2d<float> * kernel,int dim)
  {
    this->dim =dim;
    this->kernel = kernel;
  }
  __device__ void operator() (const thrust::window_2d<float> & input_window,const thrust::window_2d<float> & output_window) const
  {
    float temp = 0;
    for(int i = 0; i< dim; i++)
    {
      for(int j = 0; j<dim; j++)
      {
        temp+=input_window[i][j]*(*kernel)[i][j];
      }
    }
    output_window[1][1]=temp;
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

  thrust::window_vector<float> input_wv(&float_image_block,dim,dim,1,1);
  thrust::window_vector<float> output_wv_x(&convolve1_block,dim,dim,1,1);
  thrust::window_vector<float> output_wv_y(&convolve2_block,dim,dim,1,1);

  thrust::transform(thrust::cuda::shared,input_wv.begin(),input_wv.end(),output_wv_x.begin(),convolutionFunctor(kernelx.device_pointer,dim));
  thrust::transform(thrust::cuda::shared,input_wv.begin(),input_wv.end(),output_wv_y.begin(),convolutionFunctor(kernely.device_pointer,dim));
  thrust::transform(convolve1_block.begin(),convolve1_block.end(),convolve2_block.begin(),outBlock.begin(),transFunctor());
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
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
