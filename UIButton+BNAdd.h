//
// Created by xiaos on 16/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BNAdd)
- (void)onClick:(void (^)(id sender))block;
- (void)tapped:(UIControlEvents)events do:(void(^)(id sender))block;
@end