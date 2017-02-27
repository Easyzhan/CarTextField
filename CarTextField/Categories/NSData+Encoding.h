//
//  NSData+Encoding.h
//
//  Created by Johnny on 11/4/13.
//  Copyright (c) 2013 dengqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Encoding)

+ (NSData *)dataWithBase64EncodedString:(NSString *)string;
- (NSString *)Base64EncodedString;

@end
