#include <opencv2/opencv.hpp>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <thrust/window_2d.h>
using namespace cv;
int main(int argc, char const *argv[]) {
  Mat image = imread("car.jpg");
  thrust::host_vector<int> image_vector (image.datastart,image.dataend);
  thrust::block_2d<int> image_block (image.cols,image.rows);
  thrust::copy(image_vector.begin(),image_vector.end(),image_block.begin());
  // std::cout<<image<<"\n";
  return 0;
}
