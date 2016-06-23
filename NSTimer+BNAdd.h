//
//  NSTimer+BNAdd.h
//  Dict2List
//
//  Created by xiaos on 16/6/23.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (BNAdd)

//在当前runloop中以默认模式运行
+ (NSTimer *)scheduledTimer:(NSTimeInterval)ti
                    repeats:(BOOL)yesOrNo
                      block:(void(^)(NSTimer *timer))block;


//需要添加到runloop中 [NSRunloop currentLoop] addTimer: forMode:    default或comm模式
+ (NSTimer *)timer:(NSTimeInterval)ti
           repeats:(BOOL)yesOrNo
             block:(void(^)(NSTimer *timer))block;

@end
