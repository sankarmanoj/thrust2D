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
class HarrisIntensityFunctor : public thrust::shared_unary_window_transform_functor<float>
{

public:
  thrust::block_2d<float> * kernel;
  HarrisIntensityFunctor(thrust::block_2d<float> * kernel)
  {
    this->kernel = kernel;
  }
  __device__ void operator() (const thrust::window_2d<float> &inputWindow,const thrust::window_2d<float> &outputWindow) const
  {
    float intensityValue;

    for(int xoffset = 1 ; xoffset <=1 ; xoffset++)
    {
      for(int yoffset = 1 ; yoffset <=1 ; yoffset++)
      {
        for(int i = 0; i< 3; i++)
        {
          for(int j = 0; j< 3; j++)
          {
              intensityValue += ((*kernel)[i][j])*(inputWindow[make_int2(j + xoffset,i + yoffset)]-inputWindow[make_int2(i,j)]);
          }
        }
      }
    }
    outputWindow[2][2]=abs(intensityValue);
  }
};
int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  resize(small,image,Size(dim,dim));
  thrust::block_2d<float> float_image_block (image.cols,image.rows,0.0f);
  thrust::block_2d<float> outBlock (image.cols,image.rows,0.0f);
  float * img = (float * )malloc(sizeof(float)*(image.cols*image.rows));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  thrust::block_2d<float> kernel(3,3);
  getGaussianKernelBlock(3,5,kernel);
  thrust::window_vector<float> inputVector = thrust::window_vector<float>(&float_image_block,5,5,1,1);
  thrust::window_vector<float> outputVector = thrust::window_vector<float>(&outBlock,5,5,1,1);
  thrust::transform_texture(thrust::cuda::shared,inputVector.begin(),inputVector.end(),outputVector.begin(),HarrisIntensityFunctor(kernel.device_pointer));
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("houtput.png",output);
  return 0;
}
