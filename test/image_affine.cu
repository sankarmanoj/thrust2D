#include <opencv2/opencv.hpp>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#include <math.h>
using namespace cv;

class AffineTransformFunctor : public thrust::shared_unary_window_transform_functor<float>
{
public:
  thrust::block_2d<float> *transformMatrix;
  thrust::block_2d<float> *transformMatrix;
  
  AffineTransformFunctor(thrust::block_2d<float> * tm)
  {
    this->transformMatrix = tm;
  }
  __device__ void operator() (const thrust::window_2d<float> &inputWindow,const thrust::window_2d<float> &outputWindow) const
  {

  }
};
int main(int argc, char const *argv[]) {
  Mat small = imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  Mat image;
  int dim = 17;
  image = small;
  // resize(small,image,Size(1500,1500));

  std::cout<<dim<<"  "<<image.isContinuous()<<std::endl;
  thrust::block_2d<float> float_image_block (image.cols,image.rows);
  thrust::block_2d<float> outBlock (image.cols,image.rows);
  float * img = (float * )malloc(sizeof(float)*(image.cols*image.rows));
  for(int i = 0; i<image.cols*image.rows;i++)
  {
    img[i]=(float)image.ptr()[i];
  }
  float_image_block.assign(img,img+image.cols*image.rows);


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

    dstTri[0] = Point2f( image.cols*0.0, image.rows*0.33 );
    dstTri[1] = Point2f( image.cols*0.85, image.rows*0.25 );
    dstTri[2] = Point2f( image.cols*0.15, image.rows*0.7 );

    /// Get the Affine Transform
    warp_mat = getAffineTransform( srcTri, dstTri );
    std::cout<<"Warp matrix \n"<<warp_mat;

    //Move Warp Matrix to Device
    thrust::block_2d<float> warp_block(warp_mat.cols,warp_mat.rows);
    for(int i = 0; i<warp_mat.cols*warp_mat.rows;i++)
    {
      warp_block[i/warp_block.dim_x][i%warp_block.dim_x]=(float)warp_mat.ptr()[i];
    }

  //Create Windows For Indexing
  thrust::window_vector<float> inputVector(&float_image_block,1,1,1,1);
  thrust::window_vector<float> outputVector(&outBlock,1,1,1,1);
  thrust::transform(thrust::cuda::shared,inputVector.begin(),inputVector.end(),outputVector.begin(),AffineTransformFunctor(warp_block.device_pointer));

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

  // waitKey(0);
  // std::cout<<float_image<<"\n";
  return 0;
}
