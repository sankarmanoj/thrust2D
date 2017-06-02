
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
#include <omp.h>
using namespace cv;

int main(int argc, char** argv)
{
 double alpha = 0.5; double beta;
 Mat input1, input2, output,t;
 /// Ask the user enter alpha
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

 /// Read image ( same size, same type )
 t = cv::imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
 cv::resize(t,input1,cv::Size(dim,dim));
 t = cv::imread("corners.png",CV_LOAD_IMAGE_GRAYSCALE);
 cv::resize(t,input2,cv::Size(dim,dim));
 if( !input1.data ) { printf("Error loading input1 \n"); return -1; }
 if( !input2.data ) { printf("Error loading input2 \n"); return -1; }

 beta = ( 1.0 - alpha );
 double start, end;
 start = omp_get_wtime();
 addWeighted( input1, alpha, input2, beta, 0.0, output);
 end = omp_get_wtime();
 printf("%f\n",(end-start));


 #ifdef OWRITE
 imwrite("blend-input1.png",input1);
 imwrite("blend-input2.png",input2);
 imwrite("blend-output.png",output);
 #endif
 #ifdef SHOW
 imshow("blend-input1.png",input1);
 imshow("blend-input2.png",input2);
 imshow("blend-output.png",output);
 waitKey(0);
 #endif
 return 0;
}
