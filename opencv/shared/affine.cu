#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_for_each.h>
using namespace cv;
class AffineTransformFunctor : public thrust::shared_window_for_each_functor<uchar>
{
public:
  thrust::block_2d<uchar> *transformMatrix;
  thrust::block_2d<uchar> *outBlock;

  AffineTransformFunctor(thrust::block_2d<uchar> * tm,thrust::block_2d<uchar> * outBlock)
  {
    this->transformMatrix = tm->device_pointer;
    this->outBlock = outBlock->device_pointer;
  }
  __device__ void operator() (const thrust::window_2d<uchar> &inputWindow) const
  {
    int x_out, y_out;
    x_out = (int)((*transformMatrix)[0][0]*inputWindow.start_x+(*transformMatrix)[0][1]*inputWindow.start_y+(*transformMatrix)[0][2]*1);
    y_out = (int)((*transformMatrix)[1][0]*inputWindow.start_x+(*transformMatrix)[1][1]*inputWindow.start_y+(*transformMatrix)[1][2]*1);

    (*outBlock)[y_out][x_out]=inputWindow[0][0];
  }
};
int main(int argc, char const *argv[]) {
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  Mat small = imread("santiago.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  resize(small,image,Size(dim,dim));
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows,0.0f);
  thrust::block_2d<uchar> outBlock (image.cols,image.rows,0.0f);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(image.cols*image.rows));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.upload(img);
  Point2f srcTri[3];
  Point2f dstTri[3];
  Mat warp_mat( 2, 3, CV_32FC1 );
  /// Set your 3 points to calculate the  Affine Transform
  srcTri[0] = Point2f( 0,0 );
  srcTri[1] = Point2f( image.cols - 1, 0 );
  srcTri[2] = Point2f( 0, image.rows - 1 );
  dstTri[0] = Point2f( image.cols*0.0, image.rows*0.5 );
  dstTri[1] = Point2f( image.cols*0.8, image.rows*0.2 );
  dstTri[2] = Point2f( image.cols*0.2, image.rows*0.7 );
  /// Get the Affine Transform
  warp_mat = getAffineTransform( srcTri, dstTri );
  warp_mat.convertTo(warp_mat,CV_32FC1);
  //Move Warp Matrix to Device
  thrust::block_2d<uchar> warp_block(warp_mat.cols,warp_mat.rows);
  for(int i = 0; i< warp_mat.rows;i++)
  {
    for(int j = 0; j<warp_mat.cols;j++)
    {
      warp_block[i][j]=warp_mat.at<uchar>(i,j);
    }
  }
  //Create Windows For Indexing
  thrust::window_vector<uchar> inputVector(&uchar_image_block,1,1,1,1);
  AffineTransformFunctor atf(&warp_block,&outBlock);
  // TODO: Does not work.
  thrust::for_each(thrust::cuda::shared,inputVector.begin(),inputVector.end(),atf);
  // cudaDeviceSynchronize();
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  uchar_image_block.download(img);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  #ifdef OWRITE
  imwrite("input.png",image);
  imwrite("aoutput.png",output);
  #endif
  #ifdef SHOW
  imshow("input.png",image);
  imshow("aoutput.png",output);
  waitKey(0);
  #endif
  return 0;
}
