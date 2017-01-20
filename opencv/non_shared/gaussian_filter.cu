#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
using namespace cv;
inline float gauss(int x, int y, int mid, float sigma )
{
  float temp = (pow(x-mid,2)+pow(y-mid,2))/sigma;
  temp= exp(-temp);
  return temp;
}
void getGaussianKernelBlock(int dim, float sigma,thrust::host_block_2d<float> &GaussianKernel )
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

class convolutionFunctor //:public thrust::shared_unary_window_transform_functor<uchar>
{
public:
  int dim;
  thrust::block_2d<float> * kernel;
  convolutionFunctor( thrust::block_2d<float> * kernel,int dim)
  {
    this->dim =dim;
    this->kernel = kernel->device_pointer;
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
    return 0;
  }
};
int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 19;
  image = small;
  thrust::host_block_2d<float> hkernel(dim,dim);
  getGaussianKernelBlock(dim,5,hkernel);
  thrust::block_2d<float> kernel(dim,dim);
  kernel=hkernel;
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> zero_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> output_image_block(image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(image_block.end()-image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.upload(img);
  thrust::window_vector<uchar> input_wv(&uchar_image_block,dim,dim,1,1);
  thrust::window_vector<uchar> output_wv(&output_image_block,dim,dim,1,1);
  thrust::transform(input_wv.begin(),input_wv.end(),output_wv.begin(),zero_image_block.begin(),convolutionFunctor(&kernel,dim));

  unsigned char * toutputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  output_image_block.download(&img);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    toutputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat toutput (Size(image.cols,image.rows),CV_8UC1,toutputFloatImageData);

  // cudaCheckError();
  imwrite("input.png",image);
  imwrite("output.png",toutput);

  return 0;
}
