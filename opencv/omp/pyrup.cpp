#define THRUST_DEVICE_SYSTEM 2
#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
using namespace cv;
inline float gauss(int x, int y, int mid, float sigma )
{
  float temp = (pow(x-mid,2)+pow(y-mid,2))/sigma;
  temp= exp(-temp);
  return temp;
}
void getGaussianKernelBlock(int dim, float sigma,float *GaussianKernel )
{
  assert(dim%2);
  int mid = (dim-1)/2;
  float total = 0;
  for(int i = 0; i<dim;i++)
  {
    for(int j = 0; j<dim;j++)
    {
      total+=gauss(i,j,mid,sigma);
      (GaussianKernel)[i*dim + j]=gauss(i,j,mid,sigma);
    }
  }
  float newTotal=0;
  for(int i = 0; i<dim;i++)
  {
    for(int j = 0; j<dim;j++)
    {
      (GaussianKernel)[i*dim + j]/=total;
      newTotal +=  (GaussianKernel)[i*dim + j];
    }
  }
}

class convolutionFunctor //:public thrust::shared_unary_window_transform_functor<uchar>
{
public:
  int dim;
  float *hkernel;
  convolutionFunctor(int dim, float *hkernel)
  {
    this->dim = dim;
    this->hkernel = hkernel;
  }
  __host__  uchar operator() (const thrust::window_2d<uchar> & input_window,const thrust::window_2d<uchar> & output_window) const
  {
    uchar temp = 0;
    for(int i = 0; i< dim; i++)
    {
      for(int j = 0; j<dim; j++)
      {
        temp+=input_window[make_int2(j,i)] * (hkernel)[i*dim + j];
      }
    }
    output_window[1][1]=temp;
    return 0;
  }
};

class pyrupTransformFunctor
{
public:
  thrust::block_2d<uchar> *inBlock;

pyrupTransformFunctor(thrust::block_2d<uchar> * inBlock)
  {
    this->inBlock = inBlock->device_pointer;
  }
  __host__  void operator() (const thrust::window_2d<uchar> &outputWindow) const
  {
    int x_in, y_in;
    if(outputWindow.start_x%2 && outputWindow.start_y%2)
    {
      x_in = outputWindow.start_x*2;
      y_in = outputWindow.start_y*2;
      outputWindow[0][0]=(*inBlock)[y_in][x_in];
    }
  }
};

int main(int argc, char const *argv[])
{
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 5;
  int dim_image = 512;
  if(argc==2)
  {
    dim_image = atoi(argv[1]);
  }
  resize(small,image,Size(dim_image,dim_image));
  float *hkernel = (float *) std::malloc(sizeof(float)*dim*dim);
  getGaussianKernelBlock(dim,5,hkernel);
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> null_block (image.cols,image.rows);
  thrust::block_2d<uchar> outBlock (image.cols/2,image.rows/2,0.0f);
  thrust::block_2d<uchar> output_image_block(image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()));
  uchar * img1 = (uchar * )malloc(sizeof(uchar)*(outBlock.end()-outBlock.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.upload(img);
  thrust::window_vector<uchar> input_wv(&uchar_image_block,dim,dim,1,1);
  thrust::window_vector<uchar> output_wv(&output_image_block,dim,dim,1,1);
  thrust::window_vector<uchar> inputVector(&outBlock,1,1,1,1);
  pyrupTransformFunctor ptf(&output_image_block);
  double start, end;
  start = omp_get_wtime();
  thrust::for_each(inputVector.begin(),inputVector.end(),ptf);
  thrust::transform(input_wv.begin(),input_wv.end(),output_wv.begin(),null_block.begin(),convolutionFunctor(dim,hkernel));
  end = omp_get_wtime();
  printf("%f\n",(end-start));
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(outBlock.end()-outBlock.begin()));
  output_image_block.download(&img);
  for(int i = 0; i<(outBlock.end()-outBlock.begin());i++)
  {
    outputFloatImageData[i]=(unsigned char)img1[i];
  }
  Mat output (Size(image.cols/2,image.rows/2),CV_8UC1,outputFloatImageData);
  #ifdef OWRITE
  imwrite("input.png",image);
  imwrite("output.png",output);
  #endif
  #ifdef SHOW
  imshow("input.png",image);
  imshow("output.png",output);
  waitKey(0);
  #endif
  return 0;
}
