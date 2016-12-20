#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;
int main(int argc, char const *argv[]) {
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  Mat small = imread("santiago.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim1 = 512;
  if(argc ==2)
  {
    dim1 = atoi(argv[1]);
  }
  resize(small,image,Size(dim1,dim1));
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.assign(img,img+image.cols*image.rows);
  // thrust::window_vector<float> input_wv(&float_image_block,dim,dim,1,1);
  // thrust::window_vector<float> output_wv(&output_image_block,dim,dim,1,1);
  // thrust::transform(thrust::cuda::texture,input_wv.begin(),input_wv.end(),output_wv.begin(),convolutionFunctor(kernel.device_pointer,dim));
  float kernel[3] = {1,1,1};
  thrust::convolve(thrust::cuda::texture,&uchar_image_block,kernel);

  unsigned char * outputucharImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(uchar_image_block.data()),sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputucharImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputucharImageData);
  // cudaCheckError();
  imshow("input.png",image);
  imshow("output.png",output);

  return 0;
}
