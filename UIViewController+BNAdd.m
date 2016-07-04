//
//  UIViewController+BNAdd.m
//  pop
//
//  Created by xiaos on 16/7/4.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import "UIViewController+BNAdd.h"
#import "UIView+BNAdd.h"

@implementation UIViewController (BNAdd)

//在指定的view上显示
- (void)showHUD:(NSString *)msg form:(UIView *)fromview {
    if (!msg.length) return;
    UIFont *font = [UIFont systemFontOfSize:17];
    CGSize size = [msg sizeWithFont:font maxSize:CGSizeMake(200, 200)];
    UILabel *label = [UILabel new];
    label.size = size;
    label.font = font;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    
    UIView *hud = [UIView new];
    hud.size = CGSizeMake(label.width + 20, label.height + 20);
    hud.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.650];
    hud.clipsToBounds = YES;
    hud.layer.cornerRadius = 3;
    
    label.center = CGPointMake(hud.width / 2, hud.height / 2);
    [hud addSubview:label];
    
    hud.alpha = 0;
    
    if (fromview) {
        hud.center = CGPointMake(fromview.width / 2, fromview.height / 2);
        [fromview addSubview:hud];
    }else {
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        hud.center = window.center;
        [window addSubview:hud];
    }
    
    [UIView animateWithDuration:0.4 animations:^{
        hud.alpha = 1;
    }];
    double delayInSeconds = 1.1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [UIView animateWithDuration:0.4 animations:^{
            hud.alpha = 0;
        } completion:^(BOOL finished) {
            [hud removeFromSuperview];
        }];
    });
}

@end

@implementation NSString (Ext)

- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)width
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    //    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxWidth:MAXFLOAT];
}

@end
