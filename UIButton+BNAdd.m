//
// Created by xiaos on 16/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import "UIButton+BNAdd.h"
#import <objc/runtime.h>

static const int BLOCK_KEY;

@interface BN_UIBarButtonBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

- (id)initWithBlock:(void (^)(id sender))block;
- (void)invoke:(id)sender;

@end

@implementation BN_UIBarButtonBlockTarget

- (id)initWithBlock:(void (^)(id sender))block{
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender {
    if (self.block) self.block(sender);
}

@end

@implementation UIButton (BNAdd)

- (void)onClick:(void (^)(id sender))block {
    BN_UIBarButtonBlockTarget *target = [[BN_UIBarButtonBlockTarget alloc] initWithBlock:block];
    objc_setAssociatedObject(self, &BLOCK_KEY, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:target action:@selector(invoke:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tapped:(UIControlEvents)events do:(void(^)(id sender))block {
    BN_UIBarButtonBlockTarget *target = [[BN_UIBarButtonBlockTarget alloc] initWithBlock:block];
    objc_setAssociatedObject(self, &BLOCK_KEY, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:target action:@selector(invoke:) forControlEvents:events];
}

- (void (^)(id)) clickBlock {
    BN_UIBarButtonBlockTarget *target = objc_getAssociatedObject(self, &BLOCK_KEY);
    return target.block;
}

@end