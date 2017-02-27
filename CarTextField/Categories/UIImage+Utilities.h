//
//  UIImage+Utilities.h
//
//  Created by Johnny on 11/2/13.
//  Copyright (c) 2013 dengqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utilities)

+ (UIImage *)fullscrennImage:(NSString *)imgName;
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size cornorRadius:(CGFloat)cornorRadius;
+ (UIImage *)imageWithImage1:(UIImage *)image1 andImage2:(UIImage *)image2 offsetX:(CGFloat)offsetX;

- (instancetype)scaleToSize:(CGSize)size;
+ (UIImage *)resizedImage:(NSString *)imgName;
+ (UIImage *)resizedImage:(NSString *)imgName xPos:(CGFloat)xPos yPos:(CGFloat)yPos;

@end
