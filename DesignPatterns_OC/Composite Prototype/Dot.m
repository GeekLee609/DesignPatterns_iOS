//
//  Dot.m
//  OC_DesignPatterns
//
//  Created by polo on 2018/11/29.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "Dot.h"

@implementation Dot
@synthesize color=_color, size = _size;

#pragma mark - Mark 协议方法
- (void)drawWithContext:(CGContextRef)context {
    //  实现画点操作.实心圆圈
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    CGRect rect = CGRectMake(x - self.size * 0.5, y - self.size * 0.5, self.size, self.size);
    CGContextSetFillColorWithColor(context, self.color.CGColor);
    CGContextFillEllipseInRect(context, rect);
}

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    [visitor visitorDot:self];
}

#pragma mark - prototype patterns  NSCoping 协议方法
- (id)copyWithZone:(NSZone *)zone {
    Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLocation:self.location];
    //  复制颜色
    dotCopy.color = [UIColor colorWithCGColor:self.color.CGColor];
    //  点的尺寸
    dotCopy.size = self.size;
    return dotCopy;
}

@end
