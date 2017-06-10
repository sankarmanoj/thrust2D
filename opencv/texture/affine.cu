#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;
__constant__ float constantTransformMatrix [6];
class AffineTransformFunctor : public thrust::shared_unary_window_transform_functor<uchar>
{
public:
  thrust::block_2d<uchar> *outBlock;

  AffineTransformFunctor(thrust::block_2d<uchar> * outBlock)
  {

    this->outBlock = outBlock;
  }
  __device__ void operator() (const thrust::window_2d<uchar> &inputWindow, const thrust::window_2d<uchar> &outputWindow) const
  {
    int x_out, y_out;
    x_out = (int)(constantTransformMatrix[0]*inputWindow.start_x+constantTransformMatrix[1]*inputWindow.start_y+constantTransformMatrix[2]*1);
    y_out = (int)(constantTransformMatrix[0+3]*inputWindow.start_x+constantTransformMatrix[1+3]*inputWindow.start_y+constantTransformMatrix[2+3]*1);
    (*outBlock)[y_out][x_out]=inputWindow[make_int2(0,0)];
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

  cudaMemcpyToSymbol(constantTransformMatrix,warp_mat.ptr(),sizeof(float)*warp_mat.rows*warp_mat.cols);
  //Create Windows For Indexing
  thrust::window_vector<uchar> inputVector(&uchar_image_block,1,1,1,1);
  AffineTransformFunctor atf(outBlock.device_pointer);
  thrust::transform(thrust::cuda::texture,inputVector.begin(),inputVector.end(),inputVector.begin(),atf);
  // cudaDeviceSynchronize();
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  outBlock.download(&img);
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
