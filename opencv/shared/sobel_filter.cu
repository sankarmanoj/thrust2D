#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#define PI 3.14159
using namespace cv;

class convolutionFunctor //:public thrust::shared_unary_window_transform_functor<float>
{
public:
  int dim;
  thrust::block_2d<float> * kernel1,*kernel2;
  convolutionFunctor( thrust::block_2d<float> * kernel1,thrust::block_2d<float> * kernel2,int dim)
  {
    this->dim =dim;
    this->kernel1 = kernel1;
    this->kernel2 = kernel2;
  }
  __device__ void operator() (const thrust::window_2d<float> & input_window,const thrust::window_2d<float> & output_window) const
  {
    float temp1 = 0,temp2=0;
    for(int i = 0; i< dim; i++)
    {
      for(int j = 0; j<dim; j++)
      {
        temp1+=input_window[i][j]*(*kernel1)[i][j];
        temp2+=input_window[i][j]*(*kernel2)[i][j];

      }
    }
    output_window[1][1]=sqrt(temp1*temp1 + temp2*temp2);
  }
};

int main(int argc, char const *argv[]) {
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 3;
  int dim1 = 512;
  if(argc ==2)
  {
    dim1 = atoi(argv[1]);
  }
  resize(small,image,Size(dim1,dim1));
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
  float * img = (float * )malloc(sizeof(float)*(image_block.end()-image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  thrust::window_vector<float> input_wv(&float_image_block,dim,dim,1,1);
  thrust::window_vector<float> output_wv_x(&convolve1_block,dim,dim,1,1);
  thrust::transform(thrust::cuda::shared,input_wv.begin(),input_wv.end(),output_wv_x.begin(),convolutionFunctor(kernelx.device_pointer,kernely.device_pointer,dim));
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(convolve1_block.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
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
