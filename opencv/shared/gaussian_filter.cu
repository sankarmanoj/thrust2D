#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
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
}

class convolutionFunctor
{
public:
  thrust::block_2d<float> *kernel;
  int dim;
  convolutionFunctor(thrust::block_2d<float> *kernel,int dim)
  {
    this->kernel = kernel;
    this->dim = dim;
  }
  __device__ float operator() (thrust::window_2d<float> input_window,thrust::window_2d<float> output_window)
  {
    float temp = 0;
    for(int i = 0; i< dim; i++)
    {
      for(int j = 0; j<dim; j++)
      {
        temp+=input_window[i][j]*0.1;
      }
    }
    output_window[1][1]=temp;
    return 0.0;
  }
};
int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 3;
  resize(small,image,Size(512,512));
  thrust::block_2d<float> kernel(dim,dim);
  getGaussianKernelBlock(dim,5,kernel);
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::block_2d<float> float_image_block (image.cols,image.rows);
  thrust::block_2d<float> output_image_block(image.cols,image.rows);
  float * img = (float * )malloc(sizeof(float)*(image_block.end()-image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  thrust::window_vector<float> input_wv(&float_image_block,dim,dim,1,1);
  thrust::window_vector<float> output_wv(&output_image_block,dim,dim,1,1);
  thrust::transform(thrust::cuda::shared,input_wv.begin(),input_wv.end(),output_wv.begin(),convolutionFunctor(kernel.device_pointer,dim));
  // thrust::convolve(float_image_block.begin(),float_image_block.end(),kernel.begin());

  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(output_image_block.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  // cudaCheckError();
  imwrite("input.png",image);
  imwrite("output.png",output);

  return 0;
}
