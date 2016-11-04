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
  __device__ float operator() (const thrust::window_2d<float> &inputWindow1,const thrust::window_2d<float> &inputWindow2) const
  {
    return alpha*inputWindow1[0][0]+(1-alpha)*inputWindow2[0][0];
  }
};
int main(int argc, char const *argv[]) {
  Mat input1 = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat input2 = imread("aoutput.png",CV_LOAD_IMAGE_GRAYSCALE);
  Mat temp1;
  resize(input1,temp1,Size(500,500));
  input1 = temp1;
  Mat temp2;
  resize(input2,temp2,Size(500,500));
  input2 = temp2;
  thrust::block_2d<float> input_image_block_1 (input1.cols,input1.rows,0.0f);
  thrust::block_2d<float> input_image_block_2 (input2.cols,input2.rows,0.0f);
  thrust::block_2d<float> output_image_block (input1.cols,input1.rows,0.0f);
  float * floatImageData = (float * )malloc(sizeof(float)*(input1.cols*input1.rows));
  unsigned char * charImageData = (unsigned char *)malloc(sizeof(unsigned char)*(input_image_block_1.end()-input_image_block_1.begin()));
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    floatImageData[i]=(float)input1.ptr()[i];
  }
  input_image_block_1.assign(floatImageData,floatImageData+input1.cols*input1.rows);
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    floatImageData[i]=(float)input2.ptr()[i];
  }
  input_image_block_2.assign(floatImageData,floatImageData+input2.cols*input2.rows);
  thrust::window_vector<float> inputWindow1 (&input_image_block_1,1,1,1,1);
  thrust::window_vector<float> inputWindow2 (&input_image_block_2,1,1,1,1);
  thrust::transform(inputWindow1.begin(),inputWindow1.end(),inputWindow2.begin(),output_image_block.begin(),blendFunctor(0.5));
  cudaMemcpy(floatImageData,output_image_block.data().get(),sizeof(float)*(output_image_block.end()-output_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    charImageData[i]=(unsigned char)floatImageData[i];
  }
  Mat output (Size(input1.cols,input1.rows),CV_8UC1,charImageData);
  imwrite("blend-input1.png",input1);
  imwrite("blend-input2.png",input2);
  imwrite("blend-output.png",output);
  
  return 0;
}
