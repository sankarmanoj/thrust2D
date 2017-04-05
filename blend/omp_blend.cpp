#define THRUST_DEVICE_SYSTEM 2
#include <opencv2/opencv.hpp>
#include <thrust/device_vector.h>
#include <thrust/transform.h>
using namespace cv;
class blendFunctor
{
  float alpha;
public:
  blendFunctor(float alpha)
  {
    this->alpha = alpha;
  }
  uchar operator() (uchar &input1,uchar &input2) const
  {
    return alpha * input1+ (1-alpha) *  input2;
  }
};

int main(int argc, char const *argv[]) {
  int dim = 4096;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  Mat input1 = imread("./car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat input2 = imread("./car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat temp1;
  resize(input1,temp1,Size(dim,dim));
  input1 = temp1;
  Mat temp2;
  resize(input2,temp2,Size(dim,dim));
  input2 = temp2;
  thrust::device_vector<uchar>input_vector1(input1.ptr(),input1.ptr()+input1.cols*input1.rows);
  thrust::device_vector<uchar>input_vector2(input2.ptr(),input2.ptr()+input2.cols*input2.rows);
  thrust::device_vector<uchar>output_vector(input1.cols*input1.rows);
  start = omp_get_wtime();
  thrust::transform(input_vector1.begin(),input_vector1.end(),input_vector2.begin(),output_vector.begin(),blendFunctor(0.3));
  end = omp_get_wtime();
  printf("%f\n",(end-start)*1000);
  Mat output (Size(input1.cols,input1.rows),CV_8UC1,output_vector.data());
  return 0;
}
