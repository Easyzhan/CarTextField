//
//  NSError+Chinese.m
//  TQMall
//
//  Created by Johnny on 6/9/14.
//  Copyright (c) 2014 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import "NSError+Chinese.h"

@implementation NSError (Chinese)

- (NSString *)chineseDescription
{
    NSString *description;
    
    switch (self.code) {
        case NSURLErrorTimedOut:
            description = @"网络连接超时";
            break;
            
        case NSURLErrorCannotFindHost:
        case NSURLErrorCannotConnectToHost:
        case NSURLErrorNetworkConnectionLost:
        case NSURLErrorDNSLookupFailed:
            description = @"连接服务器失败";
            break;
            
        case NSURLErrorNotConnectedToInternet:
            description = @"网络连接中断";
            break;
            
        case NSURLErrorUnknown:
        case NSURLErrorBadServerResponse:
        case NSURLErrorCannotDecodeRawData:
        case NSURLErrorCannotDecodeContentData:
        case NSURLErrorCannotParseResponse:
            
        default:
            description = @"服务器繁忙，请稍候再试";
            break;
    }
    
    return description;
}

@end
