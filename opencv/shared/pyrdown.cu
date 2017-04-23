#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_for_each.h>
#include <thrust/window_transform.h>
using namespace cv;

class pyrdownTransformFunctor : public thrust::shared_window_for_each_functor<uchar>
{
public:
  thrust::block_2d<uchar> *inBlock;

pyrdownTransformFunctor(thrust::block_2d<uchar> * inBlock)
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

int main(int argc, char const *argv[])
{
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  resize(small,image,Size(dim,dim));
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> outBlock (image.cols/2,image.rows/2,0.0f);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()));
  uchar * img1 = (uchar * )malloc(sizeof(uchar)*(outBlock.end()-outBlock.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.upload(img);
  float kernel[3] = {0.25,0.5,0.25};
  thrust::convolve(thrust::cuda::shared,&uchar_image_block,kernel,3,&uchar_image_block);
  thrust::window_vector<uchar> inputVector(&outBlock,1,1,1,1);
  pyrdownTransformFunctor ptf(&uchar_image_block);
  thrust::for_each(thrust::cuda::shared,inputVector.begin(),inputVector.end(),ptf);
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(outBlock.end()-outBlock.begin()));
  outBlock.download(&img);
  for(int i = 0; i<(outBlock.end()-outBlock.begin());i++)
  {
    outputFloatImageData[i]=(unsigned char)img1[i];
  }
  Mat output (Size(image.cols/2,image.rows/2),CV_8UC1,outputFloatImageData);
  #ifdef OWRITE
  imwrite("input.png",image);
  imwrite("pyrdown.png",output);
  #endif
  #ifdef SHOW
  imshow("input.png",image);
  imshow("pyrdown.png",output);
  waitKey(0);
  #endif
  free (img);
  free (img1);
  free (outputFloatImageData);
  return 0;
}
