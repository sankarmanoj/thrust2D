#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <omp.h>
using namespace cv;
int main(int argc, char** argv)
{
  Mat image, output;
  image = cv::imread( "car.jpg", CV_LOAD_IMAGE_GRAYSCALE );
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  if(argc==3)
  {
    dim = atoi(argv[1]);
    omp_set_num_threads(atoi(argv[2]));
  }
  cv::resize(image,image,cv::Size(dim,dim));
  double start, end;
  start = omp_get_wtime();
  pyrDown(image, output, Size(image.cols/2, image.rows/2));
  end = omp_get_wtime();
  printf("%f\n",(end-start));
  #ifdef OWRITE
  imwrite("input.png",image);
  imwrite("output.png",output);
  #endif
  #ifdef SHOW
  imshow("input.png",image);
  imshow("output.png",output);
  waitKey(0);
  #endif
  return 0;
}
