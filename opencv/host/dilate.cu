#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;
class dilateFunctor //: public thrust::shared_unary_window_transform_functor<float>
{
  public:
  __host__ float operator() (const thrust::host_window_2d<float> &inputWindow,const thrust::host_window_2d<float> &outputWindow) const
  {
    float temp = -1.0;
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

  std::cout<<"  "<<image.isContinuous()<<std::endl;
  thrust::host_block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::host_block_2d<float> float_image_block (image.cols,image.rows);
  thrust::host_block_2d<float> outBlock (image.cols,image.rows);
  thrust::host_block_2d<float> nullBlock (image.cols,image.rows);
  float * img = (float * )malloc(sizeof(float)*(image_block.end()-image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  thrust::host_window_vector<float> myVector(&float_image_block,3,3,1,1);
  thrust::host_window_vector<float> outputVector(&outBlock,3,3,1,1);
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  float milliseconds;
  cudaEventRecord(start);
  thrust::transform(thrust::host,myVector.begin(),myVector.end(),outputVector.begin(),nullBlock.begin(),dilateFunctor());
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  cudaEventElapsedTime(&milliseconds, start, stop);
  std::cout<<"Time taken on Host = "<<milliseconds<<std::endl;
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyHostToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  imshow("input",image);
  imshow("output",output);
  waitKey(0);
  return 0;
}
