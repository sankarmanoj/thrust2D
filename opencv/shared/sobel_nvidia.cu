#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#define PI 3.14159
using namespace cv;
#define fScale 1
class transFunctor
{
public:
  __device__ void operator() (const thrust::window_2d<uchar> &window, const thrust::window_2d<uchar> &outputWindow) const
  {
    short Horz = window[0][2] + 2*window[1][1] + window[2][2] - window[0][0] - 2*window[1][0] - window[2][0];
    short Vert = window[0][0] + 2*window[0][1] + window[0][2] - window[2][0] - 2*window[2][1] - window[2][2];
    short Sum = (short)(fScale*(abs((int)Horz)+abs((int)Vert)));

    if (Sum < 0)
    {
        outputWindow[1][1]=0;
    }
    else if (Sum > 0xff)
    {
        outputWindow[1][1]=0xff;
    }
    else
      outputWindow[1][1]= Sum;
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

  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> outBlock (image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.upload(img);
  thrust::window_vector<uchar> input_vector (&uchar_image_block,3,3,1,1);
  thrust::window_vector<uchar> output_vector (&outBlock,3,3,1,1);
  thrust::transform(thrust::cuda::shared,input_vector.begin(),input_vector.end(),output_vector.begin(),transFunctor());
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  outBlock.download(&img);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  #ifdef OWRITE
  imwrite("input.png",image);
  imwrite("sobel.png",output);
  #endif
  #ifdef SHOW
  imshow("input.png",image);
  imshow("sobel.png",output);
  waitKey(0);
  #endif

  return 0;
}
