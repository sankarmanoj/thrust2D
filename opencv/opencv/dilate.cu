#include <opencv2/opencv.hpp>
#include <opencv2/cudafilters.hpp>

int main ( int argc, char **argv )
{
  cudaDeviceProp dev_prop;
  cudaGetDeviceProperties(&dev_prop,0);
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
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start);
    cv::Ptr<cv::cuda::Filter> dilate = cv::cuda::createMorphologyFilter(cv::MORPH_DILATE, im_rgb_d.type(), cv::Mat());
    cudaEventRecord(stop);
    cudaEventSynchronize(stop);
    float time_in_ms;
    cudaEventElapsedTime(&time_in_ms,start,stop);
    printf("%f\n",time_in_ms);
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
