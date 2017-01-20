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
    cv::resize(im_rgb_t,im_rgb,cv::Size(dim,dim));
    cv::cuda::GpuMat im_rgb_d, img_final_d;
    im_rgb_d.upload(im_rgb);
    cv::Ptr<cv::cuda::Filter> dilate = cv::cuda::createMorphologyFilter(cv::MORPH_DILATE, im_rgb_d.type(), cv::Mat());
    dilate->apply(im_rgb_d, img_final_d);
    img_final_d.download(img_final);
    #ifdef OWRITE
      cv::imwrite("dilate.png",img_final);
    #endif
    #ifdef SHOW
      cv::imshow("dilate.png",img_final);
        cv::waitKey(0);
    #endif

    return 0;
}
