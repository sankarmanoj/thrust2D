#include <opencv2/highgui/highgui.hpp>
#include "opencv2/imgproc/imgproc.hpp"
#include <opencv2/core/core.hpp>
#include <iostream>
#include <omp.h>
using namespace cv;
using namespace std;
int main(int argc, char** argv)
{
  Mat image;
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
  if (image.empty())
  {
    cout << "Cannot load image!" << endl;
    return -1;
  }
  Mat output=image.clone();//cloning image
  double start, end;
  start = omp_get_wtime();
  GaussianBlur( image, output, Size( 7, 7), 0, 0 );//applying Gaussian filter
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
