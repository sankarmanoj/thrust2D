#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <iostream>
using namespace cv;
int main(int argc, char** argv)
{
  Mat image, dst;
  image = cv::imread( "car.jpg", CV_LOAD_IMAGE_GRAYSCALE );
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  cv::resize(image,image,cv::Size(dim,dim));
  pyrUp(image, dst, Size(dst.cols*2, dst.rows*2));
  return 0;
}
