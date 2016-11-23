#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
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
class HarrisIntensityThrustFunctor
{
public:
  thrust::block_2d<float> * kernel;
  HarrisIntensityThrustFunctor(thrust::block_2d<float> * kernel)
  {
    this->kernel = kernel;
  }
  __device__ uchar operator() (const thrust::window_2d<uchar> &inputWindow,const thrust::window_2d<uchar> &outputWindow) const
  {
    uchar intensityValue;

    for(int xoffset = 1 ; xoffset <=1 ; xoffset++)
    {
      for(int yoffset = 1 ; yoffset <=1 ; yoffset++)
      {
        for(int i = 0; i< 3; i++)
        {
          for(int j = 0; j< 3; j++)
          {
              intensityValue += ((*kernel)[i][j])*(inputWindow[i + yoffset][j + xoffset]-inputWindow[i][j]);
          }
        }
      }
    }
    outputWindow[2][2]=intensityValue*0.08;
    return 0.0;
  }
};
int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  image = small;
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows,0.0f);
  thrust::block_2d<uchar> null_block (image.cols,image.rows);
  thrust::block_2d<uchar> outBlock (image.cols,image.rows,0.0f);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(image.cols*image.rows));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.assign(img,img+image.cols*image.rows);
  thrust::block_2d<float> kernel(3,3);
  getGaussianKernelBlock(3,5,kernel);
  thrust::window_vector<uchar> inputVector = thrust::window_vector<uchar>(&uchar_image_block,5,5,1,1);
  thrust::window_vector<uchar> outputVector = thrust::window_vector<uchar>(&outBlock,5,5,1,1);
  thrust::transform(inputVector.begin(),inputVector.end(),outputVector.begin(),null_block.begin(),HarrisIntensityThrustFunctor(kernel.device_pointer));
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("houtput.png",output);
  return 0;
}
