#include <opencv2/opencv.hpp>
#include <opencv2/cudawarping.hpp>
int main( int argc, char** argv )
{
  cv::Mat src, dst,r;
  cv::cuda::GpuMat src_d, dst_d;
  r = cv::imread( "car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  cv::resize(r,src,cv::Size(512,512));
  src_d.upload(src);
  cv::cuda::pyrDown( src_d, dst_d);
  dst_d.download(dst);
  cv::imwrite( "pyrdown.png", dst );
  return 0;
}
