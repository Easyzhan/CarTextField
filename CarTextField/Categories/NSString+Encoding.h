//
//  NSString+Encoding.h
//
//  Created by Johnny on 11/4/13.
//  Copyright (c) 2013 dengqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encoding)

- (NSString *)URLEncode;
- (NSString *)URLDecode;
- (NSString *)Base64Encode;
- (NSString *)MD5Encode;
- (NSString *)SHA1Encode;
- (NSString *)encryptUseDES:(NSString *)key;
- (NSString *)decryptUserDES:(NSString *)key;
- (NSString *)encryptUseDES:(NSString *)key iv:(NSString *)iv;
- (NSString *)decryptUseDES:(NSString *)key iv:(NSString *)iv;

@end
