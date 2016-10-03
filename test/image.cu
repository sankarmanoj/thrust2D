#include <opencv2/opencv.hpp>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <thrust/window_2d.h>
using namespace cv;
int main(int argc, char const *argv[]) {
  Mat image = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  std::cout<<image.type()<<"  "<<image.isContinuous()<<std::endl;
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  image_block.assign(image.ptr(),image.ptr()+image.cols*image.rows);
  unsigned char * outputImageData = (unsigned char *)malloc(sizeof(unsigned char)*(image_block.end()-image_block.begin()));
  cudaMemcpy(outputImageData,thrust::raw_pointer_cast(image_block.data()),sizeof(unsigned char)*(image_block.end()-image_block.begin()),cudaMemcpyDeviceToHost);
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputImageData);
  std::cout<<output.type()<<"  "<<Size(image.cols,image.rows)<<"="<<image_block.end()-image_block.begin()<<"\n";
  imshow("input",image);
  imshow("output",output);
  waitKey(0);
  // std::cout<<image<<"\n";
  return 0;
}
