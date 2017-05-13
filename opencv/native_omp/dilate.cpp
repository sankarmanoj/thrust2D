
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
using namespace cv;

int main(int argc, char** argv)
{

    Mat img_final,image;
    image = cv::imread( "car.jpg", CV_LOAD_IMAGE_GRAYSCALE );
    int dim = 512;
    if(argc ==2)
    {
      dim = atoi(argv[1]);
    }
    cv::resize(image,image,cv::Size(dim,dim));
    dilate(image, img_final, Mat(), Point(-1, -1), 2, 1, 1);
    return 0;
}
