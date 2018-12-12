//
//  Vertex.m
//  OC_DesignPatterns
//
//  Created by polo on 2018/11/29.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

@dynamic color, size;

- (id)initWithLocation:(CGPoint)location {
    if (self = [super init]) {
        self.location = location;
    }
    return self;
}

#pragma mark - protocol methods，对于画线的类，协议方法空实现
- (void)addMark:(id<Mark>)mark {
}

- (void)removeMark:(id<Mark>)mark {
}

- (id <Mark>)childMarkAtIndex:(NSInteger)index {
    return nil;
}

- (NSInteger)count {
    return 0;
}

- (id <Mark>)lastChild {
    return nil;
}

- (void)drawWithContext:(CGContextRef)context {
    //  通过 location 中的坐标来实现画线操作
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    CGContextAddLineToPoint(context, x, y);
}

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    [visitor visitorVertex:self];
}


- (NSEnumerator *)enumerator {
    return nil;
}

- (void)enumerateMarksUsingBlock:(void (^)(id<Mark>, BOOL *))block {
    
}

#pragma mark - prototype patterns  NSCoping协议实现
- (id)copyWithZone:(NSZone *)zone {
    Vertex *vertexCopy = [[[self class] allocWithZone:zone] initWithLocation:self.location];
    return vertexCopy;
}

#pragma mark - property syethnsis
- (void)setColor:(UIColor *)color {
}

- (UIColor *)color {
    return nil;
}

- (void)setSize:(CGFloat)size {
}

- (CGFloat)size {
    return 0.0;
}

@end
