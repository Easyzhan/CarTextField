//
//  NSObject+Additions.h
//  TQMall
//
//  Created by Johnny on 5/21/14.
//  Copyright (c) 2014 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject (Additions)

- (NSInteger)toInt;
- (NSUInteger)toUInt;
- (NSString *)toString;
- (CGFloat)toFloat;
- (double)toDouble;
- (BOOL)toBool;

- (NSArray *)toArray;
- (NSDictionary *)toDictionary;

- (NSString *)JSONString;

@end
