#include <opencv2/highgui/highgui.hpp>
#include "opencv2/imgproc/imgproc.hpp"
#include <opencv2/core/core.hpp>
#include <iostream>
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
  cv::resize(image,image,cv::Size(dim,dim));
  if (image.empty())
  {
    cout << "Cannot load image!" << endl;
    return -1;
  }
  Mat image1=image.clone();//cloning image
  GaussianBlur( image, image1, Size( 7, 7), 0, 0 );//applying Gaussian filter
}
