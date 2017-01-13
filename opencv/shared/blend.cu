#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;
class blendFunctor
{
  float alpha;

public:
  blendFunctor(float alpha)
  {
    this->alpha = alpha;
  }
  __device__ void operator() (const thrust::window_2d<uchar> &inputWindow1,const thrust::window_2d<uchar> &inputWindow2,const thrust::window_2d<uchar> &outputWindow) const
  {

    outputWindow[0][0] = 0.5 * inputWindow1[make_int2(0,0)]+0.5 *  inputWindow2[make_int2(0,0)];
  }
};

int main(int argc, char const *argv[]) {
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  Mat input1 = imread("santiago.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat input2 = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat temp1;
  resize(input1,temp1,Size(dim,dim));
  input1 = temp1;
  Mat temp2;
  resize(input2,temp2,Size(dim,dim));
  input2 = temp2;
  thrust::block_2d<uchar> input_image_block_1 (input1.cols,input1.rows);
  thrust::block_2d<uchar> input_image_block_2 (input2.cols,input2.rows);
  thrust::block_2d<uchar> output_image_block (input1.cols,input1.rows);
  uchar * ucharImageData1 = (uchar * )malloc(sizeof(uchar)*(input1.cols*input1.rows));
  uchar * ucharImageData2 = (uchar * )malloc(sizeof(uchar)*(input1.cols*input1.rows));
  unsigned char * charImageData = (unsigned char *)malloc(sizeof(unsigned char)*(input_image_block_1.end()-input_image_block_1.begin()));
    for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    ucharImageData1[i]=(uchar)input1.ptr()[i];
  }
  input_image_block_1.assign(ucharImageData1,ucharImageData1+input1.cols*input1.rows);
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    ucharImageData2[i]=(uchar)input2.ptr()[i];
  }
  input_image_block_2.assign(ucharImageData2,ucharImageData2+input2.cols*input2.rows);
  thrust::window_vector<uchar> inputWindow1 (&input_image_block_1,1,1,1,1);
  thrust::window_vector<uchar> inputWindow2 (&input_image_block_2,1,1,1,1);
  thrust::window_vector<uchar> outputWindow (&output_image_block,1,1,1,1);
  thrust::transform(thrust::cuda::shared,inputWindow1.begin(),inputWindow1.end(),inputWindow2.begin(),outputWindow.begin(),blendFunctor(0));
  cudaMemcpy(charImageData,output_image_block.data().get(),sizeof(uchar)*(output_image_block.end()-output_image_block.begin()),cudaMemcpyDeviceToHost);
  // for(int i = 0; i<input1.cols*input1.rows;i++)
  // {
  //   charImageData[i]=(unsigned char)ucharImageData[i];
  // }
  Mat output (Size(input1.cols,input1.rows),CV_8UC1,charImageData);
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
