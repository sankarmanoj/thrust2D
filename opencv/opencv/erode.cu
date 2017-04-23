#include <opencv2/opencv.hpp>
#include <opencv2/cudafilters.hpp>

int main ( int argc, char **argv )
{
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
    cv::Mat img_final;
    cv::Mat t,im_rgb;
    int dim = 512;
    if(argc ==2)
    {
      dim = atoi(argv[1]);
    }
    t  = cv::imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE );
    cv::resize(t,im_rgb,cv::Size(dim,dim));
    cv::cuda::GpuMat im_rgb_d, img_final_d;
    im_rgb_d.upload(im_rgb);
    cv::Ptr<cv::cuda::Filter> erode = cv::cuda::createMorphologyFilter(cv::MORPH_ERODE, im_rgb_d.type(), cv::Mat());
    erode->apply(im_rgb_d, img_final_d);
    img_final_d.download(img_final);
    #ifdef OWRITE
        cv::imwrite("erode.png",img_final);
    #endif
    #ifdef SHOW
        cv::imshow("erode.png",img_final);
          cv::waitKey(0);
    #endif

    return 0;
}
