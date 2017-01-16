#include <opencv2/opencv.hpp>
#include <opencv2/cudawarping.hpp>
int main( int argc, char** argv )
{
  cv::Mat image,timage, warp_dst;
  cv::cuda::GpuMat image1;
  /// Load the image
  timage = cv::imread( "car.jpg", CV_LOAD_IMAGE_GRAYSCALE );
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  resize(timage,image,Size(dim,dim));
  image1.upload(image);
  cv::Point2f srcTri[3];
  cv::Point2f dstTri[3];
  cv::Mat warp_mat( 2, 3, CV_32FC1 );
  /// Set the dst image the same type and size as src
  warp_dst = cv::Mat::zeros( image.rows, image.cols, image.type() );
  cv::cuda::GpuMat warp_dst1;
  /// Set your 3 points to calculate the  Affine Transform
  srcTri[0] = cv::Point2f( 0,0 );
  srcTri[1] = cv::Point2f( image.cols - 1, 0 );
  srcTri[2] = cv::Point2f( 0, image.rows - 1 );
  dstTri[0] = cv::Point2f( image.cols*0.0, image.rows*0.5 );
  dstTri[1] = cv::Point2f( image.cols*0.8, image.rows*0.2 );
  dstTri[2] = cv::Point2f( image.cols*0.2, image.rows*0.7 );
  /// Get the Affine Transform
  warp_mat = cv::getAffineTransform( srcTri, dstTri );
  warp_dst1.upload(warp_dst);
  /// Apply the Affine Transform just found to the src image
  cv::cuda::warpAffine(image1, warp_dst1, warp_mat, warp_dst1.size());

  warp_dst1.download(warp_dst);
  image1.download(image);
  cv::imwrite("ainput.png",image);
  cv::imwrite("aoutput.png",warp_dst);
  return 0;
}
