#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;

class pyrdownTransformFunctor : public thrust::shared_window_for_each_functor<float>
{
public:
  thrust::block_2d<float> *inBlock;

pyrdownTransformFunctor(thrust::block_2d<float> * inBlock)
  {
    this->inBlock = inBlock->device_pointer;
  }
  __device__ void operator() (const thrust::window_2d<float> &outputWindow) const
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

int main()
{
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image=small;
  thrust::block_2d<float> float_image_block (image.cols,image.rows);
  thrust::block_2d<float> outBlock (image.cols/2,image.rows/2,0.0f);
  float * img = (float * )malloc(sizeof(float)*(float_image_block.end()-float_image_block.begin()));
  float * img1 = (float * )malloc(sizeof(float)*(outBlock.end()-outBlock.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  float kernel[3] = {0.25,0.5,0.25};
  thrust::convolve(thrust::cuda::texture,&float_image_block,kernel);
  thrust::window_vector<float> inputVector(&outBlock,1,1,1,1);
  pyrdownTransformFunctor ptf(&float_image_block);
  thrust::for_each(thrust::cuda::texture,inputVector.begin(),inputVector.end(),ptf);
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(outBlock.end()-outBlock.begin()));
  cudaMemcpy(img1,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(outBlock.end()-outBlock.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<(outBlock.end()-outBlock.begin());i++)
  {
    outputFloatImageData[i]=(unsigned char)img1[i];
  }
  Mat output (Size(image.cols/2,image.rows/2),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("pyrdown.png",output);
  free (img);
  free (img1);
  free (outputFloatImageData);
  return 0;
}
