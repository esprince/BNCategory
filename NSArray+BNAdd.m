//
//  NSArray+BNAdd.m
//  Promise
//
//  Created by xiaos on 16/6/20.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import "NSArray+BNAdd.h"

@implementation NSArray (BNAdd)

- (void)each:(void (^)(id))block {
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block(obj);
    }];
}

- (void)eachTimes:(void (^)(id obj, NSUInteger index))block {
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block(obj,idx);
    }];
}

- (void)apply:(void (^)(id))blcok{
    [self enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        blcok(obj);
    }];
}


- (NSArray *(^)(id (^)(id)))map {
    return ^NSArray *(id (^block)(id)) {
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:self.count];
        [self each:^(id obj) {
            id result = block(obj)?:[NSNull null];
            [arr addObject:result];
        }];
        return arr;
    };
//    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:self.count];
//    [self each:^(id obj) {
//        id result = block(obj)?:[NSNull null];
//        [arr addObject:result];
//    }];
//    return arr;
}
- (NSArray *(^)(BOOL (^)(id obj)))filter {
    return ^NSArray *(BOOL (^block)(id obj)){
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:self.count];
        [self each:^(id obj) {
            if (block(obj)) {
                [arr addObject:obj];
            }
        }];
        return arr;
    };
}

//- (NSArray *)filter:(BOOL (^)(id))block {
//    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:self.count];
//    [self each:^(id obj) {
//        if (block(obj)) {
//            [arr addObject:obj];
//        }
//    }];
//    return arr;
//}

- (id)reduce:(id)init with:(id (^)(id, id))blcok {
    __block id result = init;
    [self each:^(id obj) {
        result = blcok(result,obj);
    }];
    return result;
}


- (NSString *)implode:(NSString *)str {
    NSString *allStr = [self reduce:@"" with:^NSString *(NSString *a, NSString *b) {
        return [a stringByAppendingFormat:@"%@%@",str,b];
    }];
    
    return [allStr substringFromIndex:str.length];
}


- (id)randomItem {
    if (self.count) {
        return self[arc4random_uniform((u_int32_t)self.count)];
    }
    return nil;
}

+ (NSMutableArray *)turn:(NSArray<NSArray *> *)arr {
    
    NSInteger col = arr[0].count;
    NSInteger row = arr.count;
    
    
    NSMutableArray<NSMutableArray *> *tArr = [NSMutableArray arrayWithCapacity:col];
    
    for (NSInteger i = 0; i < col; i++) {
        NSMutableArray *tArr0 = [NSMutableArray arrayWithCapacity:row];
        [tArr addObject:tArr0];
    }
    
    
    for (NSInteger i = 0; i < col; i++) {
        for (NSInteger j = 0; j < row; j++) {
            [tArr[i] addObject:arr[j][i]];
        }
    }
    
    return tArr;
}

@end

@implementation NSMutableArray (BNAdd)

//pop
- (id)pop {
    id result = [self objectAtIndex:self.count - 1];
    [self removeObjectAtIndex:self.count - 1];
    return result;
}

//push
- (void)push:(id)obj{
    if ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSMutableArray class]]){
        [self addObjectsFromArray:obj];
    }else {
        [self addObject:obj];
    }
}

//shift 去头
- (id)shift{
    id result = [self objectAtIndex:0];
    [self removeObjectAtIndex:0];
    return result;
}

//unshift  加头
- (void)unshift:(id)obj{
    if  ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSMutableArray class]]) {
        NSArray *value = (NSArray *)obj;
        [self insertObjects:value atIndexes:[NSIndexSet indexSetWithIndexesInRange:(NSRange){0,value.count}]];
    }else {
        [self insertObject:obj atIndex:0];
    }
}


@end
