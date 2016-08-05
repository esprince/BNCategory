//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (BNAdd)

//range数组
+ (NSArray<NSNumber *> *(^)(NSInteger start,NSInteger end))range;

//T 转置 二维数组行列互换
+ (NSMutableArray *)turn:(NSArray<NSArray *> *)arr;

//返回任意对象
- (id)randomItem;

//遍历操作
- (void)each:(void (^)(id obj))block;

- (void)reverseEach:(void (^)(id))block;

- (void)eachTimes:(void (^)(id obj, NSUInteger index))block;

- (void)reverseEachTimes:(void (^)(id obj, NSUInteger index))block;

//异步遍历操作
- (void)apply:(void (^)(id obj))blcok;

//map
- (NSArray *(^)(id (^)(id)))map;

//filter
- (NSArray *(^)(BOOL (^)(id obj)))filter;

//reduce
- (id)reduce:(id)init with:(id (^)(id a, id b))blcok;

//聚合数组中的字符串
- (NSString *(^)(NSString *))join;


@end

@interface NSMutableArray (BNAdd)

//pop
- (id)pop;

//push
- (void)push:(id)obj;

//shift 去头
- (id)shift;

//un_shift  加头
- (void)unshift:(id)obj;

@end

