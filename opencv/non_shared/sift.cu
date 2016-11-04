#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;
class siftTransformFunctor
{
public:
  thrust::block_2d<float> *pyrup;
  thrust::block_2d<float> *pyrdown;

siftTransformFunctor(thrust::block_2d<float> * pyrup,thrust::block_2d<float> * pyrdown)
  {
    this->pyrup=pyrup->device_pointer;
    this->pyrdown=pyrdown->device_pointer;
  }
  __device__ float operator() (const thrust::window_2d<float> &inputWindow,const thrust::window_2d<float> &outputWindow) const
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
    if (outputWindow[y][x] < 0)
    {
      outputWindow[0][0] = 0;
    }
    return 0.0f;
  }
};

int main()
{
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image=small;
  Mat pyrup=imread("pyrup.png",CV_LOAD_IMAGE_GRAYSCALE);
  Mat pyrdown=imread("pyrdown.png",CV_LOAD_IMAGE_GRAYSCALE);
  thrust::block_2d<unsigned char > image_block (image.cols,image.rows);
  thrust::block_2d<float> float_image_block (image.cols,image.rows);
  thrust::block_2d<unsigned char > pyrup_block (pyrup.cols,pyrup.rows);
  thrust::block_2d<float> float_pyrup_block (pyrup.cols,pyrup.rows);
  thrust::block_2d<unsigned char > pyrdown_block (pyrdown.cols,pyrdown.rows);
  thrust::block_2d<float> float_pyrdown_block (pyrdown.cols,pyrdown.rows);
  thrust::block_2d<float> outBlock (image.cols,image.rows,0.0f);
  thrust::block_2d<float> null_block (image.cols,image.rows,0.0f);
  float * img = (float * )malloc(sizeof(float)*(image_block.end()-image_block.begin()));
  float * imgpu = (float * )malloc(sizeof(float)*(pyrup_block.end()-pyrup_block.begin()));
  float * imgpd = (float * )malloc(sizeof(float)*(pyrdown_block.end()-pyrdown_block.begin()));
  float * img1 = (float * )malloc(sizeof(float)*(outBlock.end()-outBlock.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  for(int i = 0; i<pyrup.cols*pyrup.rows;i++)
  {
    imgpu[i]=(float)pyrup.ptr()[i];
  }
  for(int i = 0; i<pyrdown.cols*pyrdown.rows;i++)
  {
    imgpd[i]=(float)pyrdown.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  float_pyrup_block.assign(imgpu,imgpu+pyrup.cols*pyrup.rows);
  float_pyrdown_block.assign(imgpd,imgpd+pyrdown.cols*pyrdown.rows);
  thrust::window_vector<float> inputVector(&float_image_block,3,3,1,1);
  thrust::window_vector<float> outputVector(&outBlock,3,3,1,1);
  siftTransformFunctor stf(&float_pyrup_block,&float_pyrdown_block);
  thrust::transform(inputVector.begin(),inputVector.end(),outputVector.begin(),null_block.begin(),stf);
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(outBlock.end()-outBlock.begin()));
  cudaMemcpy(img1,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(outBlock.end()-outBlock.begin()),cudaMemcpyDeviceToHost);
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
