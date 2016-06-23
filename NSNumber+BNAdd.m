//
//  NSNumber+BNAdd.m
//  Promise
//
//  Created by xiaos on 16/6/20.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import "NSNumber+BNAdd.h"
#import "NSString+BNAdd.h"

@implementation NSNumber (BNAdd)

- (void)times:(void (^)(void))block {
    for (NSInteger i = 0; i < self.unsignedIntegerValue; i++) {
        block();
    }
}

- (void)timesWithIndex:(void (^)(NSInteger))block {
    for (NSInteger i = 0 ; i < self.unsignedIntegerValue; i++) {
        block(i);
    }
}

- (void)upTo:(NSInteger)up do:(void (^)(NSInteger))block {
    if (self.integerValue > up) {
        return;
    }
    
    for (NSInteger i = self.integerValue; i <= up; i++) {
        block(i);
    }
}

- (void)downTo:(NSInteger)down do:(void (^)(NSInteger))block {
    if (self.integerValue < down) {
        return;
    }
    
    for (NSInteger i = self.integerValue; i >= down; i--) {
        block(i);
    }
}

+ (NSNumber *)numberWithString:(NSString *)string {
    NSString *str = [[string stringByTrim] lowercaseString];
    if (!str || !str.length) {
        return nil;
    }
    
    static NSDictionary *dic;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dic = @{@"true" :   @(YES),
                @"yes" :    @(YES),
                @"false" :  @(NO),
                @"no" :     @(NO),
                @"nil" :    [NSNull null],
                @"null" :   [NSNull null],
                @"<null>" : [NSNull null]};
    });
    NSNumber *num = dic[str];
    if (num) {
        if (num == (id)[NSNull null]) return nil;
        return num;
    }
    
    // hex number
    int sign = 0;
    if ([str hasPrefix:@"0x"]) sign = 1;
    else if ([str hasPrefix:@"-0x"]) sign = -1;
    if (sign != 0) {
        NSScanner *scan = [NSScanner scannerWithString:str];
        unsigned num = -1;
        BOOL suc = [scan scanHexInt:&num];
        if (suc)
            return [NSNumber numberWithLong:((long)num * sign)];
        else
            return nil;
    }
    // normal number
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return [formatter numberFromString:string];
}

- (NSNumber *)OperaFloat:(NSNumber *)num type:(NSString *)type{
    NSNumber *result = nil;
    if ([type isEqualToString:@"+"]) {
        result = @(self.floatValue + [num floatValue]);
    }else if ([type isEqualToString:@"-"]){
        result = @(self.floatValue - [num floatValue]);
    }else if ([type isEqualToString:@"*"]){
        result = @(self.floatValue * [num floatValue]);
    }else if ([type isEqualToString:@"/"]){
        result = @(self.floatValue / [num floatValue]);
    }else {
        return nil;
    }
    return result;
}

- (NSNumber *)OperaInt:(NSNumber *)num type:(NSString *)type{
    NSNumber *result = nil;
    if ([type isEqualToString:@"+"]) {
        result = @(self.integerValue + [num integerValue]);
    }else if ([type isEqualToString:@"-"]){
        result = @(self.integerValue - [num integerValue]);
    }else if ([type isEqualToString:@"*"]){
        result = @(self.integerValue * [num integerValue]);
    }else if ([type isEqualToString:@"/"]){
        result = @(self.integerValue / [num integerValue]);
    }else {
        return nil;
    }
    return result;
}
@end