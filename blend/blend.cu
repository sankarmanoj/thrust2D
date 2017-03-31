#include <opencv2/opencv.hpp>
#include <thrust/device_vector.h>
#include <thrust/shared_for_each.h>
using namespace cv;
class blendFunctor
{
  float alpha;
public:
  blendFunctor(float alpha)
  {
    this->alpha = alpha;
  }
  __device__ uchar operator() (uchar &input1,uchar &input2) const
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
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  Mat input1 = imread("../opencv/shared/santiago.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat input2 = imread("../opencv/shared/car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat temp1;
  resize(input1,temp1,Size(dim,dim));
  input1 = temp1;
  Mat temp2;
  resize(input2,temp2,Size(dim,dim));
  input2 = temp2;

  thrust::host_vector<uchar>host_input_vector1(input1.ptr(),input1.ptr()+input1.cols*input1.rows);
  thrust::host_vector<uchar>host_input_vector2(input2.ptr(),input2.ptr()+input2.cols*input2.rows);

  thrust::device_vector<uchar>input_vector1(input1.ptr(),input1.ptr()+input1.cols*input1.rows);
  thrust::device_vector<uchar>input_vector2(input2.ptr(),input2.ptr()+input2.cols*input2.rows);
  thrust::device_vector<uchar>output_vector(input1.cols*input1.rows);
  thrust::host_vector<uchar>host_output_vector(input1.cols*input1.rows);

  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start);
  for(int i = 0; i<10;i++)
  {
    input_vector1 = host_input_vector1;
    input_vector2 = host_input_vector2;
    thrust::transform(input_vector1.begin(),input_vector1.end(),input_vector2.begin(),output_vector.begin(),blendFunctor(0.3));
    host_output_vector = output_vector;
  }
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  float time_in_ms;
  cudaEventElapsedTime(&time_in_ms,start,stop);
  printf("Non Shared Blend = %f\n",time_in_ms);
  Mat output (Size(input1.cols,input1.rows),CV_8UC1,host_output_vector.data());
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
