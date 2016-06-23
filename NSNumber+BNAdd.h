//
//  NSNumber+BNAdd.h
//  Promise
//
//  Created by xiaos on 16/6/20.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (BNAdd)

//        [@4 times:^{
//            NSLog(@"hello ");
//        }];
//output hello hello hello hello
- (void)times:(void (^)(void))block;

//        [@5 timesWithIndex:^(NSInteger i) {
//            NSLog(@"%ld ",i);
//        }];
//output 0 1 2 3 4
- (void)timesWithIndex:(void (^)(NSInteger i))block;

//        [@10 upTo:15 do:^(NSInteger i) {
//            NSLog(@"%ld ",i);
//        }];
//output 10 11 12 13 14 15
- (void)upTo:(NSInteger)up do:(void (^)(NSInteger i))block;

//        [@20 downTo:15 do:^(NSInteger i) {
//            NSLog(@"%ld ",i);
//        }];
//output 20 19 18 17 16 15
- (void)downTo:(NSInteger)down do:(void (^)(NSInteger i))block;

//      NSLog(@"%@",[NSNumber numberByString:@"12"]);
//output @12
+ (NSNumber *)numberWithString:(NSString *)string;

- (NSNumber *)OperaFloat:(NSNumber *)num type:(NSString *)type;
- (NSNumber *)OperaInt:(NSNumber *)num type:(NSString *)type;

@end

