#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;
class AffineTransformFunctor : public thrust::shared_window_for_each_functor<float>
{
public:
  thrust::block_2d<float> *transformMatrix;
  thrust::block_2d<float> *outBlock;

  AffineTransformFunctor(thrust::block_2d<float> * tm,thrust::block_2d<float> * outBlock)
  {
    this->transformMatrix = tm->device_pointer;
    this->outBlock = outBlock->device_pointer;
  }
  __device__ void operator() (const thrust::window_2d<float> &inputWindow) const
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
  cudaEvent_t m_start, m_stop;
  cudaEventCreate(&m_start);
  cudaEventCreate(&m_stop);
  float m_milliseconds;
  cudaEventRecord(m_start);
  thrust::block_2d<float> float_image_block (image.cols,image.rows,0.0f);
  thrust::block_2d<float> outBlock (image.cols,image.rows,0.0f);
  float * img = (float * )malloc(sizeof(float)*(image.cols*image.rows));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  cudaEventRecord(m_stop);
  cudaEventSynchronize(m_stop);
  cudaEventElapsedTime(&m_milliseconds, m_start, m_stop);
  std::cout<<"Time taken from Host to Device = "<<m_milliseconds<<std::endl;
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
  thrust::block_2d<float> warp_block(warp_mat.cols,warp_mat.rows);
  for(int i = 0; i< warp_mat.rows;i++)
  {
    for(int j = 0; j<warp_mat.cols;j++)
    {
      warp_block[i][j]=warp_mat.at<float>(i,j);
    }
  }
  //Create Windows For Indexing
  thrust::window_vector<float> inputVector(&float_image_block,1,1,1,1);
  AffineTransformFunctor atf(&warp_block,&outBlock);
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  float milliseconds;
  cudaEventRecord(start);
  // TODO: Does not work.
  thrust::for_each(thrust::cuda::shared,inputVector.begin(),inputVector.end(),atf);
  cudaDeviceSynchronize();
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  cudaEventElapsedTime(&milliseconds, start, stop);
  std::cout<<"Time taken on Shared = "<<milliseconds<<std::endl;
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaEventRecord(m_start);
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
  cudaEventRecord(m_stop);
  cudaEventSynchronize(m_stop);
  cudaEventElapsedTime(&m_milliseconds, m_start, m_stop);
  std::cout<<"Time taken from Device to Host = "<<m_milliseconds<<std::endl;
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("aoutput.png",output);
  return 0;
}