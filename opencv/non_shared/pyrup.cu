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

class pyrupTransformFunctor
{
public:
  thrust::block_2d<uchar> *inBlock;

pyrupTransformFunctor(thrust::block_2d<uchar> * inBlock)
  {
    this->inBlock = inBlock->device_pointer;
  }
  __device__ void operator() (const thrust::window_2d<uchar> &outputWindow) const
  {
    int x_in, y_in;
    if(outputWindow.start_x%2 && outputWindow.start_y%2)
    {
      x_in = outputWindow.start_x*2;
      y_in = outputWindow.start_y*2;
      outputWindow[0][0]=(*inBlock)[y_in][x_in];
    }
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
    return 0;
  }
};

int main()
{
  int dim = 3;
  thrust::block_2d<float> kernel(dim,dim);
  getGaussianKernelBlock(dim,1.0,kernel);
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image=small;
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> outBlock (image.cols/2,image.rows/2,0.0f);
  thrust::block_2d<uchar> zero_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> output_image_block(image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(image_block.end()-image_block.begin()));
  uchar * img1 = (uchar * )malloc(sizeof(uchar)*(outBlock.end()-outBlock.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.assign(img,img+image.cols*image.rows);
  thrust::window_vector<uchar> input_wv(&uchar_image_block,dim,dim,1,1);
  thrust::window_vector<uchar> output_wv(&output_image_block,dim,dim,1,1);
  thrust::transform(input_wv.begin(),input_wv.end(),output_wv.begin(),zero_image_block.begin(),convolutionFunctor(kernel.device_pointer,dim));
  thrust::window_vector<uchar> inputVector(&outBlock,1,1,1,1);
  pyrupTransformFunctor ptf(&output_image_block);
  thrust::for_each(inputVector.begin(),inputVector.end(),ptf);
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(outBlock.end()-outBlock.begin()));
  cudaMemcpy(img1,thrust::raw_pointer_cast(outBlock.data()),sizeof(uchar)*(outBlock.end()-outBlock.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<(outBlock.end()-outBlock.begin());i++)
  {
    outputFloatImageData[i]=(unsigned char)img1[i];
  }
  Mat output (Size(image.cols/2,image.rows/2),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("pyrup.png",output);
  free (img);
  free (img1);
  free (outputFloatImageData);
  return 0;
}
