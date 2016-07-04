//
//  UIViewController+BNAdd.h
//  pop
//
//  Created by xiaos on 16/7/4.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BNAdd)
- (void)showHUD:(NSString *)msg form:(UIView *)fromview;
@end

@interface NSString (Ext)

- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)width;

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end