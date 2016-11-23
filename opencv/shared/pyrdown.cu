#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
using namespace cv;

inline float gauss(int x, int y, int mid, float sigma )
{
  float temp = (pow(x-mid,2)+pow(y-mid,2))/sigma;
  temp= exp(-temp);
  return temp;
}
void getGaussianKernelBlock(int dim, float sigma,thrust::block_2d<float> &GaussianKernel )
{
  assert(dim%2);
  int mid = (dim-1)/2;
  float total = 0;
  for(int i = 0; i<dim;i++)
  {
    for(int j = 0; j<dim;j++)
    {
      total+=gauss(i,j,mid,sigma);
      (GaussianKernel)[i][j]=gauss(i,j,mid,sigma);
    }
  }
  float newfloatotal=0;
  for(int i = 0; i<dim;i++)
  {
    for(int j = 0; j<dim;j++)
    {
      (GaussianKernel)[i][j]/=total;
      newfloatotal +=  (GaussianKernel)[i][j];
    }
  }
}

// class pyrupfloatransformFunctor
// {
// public:
//   thrust::block_2d<float> *inBlock;
//
// pyrupfloatransformFunctor(thrust::block_2d<float> * inBlock)
//   {
//     this->inBlock = inBlock->device_pointer;
//   }
//   __device__ void operator() (const thrust::window_2d<float> &outputWindow) const
//   {
//     int x_in, y_in;
//     if(outputWindow.start_x%2 && outputWindow.start_y%2)
//     {
//       x_in = outputWindow.start_x*2;
//       y_in = outputWindow.start_y*2;
//       outputWindow[0][0]=(*inBlock)[y_in][x_in];
//     }
//   }
// };

class convolutionFunctor //:public thrust::shared_unary_window_transform_functor<float>
{
public:
  cudaTextureObject_t texref;
  convolutionFunctor(   cudaTextureObject_t texref)
  {
    this->texref = texref;
  }
  __device__ void operator() (const thrust::window_2d<float> & input_window) const
  {
    input_window[0][0]=0.4*tex2D<float>(texref,input_window.start_x*2,input_window.start_y*2) + \
    0.15*tex2D<float>(texref,input_window.start_x*2+1,input_window.start_y*2) +\
    0.15*tex2D<float>(texref,input_window.start_x*2-1,input_window.start_y*2) +\
    0.15*tex2D<float>(texref,input_window.start_x*2,input_window.start_y*2+1)+\
    0.15*tex2D<float>(texref,input_window.start_x*2,input_window.start_y*2-1);
  }
};

int main(int argc, char const *argv[])
{
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
  int dim = 3;
  thrust::block_2d<float> kernel(dim,dim);
  getGaussianKernelBlock(dim,1.0,kernel);
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim1 = 512;
  if(argc ==2)
  {
    dim1 = atoi(argv[1]);
  }
  resize(small,image,Size(dim1,dim1));
  thrust::block_2d<float> outBlock (image.cols/2,image.rows/2,0.0f);
  thrust::window_vector<float> output_wv(&outBlock,1,1,1,1);
  float * img = (float * )malloc(sizeof(float)*(image.cols*image.rows));
  float * img1 = (float * )malloc(sizeof(float)*(outBlock.end()-outBlock.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float * aligned_device_memory;
  size_t pitch;
  cudaMallocPitch(&aligned_device_memory,&pitch,image.cols*sizeof(float),image.rows);
  cudaMemcpy2D(aligned_device_memory,pitch,img,image.cols*sizeof(float),image.cols*sizeof(float),image.rows,cudaMemcpyHostToDevice);

  //Create Resource Descriptor
  cudaResourceDesc resDesc;
  memset(&resDesc, 0, sizeof(resDesc));
  resDesc.resType = cudaResourceTypePitch2D;
  resDesc.res.pitch2D.desc = cudaCreateChannelDesc<float>();
  resDesc.res.pitch2D.pitchInBytes=pitch;
  resDesc.res.pitch2D.height = image.rows;
  resDesc.res.pitch2D.width=image.cols;
  resDesc.res.pitch2D.devPtr = aligned_device_memory;
  //Create floatexture Descriptor
  cudaTextureDesc texDesc;
  memset(&texDesc, 0, sizeof(texDesc));
  //floatexture Object Creation
  cudaTextureObject_t texref;
  cudaCreateTextureObject(&texref, &resDesc, &texDesc, NULL);

  thrust::for_each(thrust::cuda::shared,output_wv.begin(),output_wv.end(),convolutionFunctor(texref));
  // thrust::window_vector<float> inputVector(&outBlock,1,1,1,1);
  // pyrupfloatransformFunctor ptf(&output_image_block);
  // thrust::for_each(thrust::cuda::shared,inputVector.begin(),inputVector.end(),ptf);
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(outBlock.end()-outBlock.begin()));
  cudaMemcpy(img1,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(outBlock.end()-outBlock.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<(outBlock.end()-outBlock.begin());i++)
  {
    outputFloatImageData[i]=(unsigned char)img1[i];
  }
  Mat output (Size(image.cols/2,image.rows/2),CV_8UC1,outputFloatImageData);
  imwrite("input.png",image);
  imwrite("pyrdown.png",output);
  free (img);
  free (img1);
  free (outputFloatImageData);
  return 0;
}
