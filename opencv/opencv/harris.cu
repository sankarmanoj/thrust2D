#include <opencv2/opencv.hpp>
#include <opencv2/cudaimgproc.hpp>

int thresh = 200;

int main( )
{
    cv::Mat src, gray;
    // Load source image and convert it to gray
    src = cv::imread( "car.jpg", 1 );

    cv::cvtColor( src, gray, CV_BGR2GRAY );
    cv::cuda::GpuMat src_d;
    src_d.upload(gray);
    cv::Mat dst, dst_norm, dst_norm_scaled;
    dst = cv::Mat::zeros( src.size(), CV_32FC1 );
    cv::cuda::GpuMat dst_d;
    dst_d.upload(dst);
    // Detecting corners
    cv::Ptr<cv::cuda::CornernessCriteria> harris = cv::cuda::createHarrisCorner(src_d.type(), 7, 5, 0.05, cv::BORDER_DEFAULT);
    harris->compute(src_d, dst_d);
    dst_d.download(dst);
    // Normalizing
    cv::normalize( dst, dst_norm, 0, 255, cv::NORM_MINMAX, CV_32FC1, cv::Mat() );
    cv::convertScaleAbs( dst_norm, dst_norm_scaled );

    // Drawing a circle around corners
    for( int j = 0; j < dst_norm.rows ; j++ )
    {
      for( int i = 0; i < dst_norm.cols; i++ )
      {
        if( (int) dst_norm.at<float>(j,i) > thresh )
        {
           cv::circle( dst_norm_scaled, cv::Point( i, j ), 5,  cv::Scalar(0), 2, 8, 0 );
        }
      }
    }

    cv::imwrite( "harris.png", dst_norm_scaled );

    return(0);
}
