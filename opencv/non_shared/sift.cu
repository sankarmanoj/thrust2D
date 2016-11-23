#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;
class siftTransformFunctor
{
public:
  thrust::block_2d<uchar> *pyrup;
  thrust::block_2d<uchar> *pyrdown;

siftTransformFunctor(thrust::block_2d<uchar> * pyrup,thrust::block_2d<uchar> * pyrdown)
  {
    this->pyrup=pyrup->device_pointer;
    this->pyrdown=pyrdown->device_pointer;
  }
  __device__ uchar operator() (const thrust::window_2d<uchar> &inputWindow,const thrust::window_2d<uchar> &outputWindow) const
  {
    int x = inputWindow.window_dim_x/2;
    int y = inputWindow.window_dim_y/2;
    int pu_x = (inputWindow.start_x + x)/2;
    int pu_y = (inputWindow.start_y + y)/2;
    int pd_x = (inputWindow.start_x + x)*2;
    int pd_y = (inputWindow.start_y + y)*2;
    outputWindow[y][x]=0.0;
    for (int i = 0; i < inputWindow.window_dim_y; i++)
    {
      for (int j = 0; j < inputWindow.window_dim_x; j++)
      {
        outputWindow[y][x]=outputWindow[y][x] + inputWindow[y][x]-inputWindow[i][j];
        outputWindow[y][x]=outputWindow[y][x] + inputWindow[y][x]-(*pyrup)[pu_y][pu_x];
        outputWindow[y][x]=outputWindow[y][x] + inputWindow[y][x]-(*pyrdown)[pd_y][pd_x];
      }
    }
    outputWindow[y][x] = outputWindow[y][x] * 0.05;
    return 0;
  }
};

int main()
{
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image=small;
  Mat pyrup=imread("pyrup.png",CV_LOAD_IMAGE_GRAYSCALE);
  Mat pyrdown=imread("pyrdown.png",CV_LOAD_IMAGE_GRAYSCALE);
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::block_2d<unsigned char > pyrup_block (pyrup.cols,pyrup.rows);
  thrust::block_2d<uchar> uchar_pyrup_block (pyrup.cols,pyrup.rows);
  thrust::block_2d<unsigned char > pyrdown_block (pyrdown.cols,pyrdown.rows);
  thrust::block_2d<uchar> uchar_pyrdown_block (pyrdown.cols,pyrdown.rows);
  thrust::block_2d<uchar> outBlock (image.cols,image.rows,0.0f);
  thrust::block_2d<uchar> null_block (image.cols,image.rows,0.0f);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(image_block.end()-image_block.begin()));
  uchar * imgpu = (uchar * )malloc(sizeof(uchar)*(pyrup_block.end()-pyrup_block.begin()));
  uchar * imgpd = (uchar * )malloc(sizeof(uchar)*(pyrdown_block.end()-pyrdown_block.begin()));
  uchar * img1 = (uchar * )malloc(sizeof(uchar)*(outBlock.end()-outBlock.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  for(int i = 0; i<pyrup.cols*pyrup.rows;i++)
  {
    imgpu[i]=(uchar)pyrup.ptr()[i];
  }
  for(int i = 0; i<pyrdown.cols*pyrdown.rows;i++)
  {
    imgpd[i]=(uchar)pyrdown.ptr()[i];
  }
  uchar_image_block.assign(img,img+image.cols*image.rows);
  uchar_pyrup_block.assign(imgpu,imgpu+pyrup.cols*pyrup.rows);
  uchar_pyrdown_block.assign(imgpd,imgpd+pyrdown.cols*pyrdown.rows);
  thrust::window_vector<uchar> inputVector(&uchar_image_block,3,3,1,1);
  thrust::window_vector<uchar> outputVector(&outBlock,3,3,1,1);
  siftTransformFunctor stf(&uchar_pyrup_block,&uchar_pyrdown_block);
  thrust::transform(inputVector.begin(),inputVector.end(),outputVector.begin(),null_block.begin(),stf);
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(outBlock.end()-outBlock.begin()));
  cudaMemcpy(img1,thrust::raw_pointer_cast(outBlock.data()),sizeof(uchar)*(outBlock.end()-outBlock.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<(outBlock.end()-outBlock.begin());i++)
  {
    outputFloatImageData[i]=(unsigned char)img1[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("sift.png",output);
  free (img);
  free (img1);
  free (outputFloatImageData);
  return 0;
}
