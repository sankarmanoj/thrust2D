#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#define PI 3.14159
using namespace cv;
class dilateFunctor : public thrust::shared_unary_window_transform_functor<uchar>
{
  public:

  __device__ void operator() (const thrust::window_2d<uchar> &inputWindow,const thrust::window_2d<uchar> &outputWindow) const
  {
    uchar temp = 0;
    for(int i = 0; i<3;i++)
    {
      for(int j = 0; j<3;j++)
      {
        temp = max((float)temp,(float)inputWindow[make_int2(i,j)]);

      }
    }
    outputWindow[1][1]=temp;
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
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> outBlock (image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(image_block.end()-image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  // uchar_image_block.assign(img,img+image.cols*image.rows);
  // cudaMemcpy2D(uchar_image_block.data_pointer,uchar_image_block.pitch,img,image.cols*sizeof(uchar),image.cols,image.rows,cudaMemcpyHostToDevice);
  uchar_image_block.upload(img);
  thrust::window_vector<uchar> myVector = thrust::window_vector<uchar>(&uchar_image_block,3,3,1,1);
  thrust::window_vector<uchar> outputVector = thrust::window_vector<uchar>(&outBlock,3,3,1,1);
  thrust::transform(thrust::cuda::shared,myVector.begin(),myVector.end(),outputVector.begin(),dilateFunctor());
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  // cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()),cudaMemcpyDeviceToHost);
  // cudaMemcpy2D(img,outBlock.dim_x*sizeof(uchar),outBlock.data_pointer,outBlock.pitch,outBlock.dim_x,outBlock.dim_y,cudaMemcpyDeviceToHost);
  outBlock.download(img);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
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
