
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>

using namespace cv;

int main(int argc, char** argv)
{
 double alpha = 0.5; double beta;
 Mat src1, src2, dst,t;
 /// Ask the user enter alpha
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

 beta = ( 1.0 - alpha );
 addWeighted( src1, alpha, src2, beta, 0.0, dst);
 return 0;
}
