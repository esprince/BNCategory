//
//  NSString+BNAdd.m
//  Fundation
//
//  Created by xiaos on 16/6/21.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import "NSString+BNAdd.h"
#import "NSArray+BNAdd.h"


@implementation NSString (BNAdd)
- (NSString *(^)(NSString *))append {
    return ^NSString *(NSString *str) {
        return [self stringByAppendingString:str];
    };
}

- (NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

- (NSArray *)explode:(NSString *)str {
    return [self componentsSeparatedByString:str];
}

- (NSString *)replace:(NSString *)str to:(NSString *)toStr{
    return [[self explode:str] implode:toStr];
}

@end
