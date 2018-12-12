//
//  Stroke.m
//  OC_DesignPatterns
//
//  Created by polo on 2018/11/29.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "Stroke.h"
#import "MarkEnumerator+Iterator.h"

@interface Stroke()

/// 子节点数组
@property (nonatomic, strong) NSMutableArray *children;

@end

@implementation Stroke
@dynamic location;


- (id)init {
    if (self = [super init]) {
        self.children = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Mark 协议方法
/// 不处理
- (void)setLocation:(CGPoint)location {
}

- (CGPoint)location {
    if (self.children.count) {
        id <Mark> obj = self.children.firstObject;
        return [obj location];
    }
    return CGPointZero;
}

- (void)addMark:(id<Mark>)mark {
    [self.children addObject:mark];
}

- (void)removeMark:(id<Mark>)mark {
    /// 如果 mark 在这一层就直接删除
    if ([self.children containsObject:mark]) {
        [self.children removeObject:mark];
    }else {
        /// 每个子节点遍历去查找删除
        [self.children makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (id <Mark>)childMarkAtIndex:(NSInteger)index {
    if (index >= self.children.count) {
        return nil;
    }
    return [self.children objectAtIndex:index];
}

- (void)drawWithContext:(CGContextRef)context {
    CGContextMoveToPoint(context, self.location.x, self.location.y);
    //  遍历叶子结点
    for (id <Mark> subMark in self.children) {
        [subMark drawWithContext:context];
    }
    //  填充线
    CGContextSetLineWidth(context, self.size);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    CGContextStrokePath(context);
}

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    for (id <Mark>dot in self.children) {
        [dot acceptMarkVisitor:visitor];
    }
    [visitor visitorStroke:self];
}

- (NSEnumerator *)enumerator {
    return [[MarkEnumerator alloc] initWithMark:self];
}


- (void)enumerateMarksUsingBlock:(void (^)(id<Mark>, BOOL *))block {
    BOOL stop = NO;
    NSEnumerator *enumerator = [self enumerator];
    for (id <Mark> mark in enumerator) {
        block(mark, &stop);
        if (stop) {
            break;
        }
    }
}

/// 返回子节点的个数
- (NSInteger) count {
    return self.children.count;
}

- (id <Mark>)lastChild {
    return self.children.lastObject;
}

#pragma mark - prototype patterns
- (id)copyWithZone:(NSZone *)zone {
    Stroke *strokeCopy = [[[self class] allocWithZone:zone] init];
    
    //  复制 color 与尺寸大小
    strokeCopy.color = [UIColor colorWithCGColor:self.color.CGColor];
    strokeCopy.size = self.size;
    
    //  复制子节点
    for (id <Mark> child in self.children) {
        id <Mark> childCopy = [child copy];
        [strokeCopy addMark:childCopy];
    }
    return strokeCopy;
}


@end
