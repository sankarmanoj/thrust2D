#include <opencv2/opencv.hpp>
#include <opencv2/cudaimgproc.hpp>
#include <opencv2/cudaarithm.hpp>

int main( int argc, char** argv )
{
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
 double alpha = 0.5; double beta;

 cv::Mat t, src1, src2, dst;
 cv::cuda::GpuMat src1_d, src2_d,dst_d;

 /// Ask the user enter alpha
 alpha = 0.5;
 //Set Image Dimension
 int dim = 512;
 if(argc ==2)
 {
   dim = atoi(argv[1]);
 }
 /// Read image ( same size, same type )
 t = cv::imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
 cv::resize(t,src1,cv::Size(dim,dim));
 t = cv::imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
 cv::resize(t,src2,cv::Size(dim,dim));
 if( !src1.data ) { printf("Error loading src1 \n"); return -1; }
 if( !src2.data ) { printf("Error loading src2 \n"); return -1; }

 src1_d.upload(src1);
 src2_d.upload(src2);

 beta = ( 1.0 - alpha );
 cv::cuda::addWeighted( src1_d, alpha, src2_d, beta, 0.0, dst_d);
 dst_d.download(dst);
 #ifdef OWRITE
  imwrite( "blend.png", dst );
 #endif
 #ifdef SHOW
  imshow( "blend.png", dst );
    cv::waitKey(0);
 #endif

 return 0;
}
