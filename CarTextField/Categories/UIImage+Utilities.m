//
//  UIImage+Utilities.m
//
//  Created by Johnny on 11/2/13.
//  Copyright (c) 2013 dengqiang. All rights reserved.
//

#define IS_iPhone5                  ([UIScreen mainScreen].bounds.size.height == 568 && [UIScreen mainScreen].bounds.size.width == 320)
#define IS_iPhone_6                 ([UIScreen mainScreen].bounds.size.height == 667 && [UIScreen mainScreen].bounds.size.width == 375)
#define IS_iPhone_6p                ([UIScreen mainScreen].bounds.size.height == 736 && [UIScreen mainScreen].bounds.size.width == 414)

#import "UIImage+Utilities.h"

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size cornorRadius:(CGFloat)cornorRadius
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (cornorRadius > 0) {
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius: cornorRadius];
        [color setFill];
        [roundedRectanglePath fill];
    } else {
        CGContextSetFillColorWithColor(context, [color CGColor]);
        CGContextFillRect(context, rect);
        
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (instancetype)scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)fullscrennImage:(NSString *)imgName
{
    NSString *imageName = imgName;
    NSString *ext = [imgName pathExtension];
    NSString *name = [imgName stringByDeletingPathExtension];
    
    if (IS_iPhone5) {
        imageName = [[name stringByAppendingString:@"_5@2x"] stringByAppendingPathExtension:ext];
    } else if (IS_iPhone_6) {
        imageName = [[name stringByAppendingString:@"_6@2x"] stringByAppendingPathExtension:ext];
    } else if (IS_iPhone_6p) {
        imageName = [[name stringByAppendingString:@"_6plus@3x"] stringByAppendingPathExtension:ext];
    }
    
    return [self imageNamed:imageName];
}

+ (UIImage *)imageWithImage1:(UIImage *)image1 andImage2:(UIImage *)image2 offsetX:(CGFloat)offsetX
{
    CGSize size = CGSizeMake(image1.size.width + image2.size.width - offsetX, image1.size.height);
    UIGraphicsBeginImageContext(size);
    
    [image1 drawInRect:CGRectMake(0, 0, image1.size.width, size.height)];
    [image2 drawInRect:CGRectMake(image1.size.width - offsetX, 0, image2.size.width, size.height)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)resizedImage:(NSString *)imgName
{
    return [self resizedImage:imgName xPos:0.5 yPos:0.5];
}

+ (UIImage *)resizedImage:(NSString *)imgName xPos:(CGFloat)xPos yPos:(CGFloat)yPos
{
    UIImage *image = [UIImage imageNamed:imgName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * xPos topCapHeight:image.size.height * yPos];
}

@end
