#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
#include <omp.h>
using namespace cv;
int main(int argc, char** argv)
{
  Mat image, warp_dst;
  /// Load the image
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
  Point2f srcTri[3];
  Point2f dstTri[3];
  Mat warp_mat( 2, 3, CV_32FC1 );
  /// Set the dst image the same type and size as src
  warp_dst = Mat::zeros( image.rows, image.cols, image.type() );
  /// Set your 3 points to calculate the  Affine Transform
  srcTri[0] = Point2f( 0,0 );
  srcTri[1] = Point2f( image.cols - 1, 0 );
  srcTri[2] = Point2f( 0, image.rows - 1 );
  dstTri[0] = Point2f( image.cols*0.0, image.rows*0.5 );
  dstTri[1] = Point2f( image.cols*0.8, image.rows*0.2 );
  dstTri[2] = Point2f( image.cols*0.2, image.rows*0.7 );
  /// Get the Affine Transform
  warp_mat = getAffineTransform( srcTri, dstTri );
  /// Apply the Affine Transform just found to the src image
  double start, end;
  start = omp_get_wtime();
  warpAffine( image, warp_dst, warp_mat, warp_dst.size() );
  end = omp_get_wtime();
  printf("%f\n",(end-start));

  #ifdef OWRITE
  imwrite("input.png",image);
  imwrite("output.png",warp_dst);
  #endif
  #ifdef SHOW
  imshow("input.png",image);
  imshow("output.png",warp_dst);
  waitKey(0);
  #endif
  return 0;
}
