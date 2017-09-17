#define THRUST_DEVICE_SYSTEM 2
#include <opencv2/opencv.hpp>
#include <thrust/window_2d.h>
#define PI 3.14159
#define ITER 25
#include <omp.h>
using namespace cv;
class transFunctor
{
public:
  __host__  uchar operator() (const uchar a,const uchar b) const
  {
    return (uchar) sqrt((float) a*a + b*b);
  }
};

class convolutionFunctor //:public thrust::shared_unary_window_transform_functor<uchar>
{
public:
  int dim;
  thrust::block_2d<float> * kernel;
  convolutionFunctor( thrust::block_2d<float> * kernel,int dim)
  {
    this->dim =dim;
    this->kernel = kernel;
  }
  __host__  uchar operator() (const thrust::window_2d<uchar> & input_window,const thrust::window_2d<uchar> & output_window) const
  {
    uchar temp = 0;
    for(int i = 0; i< dim; i++)
    {
      for(int j = 0; j<dim; j++)
      {
        temp+=input_window[i][j]*(*kernel)[i][j];
      }
    }
    output_window[1][1]=temp;
    return 0;
  }
};

int main(int argc, char const *argv[]) {
  Mat image;
  image = cv::imread( "car.jpg", CV_LOAD_IMAGE_GRAYSCALE );
  int dim = 512;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  cv::resize(image,image,cv::Size(dim,dim));
  thrust::host_block_2d<float> kernelx(3,3);
  thrust::host_block_2d<float> kernely(3,3);
  thrust::block_2d<float> dkernelx(3,3);
  thrust::block_2d<float> dkernely(3,3);
  //Scharr Filter
  kernelx[0][0]=-3;
  kernelx[0][1]=0;
  kernelx[0][2]=+3;
  kernelx[1][0]=-10;
  kernelx[1][1]=0;
  kernelx[1][2]=+10;
  kernelx[2][0]=-3;
  kernelx[2][1]=0;
  kernelx[2][2]=+3;
  kernely[0][0]=-3;
  kernely[0][1]=-10;
  kernely[0][2]=-3;
  kernely[1][0]=0;
  kernely[1][1]=0;
  kernely[1][2]=0;
  kernely[2][0]=+3;
  kernely[2][1]=+10;
  kernely[2][2]=+3;
  dkernelx=kernelx;
  dkernely=kernely;
  thrust::block_2d<uchar> uchar_image_block (image.cols,image.rows);
  thrust::block_2d<uchar> convolve1_block (image.cols,image.rows);
  thrust::block_2d<uchar> convolve2_block (image.cols,image.rows);
  thrust::block_2d<uchar> outBlock (image.cols,image.rows);
  thrust::block_2d<uchar> zero_image_block (image.cols,image.rows);
  uchar * img = (uchar * )malloc(sizeof(uchar)*(uchar_image_block.end()-uchar_image_block.begin()));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(uchar)image.ptr()[i];
  }
  uchar_image_block.upload(img);
  convolve1_block.upload(img);
  convolve2_block.upload(img);

  thrust::window_vector<uchar> input_wv(&uchar_image_block,3,3,1,1);
  thrust::window_vector<uchar> output_wv_x(&convolve1_block,3,3,1,1);
  thrust::window_vector<uchar> output_wv_y(&convolve2_block,3,3,1,1);

  double start, end;
  start = omp_get_wtime();
  for(int i = 0; i<ITER;i++)
  {
    thrust::transform(input_wv.begin(),input_wv.end(),output_wv_x.begin(),zero_image_block.begin(),convolutionFunctor(dkernelx.device_pointer,3));
    thrust::transform(input_wv.begin(),input_wv.end(),output_wv_y.begin(),zero_image_block.begin(),convolutionFunctor(dkernely.device_pointer,3));
    thrust::transform(convolve1_block.begin(),convolve1_block.end(),convolve2_block.begin(),outBlock.begin(),transFunctor());
  }
  end = omp_get_wtime();
  printf("%f\n",(end-start)/ITER);
  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(uchar_image_block.end()-uchar_image_block.begin()));
  outBlock.download(&img);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
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
