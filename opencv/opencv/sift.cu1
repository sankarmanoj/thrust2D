#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/features2d/features2d.hpp>

int main(int argc, const char* argv[])
{
    const cv::Mat input = cv::imread("car.jpg",CV_LOAD_IMAGE_GRAYSCALE); //Load as grayscale

    cv::SIFT detector;
    std::vector<cv::KeyPoint> keypoints;
    detector(input,cv::Mat(), keypoints, keypoints);

    // Add results to image and save.
    cv::Mat output;
    cv::drawKeypoints(input, keypoints, output);
    cv::imwrite("sift_result.jpg", output);

    return 0;
}
