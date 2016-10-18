#include <opencv2/opencv.hpp>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#include <math.h>
using namespace cv;
// #define AFFINE

#define PI 3.14159
using namespace cv;
inline float gauss(int x, int y, int mid, float sigma )
{
  float temp = (pow(x-mid,2)+pow(y-mid,2))/sigma;
  temp= exp(-temp);
  return temp;
}
#define HARRIS
class AffineTransformFunctor : public thrust::shared_window_for_each_functor<float>
{
public:
  thrust::block_2d<float> *transformMatrix;
  thrust::block_2d<float> *outBlock;

  AffineTransformFunctor(thrust::block_2d<float> * tm,thrust::block_2d<float> * outBlock)
  {
    this->transformMatrix = tm->device_pointer;
    this->outBlock = outBlock->device_pointer;
  }
  __device__ void operator() (const thrust::window_2d<float> &inputWindow) const
  {
    int x_out, y_out;
    x_out = (int)((*transformMatrix)[0][0]*inputWindow.start_x+(*transformMatrix)[0][1]*inputWindow.start_y+(*transformMatrix)[0][2]*1);
    y_out = (int)((*transformMatrix)[1][0]*inputWindow.start_x+(*transformMatrix)[1][1]*inputWindow.start_y+(*transformMatrix)[1][2]*1);

    (*outBlock)[y_out][x_out]=inputWindow[0][0];
  }
};
void getGaussianKernelBlock(int dim, float sigma,thrust::block_2d<float> &GaussianKernel )
{
  assert(dim%2);
  float inverseSigmaSquare;
  inverseSigmaSquare = 1/pow(sigma,2);
  float pi2SigSquare;
  pi2SigSquare = inverseSigmaSquare*2*PI;
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

  float newTotal=0;
  for(int i = 0; i<dim;i++)
  {
    for(int j = 0; j<dim;j++)
    {
      (GaussianKernel)[i][j]/=total;
      newTotal +=  (GaussianKernel)[i][j];
    }
  }
  printf("Total = %f,newTotal=%f\n",total,newTotal);
}
class HarrisIntensityFunctor : public thrust::shared_unary_window_transform_functor<float>
{

public:
  thrust::block_2d<float> * kernel;
  HarrisIntensityFunctor(thrust::block_2d<float> * kernel)
  {
    this->kernel = kernel;
  }
  __device__ void operator() (const thrust::window_2d<float> &inputWindow,const thrust::window_2d<float> &outputWindow) const
  {
    float intensityValue;

    for(int xoffset = 1 ; xoffset <=1 ; xoffset++)
    {
      for(int yoffset = 1 ; yoffset <=1 ; yoffset++)
      {
        for(int i = 0; i< 3; i++)
        {
          for(int j = 0; j< 3; j++)
          {
              intensityValue += ((*kernel)[i][j])*(inputWindow[i + yoffset][j + xoffset]-inputWindow[i][j]);
          }
        }
      }
    }
    outputWindow[2][2]=intensityValue*0.08;
  }
};

