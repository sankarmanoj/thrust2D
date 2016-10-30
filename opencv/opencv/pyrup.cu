#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <iostream>
using namespace cv;
Mat src, dst, tmp;
int main( int argc, char** argv )
{
  src = imread( "car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  if( !src.data )
    { printf(" No data! -- Exiting the program \n");
      return -1; }
  dst = tmp;
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  float milliseconds;
  cudaEventRecord(start);
  pyrUp( src, dst, Size( tmp.cols*2, tmp.rows*2));
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  cudaEventElapsedTime(&milliseconds, start, stop);
  std::cout<<"Time taken on OpenCV = "<<milliseconds<<std::endl;
  imshow( "pyrdown", dst );
  waitKey(0);
  return 0;
}
