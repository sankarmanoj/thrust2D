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
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    float milliseconds;
    cudaEventRecord(start);
    erode(im_rgb, img_final, Mat(), Point(-1, -1), 2, 1, 1);
    cudaEventRecord(stop);
    cudaEventSynchronize(stop);
    cudaEventElapsedTime(&milliseconds, start, stop);
    std::cout<<"Time taken on OpenCV = "<<milliseconds<<std::endl;
    imshow("dilate",img_final);
    waitKey(0);
    return 0;
}
