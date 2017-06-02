#include <omp.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
using namespace cv;

int main(int argc, char** argv)
{
    Mat output, image;
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
    erode(image, output, Mat(), Point(-1, -1), 2, 1, 1);
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
