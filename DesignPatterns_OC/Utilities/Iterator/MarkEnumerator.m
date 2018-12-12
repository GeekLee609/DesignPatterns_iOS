//
//  MarkEnumerator.m
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/11.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "MarkEnumerator.h"
#import "NSMutableArray+XYCMStack.h"

@interface MarkEnumerator ()

/// 数组
@property (nonatomic, strong) NSMutableArray *stack;

@end

@implementation MarkEnumerator

#pragma mark -init methods
- (instancetype)initWithMark:(id <Mark>)mark {
    if (self = [super init]) {
        self.stack = [NSMutableArray array];
        [self traverseAndBuildStackWithMark:mark];
    }
    return self;
}

- (void)traverseAndBuildStackWithMark:(id <Mark>)mark {
    if (mark == nil) {
        return;
    }
    //  压栈
    [self.stack push:mark];
    //  遍历子节点,若存在子节点就压栈
    NSUInteger index = [mark count];
    id <Mark> childMark;
    while ((childMark = [mark childMarkAtIndex:--index])) {
        [self traverseAndBuildStackWithMark:childMark];
    }
}

#pragma mark - public methods
- (NSArray *)allObjects {
    return [[self.stack reverseObjectEnumerator] allObjects];
}

- (id)nextObject {
    return [self.stack pop];
}

@end
