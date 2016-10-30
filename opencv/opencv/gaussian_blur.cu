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
  imshow("Image", image);//displaying image
  Mat image1=image.clone();//cloning image
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  float milliseconds;
  cudaEventRecord(start);
  GaussianBlur( image, image1, Size( 7, 7), 0, 0 );//applying Gaussian filter
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  cudaEventElapsedTime(&milliseconds, start, stop);
  std::cout<<"Time taken on OpenCV = "<<milliseconds<<std::endl;
  imshow("image1:",image1);//displaying image1
  waitKey(0);
}
