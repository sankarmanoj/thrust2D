#include <opencv2/opencv.hpp>
#include <opencv2/cudafilters.hpp>

int main ( int argc, char **argv )
{
    cv::Mat img_final;
    cv::Mat im_rgb;
    int dim = 512;
    if(argc ==2)
    {
      dim = atoi(argv[1]);
    }

    cv::Mat im_rgb_t  = cv::imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE );
    cv::resize(im_rgb_t,im_rgb,cv::Size(dim,2*dim));
    cv::cuda::GpuMat im_rgb_d, img_final_d;
    im_rgb_d.upload(im_rgb);
    cv::Ptr<cv::cuda::Filter> gaussian = cv::cuda::createGaussianFilter(im_rgb_d.type(),img_final_d.type(), cv::Size(5,5), 0.8);
    gaussian->apply(im_rgb_d, img_final_d);
    img_final_d.download(img_final);
    #ifdef OWRITE
        cv::imwrite("gaussian.png",img_final);
    #endif
    #ifdef SHOW
        cv::imshow("gaussian.png",img_final);
          cv::waitKey(0);
    #endif
    return 0;
}
