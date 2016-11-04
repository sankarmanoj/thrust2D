#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
using namespace cv;

int main ( int argc, char **argv )
{
    Mat im_gray;
    Mat img_bw;
    Mat img_final;
    Mat im_rgb  = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE );
    erode(im_rgb, img_final, Mat(), Point(-1, -1), 2, 1, 1);
    imwrite("erode.png",img_final);

    return 0;
}
