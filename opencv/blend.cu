#include <opencv2/opencv.hpp>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#include <math.h>
using namespace cv;

class blendFunctor: public thrust::shared_binary_window_transform_functor<float>
{
  float alpha;
public:
  blendFunctor(float alpha)
  {
    this->alpha = alpha;
  }
  __device__ void operator() (const thrust::window_2d<float> &inputWindow1,const thrust::window_2d<float> &inputWindow2,const thrust::window_2d<float> &outputWindow) const
  {
    outputWindow[0][0] = alpha*inputWindow1[0][0];//+(1-alpha)*inputWindow2[0][0];
  }
};

int main(int argc, char const *argv[]) {
  Mat input1 = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat input2 = imread("corners.png",CV_LOAD_IMAGE_GRAYSCALE);
  Mat temp1;
  resize(input1,temp1,Size(500,500));
  input1 = temp1;
  Mat temp2;
  resize(input2,temp2,Size(500,500));
  input2 = temp2;
  thrust::block_2d<float> input_image_block_1 (input1.cols,input1.rows);
  thrust::block_2d<float> input_image_block_2 (input2.cols,input2.rows);
  thrust::fill(input_image_block_1.begin(),input_image_block_1.end(),0.0f);
  thrust::fill(input_image_block_2.begin(),input_image_block_2.end(),0.0f);
  thrust::block_2d<float> output_image_block (input1.cols,input1.rows);
  thrust::fill(output_image_block.begin(),output_image_block.end(),0.0f);
  float * floatImageData = (float * )malloc(sizeof(float)*(input1.cols*input1.rows));
  unsigned char * charImageData = (unsigned char *)malloc(sizeof(unsigned char)*(input_image_block_1.end()-input_image_block_1.begin()));
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    floatImageData[i]=(float)input1.ptr()[i];
  }
  input_image_block_1.assign(charImageData,charImageData+input1.cols*input1.rows);
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    floatImageData[i]=(float)input2.ptr()[i];
  }
  input_image_block_2.assign(charImageData,charImageData+input2.cols*input2.rows);
  thrust::window_vector<float> inputWindow1 (&input_image_block_1,1,1,1,1);
  thrust::window_vector<float> inputWindow2 (&input_image_block_2,1,1,1,1);
  thrust::window_vector<float> outputWindow (&output_image_block,1,1,1,1);

  thrust::transform(thrust::cuda::shared,inputWindow1.begin(),inputWindow1.end(),inputWindow2.begin(),outputWindow.begin(),blendFunctor(0));
  cudaMemcpy(floatImageData,thrust::raw_pointer_cast(output_image_block.data()),sizeof(float)*(output_image_block.end()-output_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    charImageData[i]=(unsigned char)floatImageData[i];
  }

  Mat output (Size(input1.cols,input1.rows),CV_8UC1,charImageData);
  // std::cout<<output;
  // cudaCheckError();
  // std::cout<<output.type()<<"  "<<Size(input1.cols,input1.rows)<<"="<<image_block.end()-image_block.begin()<<"\n";
  imshow("blend-input1.png",input1);
  imshow("blend-input2.png",input2);
  // imwrite("output",output);
  imshow("blend-output.png",output);
  waitKey(0);
  return 0;
}
