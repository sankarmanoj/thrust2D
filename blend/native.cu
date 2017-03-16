#include <opencv2/opencv.hpp>
#include <thrust/device_vector.h>
#include <thrust/shared_for_each.h>
using namespace cv;
int iDivUp(int a, int b)
{
    return (a % b != 0) ? (a / b + 1) : (a / b);
}
__global__ void blendKernel(uchar * input1,uchar * input2, uchar * output,float alpha, int size)
{
  int index = threadIdx.x + blockIdx.x*blockDim.x;
  int stride = blockDim.x*gridDim.x;
  while(index<size)
  {
  output[index] = input1[index]*alpha + input2[index]*(1-alpha);
  index+=stride;
  }
}

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

  uchar * d_input1, *d_input2,*d_output;
  cudaMalloc((void **)&d_input1,sizeof(uchar)*dim*dim);
  cudaMalloc((void **)&d_input2,sizeof(uchar)*dim*dim);
  cudaMalloc((void **)&d_output,sizeof(uchar)*dim*dim);
  uchar * h_output = new uchar[dim*dim];
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start);
  for(int i = 0; i<10;i++)
  {
  cudaMemcpy(d_input1,input1.ptr(),sizeof(uchar)*dim*dim,cudaMemcpyHostToDevice);
  cudaMemcpy(d_input2,input2.ptr(),sizeof(uchar)*dim*dim,cudaMemcpyHostToDevice);
  blendKernel<<<30,1024>>>(d_input1,d_input2,d_output,0.3,dim*dim);
  cudaMemcpy(h_output,d_output,sizeof(uchar)*dim*dim,cudaMemcpyDeviceToHost);
  }
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  float time_in_ms;
  cudaEventElapsedTime(&time_in_ms,start,stop);
  printf("Native Blend = %f\n",time_in_ms);
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
