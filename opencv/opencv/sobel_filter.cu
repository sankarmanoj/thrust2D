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
  cv::Ptr<cv::cuda::Filter> sobel_x = cv::cuda::createSobelFilter(image_d.type(),grad_x_d.type(),1,0);
  sobel_x->apply(image_d, grad_x_d);
  grad_x_d.download(grad_x);
  cv::convertScaleAbs( grad_x, abs_grad_x );

  /// Gradient Y
  cv::Ptr<cv::cuda::Filter> sobel_y = cv::cuda::createSobelFilter(image_d.type(),grad_y_d.type(),0,1);
  sobel_y->apply(image_d, grad_y_d);
  grad_y_d.download(grad_y);
  cv::convertScaleAbs(grad_y,abs_grad_y);

  /// Total Gradient (approximate)
  cv::addWeighted(abs_grad_x, 0.5, abs_grad_y, 0.5, 0, grad);
  cv::imwrite("sobel.png",grad);//displaying image1

}
