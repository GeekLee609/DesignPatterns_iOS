//
//  MarkRenderer.m
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/12.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "MarkRenderer.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"

@interface MarkRenderer ()

/// 是否移动
@property (nonatomic, assign) BOOL shouldMoveContextDot;

/// 上下文
@property (nonatomic, assign) CGContextRef context;

@end

@implementation MarkRenderer

#pragma mark - init method
- (instancetype)initWithCGContext:(CGContextRef)context {
    if (self = [super init]) {
        self.context = context;
        self.shouldMoveContextDot = YES;
    }
    return self;
}

#pragma mark - MarkVisitor methods
- (void)visitorMark:(id<Mark>)mark {
    //  默认行为
}

- (void)visitorDot:(Dot *)dot {
    //  画点
    CGFloat x = dot.location.x;
    CGFloat y = dot.location.y;
    CGFloat size = dot.size;
    CGRect rect = CGRectMake(x - 0.5 * size, y - 0.5 * size, size, size);
    CGContextSetFillColorWithColor(self.context, dot.color.CGColor);
    CGContextFillEllipseInRect(self.context, rect);
}

- (void)visitorVertex:(Vertex *)vertex {
    CGFloat x = vertex.location.x;
    CGFloat y = vertex.location.y;
    if (self.shouldMoveContextDot) {
        CGContextMoveToPoint(self.context, x, y);
        self.shouldMoveContextDot = NO;
    } else {
        CGContextAddLineToPoint(self.context, x, y);
    }
}

- (void)visitorStroke:(Stroke *)stroke {
    CGContextSetStrokeColorWithColor(self.context, stroke.color.CGColor);
    CGContextSetLineWidth(self.context, stroke.size);
    CGContextSetLineCap(self.context, kCGLineCapRound);
    CGContextStrokePath(self.context);
    self.shouldMoveContextDot = YES;
}

@end
