#include <opencv2/opencv.hpp>
#include <opencv2/cudawarping.hpp>
int main( int argc, char** argv )
{
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  cv::Mat src, dst,r;
  cv::cuda::GpuMat src_d, dst_d;
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  r = cv::imread( "car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  cv::resize(r,src,cv::Size(dim,dim));
  src_d.upload(src);
  cv::cuda::pyrDown( src_d, dst_d);
  dst_d.download(dst);
  #ifdef OWRITE
  cv::imwrite( "pyrdown.png", dst );
  #endif

  #ifdef SHOW
  cv::imshow( "pyrdown.png", dst );
    cv::waitKey(0);
  #endif

  return 0;
}
