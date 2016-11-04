#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;
class AffineTransformFunctor
{
public:
  thrust::host_block_2d<float> *transformMatrix;
  thrust::host_block_2d<float> *outBlock;

  AffineTransformFunctor(thrust::host_block_2d<float> * tm,thrust::host_block_2d<float> * outBlock)
  {
    this->transformMatrix = tm->device_pointer;
    this->outBlock = outBlock->device_pointer;
  }
  __host__ void operator() (const thrust::host_window_2d<float> &inputWindow) const
  {
    int x_out, y_out;
    x_out = (int)((*transformMatrix)[0][0]*inputWindow.start_x+(*transformMatrix)[0][1]*inputWindow.start_y+(*transformMatrix)[0][2]*1);
    y_out = (int)((*transformMatrix)[1][0]*inputWindow.start_x+(*transformMatrix)[1][1]*inputWindow.start_y+(*transformMatrix)[1][2]*1);

    (*outBlock)[y_out][x_out]=inputWindow[0][0];
  }
};
int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  image = small;
  thrust::host_block_2d<float> float_image_block (image.cols,image.rows,0.0f);
  thrust::host_block_2d<float> outBlock (image.cols,image.rows,0.0f);
  float * img = (float * )malloc(sizeof(float)*(image.cols*image.rows));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
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
  thrust::host_block_2d<float> warp_block(warp_mat.cols,warp_mat.rows);
  for(int i = 0; i< warp_mat.rows;i++)
  {
    for(int j = 0; j<warp_mat.cols;j++)
    {
      warp_block[i][j]=warp_mat.at<float>(i,j);
    }
  }
  //Create Windows For Indexing
  thrust::host_window_vector<float> inputVector(&float_image_block,1,1,1,1);
  AffineTransformFunctor atf(&warp_block,&outBlock);
  thrust::for_each(thrust::host,inputVector.begin(),inputVector.end(),atf);
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyHostToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("aoutput.png",output);
  return 0;
}
