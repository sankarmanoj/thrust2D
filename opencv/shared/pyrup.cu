#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#include <thrust/window_for_each.h>
using namespace cv;
class pyrupTransformFunctor : public thrust::shared_window_for_each_functor<uchar>
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
      x_in = outputWindow.start_x/2;
      y_in = outputWindow.start_y/2;
      outputWindow[0][0]=(*inBlock)[y_in][x_in];
    }
  }
};

int main(int argc, char const *argv[])
{
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
  thrust::block_2d<uchar> intermediate_image_block (image.cols*2,image.rows*2);
  thrust::block_2d<uchar> outBlock (image.cols*2,image.rows*2,0.0f);
  thrust::window_vector<uchar> output_wv(&outBlock,1,1,1,1);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()));
  uchar * img_out = (uchar * )malloc(sizeof(uchar)*(outBlock.end()-outBlock.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.upload(img);
  thrust::window_vector<uchar> inputVector(&intermediate_image_block,1,1,1,1);
  pyrupTransformFunctor ptf(&uchar_image_block);
  thrust::for_each(inputVector.begin(),inputVector.end(),ptf);
  cudaDeviceSynchronize();
  float kernel[5] = {0.0625*2,0.25*2,0.375*2,0.25*2,0.0625*2};
  thrust::convolve(thrust::cuda::shared,&intermediate_image_block,kernel,kernel,5,&outBlock);
  outBlock.download(&img_out);
  Mat output (Size(image.cols*2,image.rows*2),CV_8UC1,img_out);
  #ifdef OWRITE
  imwrite("input.png",image);
  imwrite("pyrup.png",output);

  #endif
  #ifdef SHOW
  imshow("input.png",image);
  imshow("pyrup.png",output);
  waitKey(0);
  #endif
  return 0;
}
