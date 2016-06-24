//
// Created by xiaos on 16/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import "NSObject+BNAdd.h"
#import <objc/runtime.h>

static const int BONC_OBJECT_KEY = 10010;
@implementation NSObject (BNAdd)

- (void)setExtraInfo:(NSDictionary *)dict{
    objc_setAssociatedObject(self,&BONC_OBJECT_KEY,dict,OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)extraInfo{
    return objc_getAssociatedObject(self,&BONC_OBJECT_KEY);
}

@end