//
//  NSString+JSONObject.m
//  SalesTool
//
//  Created by Johnny on 4/29/14.
//  Copyright (c) 2014 Johnny. All rights reserved.
//

#import "NSString+JSONObject.h"

@implementation NSString (JSONObject)

- (NSDictionary *)JSONObject
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
