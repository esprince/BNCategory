//
//  NSTimer+BNAdd.m
//  Dict2List
//
//  Created by xiaos on 16/6/23.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import "NSTimer+BNAdd.h"

@implementation NSTimer (BNAdd)

+ (NSTimer *)scheduledTimer:(NSTimeInterval)ti
           repeats:(BOOL)yesOrNo
             block:(void(^)(NSTimer *timer))block {
    return [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(bonc_timer_event:) userInfo:[block copy] repeats:yesOrNo];
}

+ (NSTimer *)timer:(NSTimeInterval)ti
           repeats:(BOOL)yesOrNo
             block:(void(^)(NSTimer *timer))block {
    return [NSTimer timerWithTimeInterval:ti target:self selector:@selector(bonc_timer_event:) userInfo:[block copy] repeats:yesOrNo];
}

+ (void)bonc_timer_event:(NSTimer *)timer {
    if (timer.userInfo) {
        void(^block)(NSTimer *timer) = (void(^)(NSTimer *timer))timer.userInfo;
        block(timer);
    }
}

- (void)start {
    [self setFireDate:[NSDate distantPast]];
}

- (void)stop {
    [self setFireDate:[NSDate distantFuture]];
}

@end
