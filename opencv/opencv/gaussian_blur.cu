#include <opencv2/highgui/highgui.hpp>
#include "opencv2/imgproc/imgproc.hpp"
#include <opencv2/core/core.hpp>
#include <iostream>
using namespace cv;
using namespace std;
int main()
{
  Mat image = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  if (image.empty())
  {
    cout << "Cannot load image!" << endl;
    return -1;
  }
  imwrite("input.png", image);//displaying image
  Mat image1=image.clone();//cloning image
  GaussianBlur( image, image1, Size( 7, 7), 0, 0 );//applying Gaussian filter
  imwrite("output.png",image1);//displaying image1

}
