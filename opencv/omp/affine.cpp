#define THRUST_DEVICE_SYSTEM 2
#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <omp.h>
using namespace cv;
class AffineTransformFunctor
{
public:
  thrust::block_2d<float> *transformMatrix;
  thrust::block_2d<uchar> *outBlock;

  AffineTransformFunctor(thrust::block_2d<float> * tm,thrust::block_2d<uchar> * outBlock)
  {
    this->transformMatrix = tm->device_pointer;
    this->outBlock = outBlock->device_pointer;
  }
   __host__ void operator() (const thrust::window_2d<uchar> &inputWindow) const
  {
    int x_out, y_out;
    x_out = (int)((*transformMatrix)[0][0]*inputWindow.start_x+(*transformMatrix)[0][1]*inputWindow.start_y+(*transformMatrix)[0][2]*1);
    y_out = (int)((*transformMatrix)[1][0]*inputWindow.start_x+(*transformMatrix)[1][1]*inputWindow.start_y+(*transformMatrix)[1][2]*1);

    (*outBlock)[y_out][x_out]=inputWindow[0][0];
  }
};
int main(int argc, char const *argv[]) {
  Mat image;
  image = cv::imread( "car.jpg", CV_LOAD_IMAGE_GRAYSCALE );
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  if(argc==3)
  {
    dim = atoi(argv[1]);
    omp_set_num_threads(atoi(argv[2]));
  }
  cv::resize(image,image,cv::Size(dim,dim));
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
  //thrust::host_block_2d<float> host_warp_block(warp_mat.cols,warp_mat.rows);
  thrust::block_2d<float> warp_block(warp_mat.cols,warp_mat.rows);
  for(int i = 0; i< warp_mat.rows;i++)
  {
    for(int j = 0; j<warp_mat.cols;j++)
    {
      warp_block[i][j]=warp_mat.at<float>(i,j);
    }
  }
  //warp_block = host_warp_block;
  //Create Windows For Indexing
  thrust::window_vector<uchar> inputVector(&uchar_image_block,1,1,1,1);
  AffineTransformFunctor atf(&warp_block,&outBlock);
  double start, end;
  start = omp_get_wtime();

  end = omp_get_wtime();
  printf("%f\n",(end-start));

  thrust::for_each(inputVector.begin(),inputVector.end(),atf);
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
