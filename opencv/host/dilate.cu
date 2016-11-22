#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;
class dilateFunctor //: public thrust::shared_unary_window_transform_functor<uchar>
{
  public:
  __host__ uchar operator() (const thrust::host_window_2d<uchar> &inputWindow,const thrust::host_window_2d<uchar> &outputWindow) const
  {
    uchar temp = 0;
    for(int i = 0; i<inputWindow.window_dim_y;i++)
    {
      for(int j = 0; j<inputWindow.window_dim_x;j++)
      {
        temp = max(temp,inputWindow[i][j]);
      }
    }
    outputWindow[inputWindow.window_dim_y/2][inputWindow.window_dim_x/2]=temp;
    return 0.0f;
  }
};
int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  image = small;
  thrust::host_block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::host_block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::host_block_2d<uchar> outBlock (image.cols,image.rows);
  thrust::host_block_2d<uchar> nullBlock (image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(image_block.end()-image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.assign(img,img+image.cols*image.rows);
  thrust::host_window_vector<uchar> myVector(&uchar_image_block,3,3,1,1);
  thrust::host_window_vector<uchar> outputVector(&outBlock,3,3,1,1);
  thrust::transform(thrust::host,myVector.begin(),myVector.end(),outputVector.begin(),nullBlock.begin(),dilateFunctor());
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()),cudaMemcpyHostToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("output.png",output);

  return 0;
}