int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  image = small;
  // resize(small,image,Size(50,50));

  std::cout<<image.isContinuous()<<image.type()<<std::endl;
  thrust::block_2d<float> float_image_block (image.cols,image.rows);
  thrust::fill(float_image_block.begin(),float_image_block.end(),0.0f);
  thrust::block_2d<float> outBlock (image.cols,image.rows);
  thrust::fill(outBlock.begin(),outBlock.end(),0.0f);
  float * img = (float * )malloc(sizeof(float)*(image.cols*image.rows));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);
  #ifdef AFFINE

    Point2f srcTri[3];
    Point2f dstTri[3];

    Mat rot_mat( 2, 3, CV_32FC1 );
    Mat warp_mat( 2, 3, CV_32FC1 );
    Mat warp_dst;
    /// Set the dst image the same type and size as src
    warp_dst = Mat::zeros( image.rows, image.cols, image.type() );

    /// Set your 3 points to calculate the  Affine Transform
    srcTri[0] = Point2f( 0,0 );
    srcTri[1] = Point2f( image.cols - 1, 0 );
    srcTri[2] = Point2f( 0, image.rows - 1 );

    dstTri[0] = Point2f( image.cols*0.0, image.rows*0.5 );
    dstTri[1] = Point2f( image.cols*0.8, image.rows*0.2 );
    dstTri[2] = Point2f( image.cols*0.2, image.rows*0.7 );

    /// Get the Affine Transform
    warp_mat = getAffineTransform( srcTri, dstTri );
    warp_mat.convertTo(warp_mat,CV_32FC1);
    std::cout<<warp_mat.isContinuous()<<"Warp matrix \n"<<warp_mat;

    //Move Warp Matrix to Device
    thrust::block_2d<float> warp_block(warp_mat.cols,warp_mat.rows);

    printf("\n");
    for(int i = 0; i< warp_mat.rows;i++)
    {
      for(int j = 0; j<warp_mat.cols;j++)
      {
        warp_block[i][j]=warp_mat.at<float>(i,j);
      }
    }
    printf("Device Transformation Matrix\n");
    for(int i = 0; i< warp_mat.rows;i++)
    {
      for(int j = 0; j<warp_mat.cols;j++)
      {
        printf(" %f ",(float)warp_block[i][j]);
      }
      printf("\n");
    }
  //Create Windows For Indexing
  thrust::window_vector<float> inputVector(&float_image_block,1,1,1,1);
  AffineTransformFunctor atf(&warp_block,&outBlock);
  thrust::for_each(inputVector.begin(),inputVector.end(),atf);
  cudaDeviceSynchronize();

    unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
    cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
    for(int i = 0; i<image.cols*image.rows;i++)
    {
      outputFloatImageData[i]=(unsigned char)img[i];
    }
    Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
    // std::cout<<output;
    // cudaCheckError();
    // std::cout<<output.type()<<"  "<<Size(image.cols,image.rows)<<"="<<image_block.end()-image_block.begin()<<"\n";
    imwrite("ainput.png",image);
    // imshow("output",output);
    imwrite("aoutput.png",output);
  #endif

  #ifdef SOBELDERIV
  thrust::block_2d<float> XDeriv (image.cols,image.rows);
  thrust::block_2d<float> YDeriv (image.cols,image.rows);
  thrust::copy(float_image_block.begin(),float_image_block.end(),XDeriv.begin());
  thrust::copy(float_image_block.begin(),float_image_block.end(),YDeriv.begin());
  thrust::block_2d<float> SobelXKernel (3,3,0);
  thrust::block_2d<float> SobelYKernel (3,3,0);
  SobelXKernel[0][0]= -1;
  SobelXKernel[0][1]= -2;
  SobelXKernel[0][2]= -1;
  SobelXKernel[2][0]= 1;
  SobelXKernel[2][1]= 2;
  SobelXKernel[2][2]= 1;
  SobelYKernel[0][0]= -1;
  SobelYKernel[1][0]= -2;
  SobelYKernel[2][0]= -1;
  SobelYKernel[0][2]= 1;
  SobelYKernel[1][2]= 2;
  SobelYKernel[2][2]= 1;
  thrust::convolve(XDeriv.begin(),XDeriv.end(),SobelXKernel.begin());
  thrust::convolve(YDeriv.begin(),YDeriv.end(),SobelYKernel.begin());

  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(XDeriv.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat xout (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  imwrite("harris_input.png",image);
  imwrite("xout.png",xout);
  cudaMemcpy(img,thrust::raw_pointer_cast(YDeriv.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat yout (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  imwrite("yout.png",yout);
  #endif

  #ifdef HARRIS
  thrust::block_2d<float> kernel(3,3);
  getGaussianKernelBlock(3,5,kernel);
  thrust::window_vector<float> inputVector = thrust::window_vector<float>(&float_image_block,5,5,1,1);
  thrust::window_vector<float> outputVector = thrust::window_vector<float>(&outBlock,5,5,1,1);
  thrust::transform(thrust::cuda::shared,inputVector.begin(),inputVector.end(),outputVector.begin(),HarrisIntensityFunctor(kernel.device_pointer));

  unsigned char * outputFloatImageData = (unsigned char *)malloc(sizeof(unsigned char)*(float_image_block.end()-float_image_block.begin()));
  cudaMemcpy(img,thrust::raw_pointer_cast(outBlock.data()),sizeof(float)*(float_image_block.end()-float_image_block.begin()),cudaMemcpyDeviceToHost);
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    outputFloatImageData[i]=(unsigned char)img[i];
  }
  Mat output (Size(image.cols,image.rows),CV_8UC1,outputFloatImageData);
  // std::cout<<output;
  // cudaCheckError();
  // std::cout<<output.type()<<"  "<<Size(image.cols,image.rows)<<"="<<image_block.end()-image_block.begin()<<"\n";
  imshow("ainput.png",image);
  // imshow("output",output);
  imshow("aoutput.png",output);
  // waitKey(0);
  #endif
  // waitKey(0);
  // std::cout<<float_image<<"\n";
  return 0;
}
