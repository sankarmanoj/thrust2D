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
class HarrisIntensityThrustFunctor
{
public:
  thrust::block_2d<float> * kernel;
  HarrisIntensityThrustFunctor(thrust::block_2d<float> * kernel)
  {
    this->kernel = kernel;
  }
  __device__ float operator() (const thrust::window_2d<float> &inputWindow,const thrust::window_2d<float> &outputWindow) const
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
  cudaEvent_t m_start, m_stop;
  cudaEventCreate(&m_start);
  cudaEventCreate(&m_stop);
  float m_milliseconds;
  cudaEventRecord(m_start);
  thrust::block_2d<float> float_image_block (image.cols,image.rows,0.0f);
  thrust::block_2d<float> null_block (image.cols,image.rows);
  thrust::block_2d<float> outBlock (image.cols,image.rows,0.0f);
  float * img = (float * )malloc(sizeof(float)*(image.cols*image.rows));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  cudaEventRecord(m_stop);
  cudaEventSynchronize(m_stop);
  cudaEventElapsedTime(&m_milliseconds, m_start, m_stop);
  std::cout<<"Time taken from Host to Device = "<<m_milliseconds<<std::endl;
  thrust::block_2d<float> kernel(3,3);
  getGaussianKernelBlock(3,5,kernel);
  thrust::window_vector<float> inputVector = thrust::window_vector<float>(&float_image_block,5,5,1,1);
  thrust::window_vector<float> outputVector = thrust::window_vector<float>(&outBlock,5,5,1,1);
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  float milliseconds;
  cudaEventRecord(start);
  thrust::transform(inputVector.begin(),inputVector.end(),outputVector.begin(),null_block.begin(),HarrisIntensityThrustFunctor(kernel.device_pointer));
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  cudaEventElapsedTime(&milliseconds, start, stop);
  std::cout<<"Time taken on Non Shared = "<<milliseconds<<std::endl;
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaEventRecord(m_start);
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
  cudaEventRecord(m_stop);
  cudaEventSynchronize(m_stop);
  cudaEventElapsedTime(&m_milliseconds, m_start, m_stop);
  std::cout<<"Time taken from Device to Host = "<<m_milliseconds<<std::endl;
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  imwrite("ainput.png",image);
  imwrite("aoutput.png",output);
  return 0;
}
