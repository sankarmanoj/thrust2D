#include <opencv2/opencv.hpp>
#include <opencv2/cudawarping.hpp>
int main( int argc, char** argv )
{
  cv::Mat src, dst,r;
  cv::cuda::GpuMat src_d, dst_d;
  r = cv::imread( "car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  cv::resize(r,src,cv::Size(256,256));
  src_d.upload(src);
  cv::cuda::pyrUp( src_d, dst_d);
  dst_d.download(dst);
  cv::imwrite( "pyrup.png", dst );
  return 0;
}
