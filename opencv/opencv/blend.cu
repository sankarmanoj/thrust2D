#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>

using namespace cv;

int main( int argc, char** argv )
{
 double alpha = 0.5; double beta;

 Mat src1, src2, dst;

 /// Ask the user enter alpha
 alpha = 0.5;

 /// Read image ( same size, same type )
 src1 = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
 src2 = imread("ainput.png",CV_LOAD_IMAGE_GRAYSCALE);

 if( !src1.data ) { printf("Error loading src1 \n"); return -1; }
 if( !src2.data ) { printf("Error loading src2 \n"); return -1; }

 /// Create Windows
 namedWindow("Linear Blend", 1);

 beta = ( 1.0 - alpha );
 cudaEvent_t start, stop;
 cudaEventCreate(&start);
 cudaEventCreate(&stop);
 float milliseconds;
 cudaEventRecord(start);
 addWeighted( src1, alpha, src2, beta, 0.0, dst);
 cudaEventRecord(stop);
 cudaEventSynchronize(stop);
 cudaEventElapsedTime(&milliseconds, start, stop);
 std::cout<<"Time taken on OpenCV = "<<milliseconds<<std::endl;

 imshow( "Linear Blend", dst );

 waitKey(0);
 return 0;
}
