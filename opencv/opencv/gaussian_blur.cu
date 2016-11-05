#include <opencv2/opencv.hpp>
#include <opencv2/cudafilters.hpp>

int main ( int argc, char **argv )
{
    cv::Mat img_final;
    cv::Mat im_rgb  = cv::imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE );
    cv::cuda::GpuMat im_rgb_d, img_final_d;
    im_rgb_d.upload(im_rgb);
    cv::Ptr<cv::cuda::Filter> gaussian = cv::cuda::createGaussianFilter(im_rgb_d.type(),img_final_d.type(), cv::Size(17,17), 0.8);
    gaussian->apply(im_rgb_d, img_final_d);
    img_final_d.download(img_final);
    cv::imwrite("gaussian.png",img_final);
    return 0;
}
