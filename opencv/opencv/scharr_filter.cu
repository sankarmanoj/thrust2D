#include <opencv2/opencv.hpp>
#include <opencv2/cudafilters.hpp>
#include <opencv2/cudaarithm.hpp>
int main()
{
  cv::Mat image = cv::imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE);
  cv::cuda::GpuMat image_d, grad_x_d,grad_y_d,grad_d;
  cv::imwrite("input.png", image);//displaying image
  image_d.upload(image);
  /// Generate grad_x and grad_y
  cv::Mat grad_x, grad_y,grad;
  cv::Mat abs_grad_x, abs_grad_y;

  /// Gradient X
  cv::Ptr<cv::cuda::Filter> scharr_x = cv::cuda::createScharrFilter(image_d.type(),grad_x_d.type(),1,0);
  scharr_x->apply(image_d, grad_x_d);
  grad_x_d.download(grad_x);
  cv::convertScaleAbs( grad_x, abs_grad_x );

  /// Gradient Y
  cv::Ptr<cv::cuda::Filter> scharr_y = cv::cuda::createScharrFilter(image_d.type(),grad_y_d.type(),0,1);
  scharr_y->apply(image_d, grad_y_d);
  grad_y_d.download(grad_y);
  cv::convertScaleAbs(grad_y,abs_grad_y);

  /// Total Gradient (approximate)
  cv::addWeighted(abs_grad_x, 0.5, abs_grad_y, 0.5, 0, grad);
  cv::imwrite("scharr.png",grad);//displaying image1

}
