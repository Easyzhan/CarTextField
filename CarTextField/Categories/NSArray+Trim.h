//
//  NSArray+Trim.h
//  TQMall
//
//  Created by Johnny on 8/5/14.
//  Copyright (c) 2014 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Trim)

- (NSArray *)arrayByTrimmingCharactersInSet:(NSCharacterSet *)set;

@end
