//
//  OpenCVWrapper.m
//  openCVTest
//
//  Created by skrr on 24.06.18.
//  Copyright © 2018 mic.st. All rights reserved.
//
#import <opencv2/opencv.hpp>
#import "OpenCVWrapper.h"

// import necessary headers
#import <opencv2/core.hpp>
#import <opencv2/highgui/ios.h>
#import <opencv2/imgproc/imgproc.hpp>


using namespace cv;
using namespace std;

@implementation OpenCVWrapper


- (UIImage *) makeGray: (UIImage *) image {
  // Convert UIImage to cv::Mat
  Mat inputImage;
  UIImageToMat(image, inputImage);
  // If input image has only one channel, then return image.
  if (inputImage.channels() == 1) return image;
  // Convert the default OpenCV's BGR format to GrayScale.
  Mat gray;
  cvtColor(inputImage, gray, CV_BGR2GRAY);
  // Convert the GrayScale OpenCV Mat to UIImage and return it.
  return MatToUIImage(gray);
}

- (UIImage *) threshold:(UIImage *)image thresholdLower:(int)thresholdLower threshholdUpper:(int)threshholdUpper {
  
  //Do whatever with the viewcontroller object
  // Convert UIImage to cv::Mat
  
  Mat inputImage;
  UIImageToMat(image, inputImage);
  
  Mat resultImage;
  Canny(inputImage, resultImage, thresholdLower, threshholdUpper);
  return MatToUIImage(resultImage);
}

- (UIImage *) contours: (UIImage *) image {
  int const max_BINARY_value = 2147483647;
  cv::Mat src_gray;
  UIImageToMat(image, src_gray);
  
  cv::Mat dst;
  dst=src_gray;
  cv::cvtColor(src_gray, dst, cv::COLOR_RGB2GRAY);
  cv::Mat canny_output;
  std::vector<std::vector<cv::Point> > contours;
  std::vector<cv::Vec4i> hierarchy;
  
  cv::RNG rng(12345);
  
  cv::threshold( dst, dst, 0, max_BINARY_value,cv::THRESH_OTSU );
  
  cv::Mat contourOutput = dst.clone();
  cv::findContours( contourOutput, contours, cv::RETR_LIST, cv::CHAIN_APPROX_NONE );
  
  //Draw the contours
  cv::Mat contourImage(dst.size(), CV_8UC3, cv::Scalar(0,0,0));
  cv::Scalar colors[3];
  colors[0] = cv::Scalar(255, 0, 0);
  colors[1] = cv::Scalar(0, 255, 0);
  colors[2] = cv::Scalar(0, 0, 255);
  for (size_t idx = 0; idx < contours.size(); idx++) {
    cv::drawContours(contourImage, contours, idx, colors[idx % 3]);
  }
  

  return MatToUIImage(contourImage);
}



@end
