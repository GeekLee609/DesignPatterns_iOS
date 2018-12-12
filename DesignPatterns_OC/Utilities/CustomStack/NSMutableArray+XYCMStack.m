//
//  NSMutableArray+XYCMStack.m
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/11.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "NSMutableArray+XYCMStack.h"

@implementation NSMutableArray (XYCMStack)

- (void)push:(id)object {
    if (object != nil) {
        [self addObject:object];
    }
}

- (id)pop {
    [self removeLastObject];
    return self.lastObject;
}

- (void)dropBottom {
    if (!self.count) {
        return;
    }
    [self removeObjectAtIndex:0];
}

@end
