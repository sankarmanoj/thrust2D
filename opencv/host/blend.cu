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
  __host__ uchar operator() (const thrust::host_window_2d<uchar> &inputWindow1,const thrust::host_window_2d<uchar> &inputWindow2) const
  {
    return alpha*inputWindow1[0][0]+(1-alpha)*inputWindow2[0][0];
  }
};
int main(int argc, char const *argv[]) {
  Mat input1 = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat input2 = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat temp1;
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  resize(input1,temp1,Size(dim,dim));
  input1 = temp1;
  Mat temp2;
  resize(input2,temp2,Size(dim,dim));
  input2 = temp2;
  thrust::host_block_2d<uchar> input_image_block_1 (input1.cols,input1.rows,0.0f);
  thrust::host_block_2d<uchar> input_image_block_2 (input2.cols,input2.rows,0.0f);
  thrust::host_block_2d<uchar> output_image_block (input1.cols,input1.rows,0.0f);
  uchar * ucharImageData = (uchar * )malloc(sizeof(uchar)*(input1.cols*input1.rows));
  unsigned char * charImageData = (unsigned char *)malloc(sizeof(unsigned char)*(input_image_block_1.end()-input_image_block_1.begin()));
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    ucharImageData[i]=(uchar)input1.ptr()[i];
  }
  input_image_block_1.upload(ucharImageData);
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    ucharImageData[i]=(uchar)input2.ptr()[i];
  }
  input_image_block_2.upload(ucharImageData);
  thrust::host_window_vector<uchar> inputWindow1 (&input_image_block_1,1,1,1,1);
  thrust::host_window_vector<uchar> inputWindow2 (&input_image_block_2,1,1,1,1);
  thrust::transform(thrust::host,inputWindow1.begin(),inputWindow1.end(),inputWindow2.begin(),output_image_block.begin(),blendFunctor(0.5));
  output_image_block.download(&ucharImageData);
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    charImageData[i]=(unsigned char)ucharImageData[i];
  }
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
