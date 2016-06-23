//
//  NSDictionary+BNAdd.m
//  Fundation
//
//  Created by xiaos on 16/6/21.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import "NSDictionary+BNAdd.h"

@implementation NSDictionary (BNAdd)

- (void)each:(void(^)(id key, id value))block {
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        block(key, obj);
    }];
}

- (NSDictionary *)map:(id (^)(id key, id value))block {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self each:^(id key, id value) {
        id result = block(key,value);
        dict[key] = result;
    }];
    return dict;
}

- (NSDictionary *)filter:(BOOL (^)(id key, id value))block {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    [self each:^(id key, id value) {
        if (block(key, value)) {
            dict[key] = value;
        }
    }];
    return dict;
}

- (NSArray *)orderValuesBy:(NSArray *)orderKeys {
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:3];
    for (NSInteger i = 0; i<3 ; i++) {
        [result addObject:self[orderKeys[i]]];
    }
    return (NSArray *)result;
}

@end
