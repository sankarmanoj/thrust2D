#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;
class lbpFunctor //: public thrust::shared_unary_window_transform_functor<uchar>
{
  public:
  __host__ uchar operator() (const thrust::host_window_2d<uchar> &inputWindow,const thrust::host_window_2d<uchar> &outputWindow) const
  {
    uchar temp[3][3];
    for(int i = 0; i<inputWindow.window_dim_y;i++)
    {
      for(int j = 0; j<inputWindow.window_dim_x;j++)
      {
        temp[i][j] = inputWindow[inputWindow.window_dim_y/2][inputWindow.window_dim_x/2]>=inputWindow[i][j]?1:0;
      }
    }
    outputWindow[inputWindow.window_dim_y/2][inputWindow.window_dim_x/2]=128*temp[0][1]+64*temp[0][0]+32*temp[1][0]+16*temp[2][0]+8*temp[2][1]+4*temp[2][2]+2*temp[1][2]+1*temp[1][1];
    return 0;
  }
};
int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  resize(small,image,Size(dim,dim));
  thrust::host_block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::host_block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::host_block_2d<uchar> outBlock (image.cols,image.rows);
  thrust::host_block_2d<uchar> null_block (image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(image_block.end()-image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.upload(img);
  thrust::host_window_vector<uchar> myVector(&uchar_image_block,3,3,1,1);
  thrust::host_window_vector<uchar> outputVector(&outBlock,3,3,1,1);
  thrust::transform(thrust::host,myVector.begin(),myVector.end(),outputVector.begin(),null_block.begin(),lbpFunctor());
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  outBlock.download(&img);
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
