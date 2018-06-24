//
//  OpenCVWrapper.h
//  openCVTest
//
//  Created by skrr on 24.06.18.
//  Copyright © 2018 mic.st. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OpenCVWrapper : NSObject

- (UIImage *) makeGray: (UIImage *) image;
- (UIImage *) threshold:(UIImage *)image thresholdLower:(int)thresholdLower threshholdUpper:(int)threshholdUpper;
- (UIImage *) contours: (UIImage *) image;

@end
