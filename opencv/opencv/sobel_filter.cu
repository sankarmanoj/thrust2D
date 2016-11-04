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
  int scale = 1;
  int delta = 0;
  int ddepth = CV_16S;
  /// Generate grad_x and grad_y
  Mat grad_x, grad_y,grad;
  Mat abs_grad_x, abs_grad_y;

  /// Gradient X
  //Scharr( src_gray, grad_x, ddepth, 1, 0, scale, delta, BORDER_DEFAULT );
  Sobel( image, grad_x, ddepth, 1, 0, 3, scale, delta, BORDER_DEFAULT );
  convertScaleAbs( grad_x, abs_grad_x );

  /// Gradient Y
  //Scharr( src_gray, grad_y, ddepth, 0, 1, scale, delta, BORDER_DEFAULT );
  Sobel( image, grad_y, ddepth, 0, 1, 3, scale, delta, BORDER_DEFAULT );
  convertScaleAbs( grad_y, abs_grad_y );

  /// Total Gradient (approximate)
  addWeighted( abs_grad_x, 0.5, abs_grad_y, 0.5, 0, grad );
  imwrite("output.png",grad);//displaying image1

}
