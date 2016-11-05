#include <opencv2/opencv.hpp>
#include <opencv2/cudaimgproc.hpp>

int main( int argc, char** argv )
{
 double alpha = 0.5; double beta;

 cv::Mat src1, src2, dst;
 cv::cuda::GpuMat src1_d, src2_d,dst_d;

 /// Ask the user enter alpha
 alpha = 0.5;

 /// Read image ( same size, same type )
 src1 = cv::imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
 src2 = cv::imread("ainput.png",CV_LOAD_IMAGE_GRAYSCALE);

 if( !src1.data ) { printf("Error loading src1 \n"); return -1; }
 if( !src2.data ) { printf("Error loading src2 \n"); return -1; }

 src1_d.upload(src1);
 src2_d.upload(src2);

 beta = ( 1.0 - alpha );
 cv::cuda::addWeighted( src1_d, alpha, src2_d, beta, 0.0, dst_d);
 dst_d.download(dst);

 imwrite( "blend.png", dst );
 return 0;
}
