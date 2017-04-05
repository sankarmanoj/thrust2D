#include <opencv2/opencv.hpp>
#include <omp.h>
using namespace cv;
int iDivUp(int a, int b)
{
    return (a % b != 0) ? (a / b + 1) : (a / b);
}
void blendKernel(uchar * input1,uchar * input2, uchar * output,float alpha, int size)
{
  #pragma omp parallel for 
  for(int index = 0 ; index<size; index++)
  {
    output[index] = input1[index]*alpha + input2[index]*(1-alpha);
  }
}

int main(int argc, char const *argv[]) {
  int dim = 4096;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  Mat input1 = imread("../opencv/shared/santiago.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat input2 = imread("../opencv/shared/car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat temp1;
  resize(input1,temp1,Size(dim,dim));
  input1 = temp1;
  Mat temp2;
  resize(input2,temp2,Size(dim,dim));
  input2 = temp2;
  uchar * h_output = new uchar[dim*dim];
  double start, end;
  start = omp_get_wtime();
  blendKernel(input1.ptr(),input2.ptr(),h_output,0.3,dim*dim);
  end = omp_get_wtime();
  printf("%f\n",(end-start)*1000);


  Mat output (Size(input1.cols,input1.rows),CV_8UC1,h_output);
  #ifdef OWRITE
  imwrite("blend-input1.png",input1);
  imwrite("blend-input2.png",input2);
  imwrite("blend-output.png",output);
  #endif
  #ifdef SHOW
  Mat out;
  resize(input1,temp1,Size(512,512));
  imshow("blend-input1.png",temp1);
  resize(input2,temp2,Size(512,512));
  imshow("blend-input2.png",temp2);
  resize(output,out,Size(512,512));
  imshow("blend-output.png",out);
  waitKey(0);
  #endif
  return 0;
}
