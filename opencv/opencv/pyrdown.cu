#include <opencv2/opencv.hpp>
#include <opencv2/cudawarping.hpp>
int main( int argc, char** argv )
{
  cv::Mat src, dst;
  cv::cuda::GpuMat src_d, dst_d;
  src = cv::imread( "car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  src_d.upload(src);
  cv::cuda::pyrDown( src_d, dst_d);
  dst_d.download(dst);
  cv::imwrite( "pyrdown.png", dst );
  return 0;
}
