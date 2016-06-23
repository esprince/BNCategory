//
//  NSDictionary+BNAdd.h
//  Fundation
//
//  Created by xiaos on 16/6/21.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (BNAdd)

- (void)each:(void(^)(id key, id value))block;

- (NSDictionary *)map:(id (^)(id key, id value))block;

- (NSDictionary *)filter:(BOOL (^)(id key, id value))block;

- (NSArray *)orderValuesBy:(NSArray *)orderKeys;
@end
