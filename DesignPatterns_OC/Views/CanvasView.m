//
//  CanvasView.m
//  4_factoryMethod_DesignPatters
//
//  Created by polo on 2018/12/2.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"
#import "Mark.h"

@implementation CanvasView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

/// setNeedsDisplay 方法调用的
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    MarkRenderer *markRenderer = [[MarkRenderer alloc] initWithCGContext:context];
    [self.mark acceptMarkVisitor:markRenderer];
}


@end
