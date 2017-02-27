//
//  NSArray+Trim.m
//  TQMall
//
//  Created by Johnny on 8/5/14.
//  Copyright (c) 2014 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import "NSArray+Trim.h"

@implementation NSArray (Trim)

- (NSArray *)arrayByTrimmingCharactersInSet:(NSCharacterSet *)set
{
    NSMutableArray *array = [NSMutableArray array];
    for (id obj in self) {
        if ([obj respondsToSelector:@selector(stringByTrimmingCharactersInSet:)]) {
            [array addObject:[obj stringByTrimmingCharactersInSet:set]];
        }
        else {
            [array addObject:obj];
        }
    }
    
    return array;
}

@end
