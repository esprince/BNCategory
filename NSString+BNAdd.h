//
//  NSString+BNAdd.h
//  Fundation
//
//  Created by xiaos on 16/6/21.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BNAdd)

- (NSString *)stringByTrim;

- (NSArray *)explode:(NSString *)str;

- (NSString *)replace:(NSString *)str to:(NSString *)toStr;

@end
