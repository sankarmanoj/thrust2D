#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;
class blendFunctor
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
  __device__ void operator() (const thrust::window_2d<float> &outputWindow) const
  {
    outputWindow[0][0] = alpha*tex2D<float>(t1,outputWindow.start_x,outputWindow.start_y)+(1-alpha)*tex2D<float>(t2,outputWindow.start_x,outputWindow.start_y);
  }
};

int main(int argc, char const *argv[]) {
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  Mat temp1 = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat temp2 = imread("aoutput.png",CV_LOAD_IMAGE_GRAYSCALE);
  Mat input1,input2;
  resize(temp1,input1,Size(512,512));
  resize(temp2,input2,Size(512,512));


  thrust::block_2d<float> output_image_block (input1.cols,input1.rows,0.0f);
  float * floatImageData = (float * )malloc(sizeof(float)*(input1.cols*input1.rows));
  unsigned char * charImageData = (unsigned char *)malloc(sizeof(unsigned char)*(input1.cols*input1.rows));
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    floatImageData[i]=(float)input1.ptr()[i];
  }
  cudaTextureDesc texDesc;
  memset(&texDesc, 0, sizeof(texDesc));
  size_t pitch;
  float * aligned_device_memory1;
  cudaMallocPitch(&aligned_device_memory1,&pitch,input1.cols*sizeof(float),input1.rows);
  cudaMemcpy2D(aligned_device_memory1,pitch,floatImageData,input1.cols*sizeof(float),input1.cols*sizeof(float),input1.rows,cudaMemcpyHostToDevice);

  //Create Resource Descriptor
  cudaResourceDesc resDesc1;
  memset(&resDesc1, 0, sizeof(resDesc1));
  resDesc1.resType = cudaResourceTypePitch2D;
  resDesc1.res.pitch2D.desc = cudaCreateChannelDesc<float>();
  resDesc1.res.pitch2D.pitchInBytes=pitch;
  resDesc1.res.pitch2D.height = input1.rows;
  resDesc1.res.pitch2D.width=input1.cols;
  resDesc1.res.pitch2D.devPtr = aligned_device_memory1;

  //floatexture Object Creation
  cudaTextureObject_t texref1;
  cudaCreateTextureObject(&texref1, &resDesc1, &texDesc, NULL);
  for(int i = 0; i<input1.cols*input1.rows;i++)
  {
    floatImageData[i]=(float)input2.ptr()[i];
  }
  cudaMallocPitch(&aligned_device_memory1,&pitch,input1.cols*sizeof(float),input1.rows);
  cudaMemcpy2D(aligned_device_memory1,pitch,floatImageData,input1.cols*sizeof(float),input1.cols*sizeof(float),input1.rows,cudaMemcpyHostToDevice);

  //Create Resource Descriptor
  cudaResourceDesc resDesc2;
  memset(&resDesc2, 0, sizeof(resDesc2));
  resDesc2.resType = cudaResourceTypePitch2D;
  resDesc2.res.pitch2D.desc = cudaCreateChannelDesc<float>();
  resDesc2.res.pitch2D.pitchInBytes=pitch;
  resDesc2.res.pitch2D.height = input1.rows;
  resDesc2.res.pitch2D.width=input1.cols;
  resDesc2.res.pitch2D.devPtr = aligned_device_memory1;

  //floatexture Object Creation
  cudaTextureObject_t texref2;
  cudaCreateTextureObject(&texref2, &resDesc2, &texDesc, NULL);

  thrust::window_vector<float> outputWindow (&output_image_block,1,1,1,1);
  thrust::for_each(outputWindow.begin(),outputWindow.end(),blendFunctor(0.5,texref1,texref2));
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
