#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#define PI 3.14159
using namespace cv;
class dilateFunctor
{
  public:

  __device__ void operator() (const thrust::window_2d<float> &inputWindow,const thrust::window_2d<uchar> &outputWindow) const
  {
    uchar temp = 0;
    for(int i = 0; i<3;i++)
    {
      for(int j = 0; j<3;j++)
      {
        temp = max((float)temp,(float)inputWindow[make_int2(i,j)]);

      }
    }
    outputWindow[0][0]=temp;
  }
};
int main(int argc, char const *argv[]) {
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  resize(small,image,Size(dim,dim));
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::block_2d<float> float_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> outBlock (image.cols,image.rows);
  float * img = (float * )malloc(sizeof(float)*(image_block.end()-image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.upload(img);
  thrust::window_vector<float> myVector = thrust::window_vector<float>(&float_image_block,3,3,1,1);
  thrust::window_vector<uchar> outputVector = thrust::window_vector<uchar>(&outBlock,3,3,1,1);
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start);
  thrust::transform(thrust::cuda::shared,myVector.begin(),myVector.end(),outputVector.begin(),dilateFunctor());
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  float time_in_ms;
  cudaEventElapsedTime(&time_in_ms,start,stop);
  printf("%f\n",time_in_ms);
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  outBlock.download(&outputFloatImageData);
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  #ifdef OWRITE
  imwrite("input.png",image);
  imwrite("output.png",output);
  #endif
  #ifdef SHOW
  imshow("input.png",image);
  imshow("output.png",output);
  waitKey(0);
  #endif
  return 0;
}
