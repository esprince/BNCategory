//
//  NSNumber+BNAdd.h
//  Promise
//
//  Created by xiaos on 16/6/20.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,BNNumberOperationType) {
    BNAdd,
    BNSub,
    BNMul,
    BNDiv
};

@interface NSNumber (BNAdd)

- (void)times:(void (^)(void))block;

- (void)timesWithIndex:(void (^)(NSInteger i))block;

- (void)to:(NSInteger)to do:(void (^)(NSInteger i))block;

+ (NSNumber *)numberWithString:(NSString *)string;

- (NSNumber *)OperaFloat:(NSNumber *)num type:(BNNumberOperationType)type;
- (NSNumber *)OperaInt:(NSNumber *)num type:(BNNumberOperationType)type;

@end

