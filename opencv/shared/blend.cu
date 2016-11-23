#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;
class blendFunctor: public thrust::shared_binary_window_transform_functor<uchar>
{
  float alpha;
  cudaTextureObject_t t1,t2;
public:
  blendFunctor(float alpha,cudaTextureObject_t t1,cudaTextureObject_t t2)
  {
    this->alpha = alpha;
    this->t1 =t1;
    this->t2 = t2;
  }
  __device__ void operator() (const thrust::window_2d<uchar> &inputWindow1,const thrust::window_2d<uchar> &inputWindow2,const thrust::window_2d<uchar> &outputWindow) const
  {
    outputWindow[0][0] = alpha*tex2D<float>(t1,outputWindow.start_x,outputWindow.start_y)+(1-alpha)*tex2D<float>(t2,outputWindow.start_x,outputWindow.start_y);
  }
};

int main(int argc, char const *argv[]) {
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  Mat input1 = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat input2 = imread("aoutput.png",CV_LOAD_IMAGE_GRAYSCALE);
  Mat temp1;
  resize(input1,temp1,Size(512,512));
  input1 = temp1;
  Mat temp2;
  resize(input2,temp2,Size(512,512));
  input2 = temp2;
  thrust::block_2d<uchar> input_image_block_1 (input1.cols,input1.rows,0.0f);
  thrust::block_2d<uchar> input_image_block_2 (input2.cols,input2.rows,0.0f);
  thrust::block_2d<uchar> output_image_block (input1.cols,input1.rows,0.0f);
  uchar * ucharImageData = (uchar * )malloc(sizeof(uchar)*(input1.cols*input1.rows));
  unsigned char * charImageData = (unsigned char *)malloc(sizeof(unsigned char)*(input_image_block_1.end()-input_image_block_1.begin()));
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    ucharImageData[i]=(uchar)input1.ptr()[i];
  }
  input_image_block_1.assign(ucharImageData,ucharImageData+input1.cols*input1.rows);
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    ucharImageData[i]=(uchar)input2.ptr()[i];
  }
  input_image_block_2.assign(ucharImageData,ucharImageData+input2.cols*input2.rows);
  thrust::window_vector<uchar> inputWindow1 (&input_image_block_1,1,1,1,1);
  thrust::window_vector<uchar> inputWindow2 (&input_image_block_2,1,1,1,1);
  thrust::window_vector<uchar> outputWindow (&output_image_block,1,1,1,1);
  thrust::transform(thrust::cuda::shared,inputWindow1.begin(),inputWindow1.end(),inputWindow2.begin(),outputWindow.begin(),blendFunctor(0.5));
  cudaMemcpy(ucharImageData,output_image_block.data().get(),sizeof(uchar)*(output_image_block.end()-output_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    charImageData[i]=(unsigned char)ucharImageData[i];
  }
  Mat output (Size(input1.cols,input1.rows),CV_8UC1,charImageData);
  imwrite("blend-input1.png",input1);
  imwrite("blend-input2.png",input2);
  imwrite("blend-output.png",output);

  return 0;
}
