//
//  CanvasViewGenerator.m
//  4_factoryMethod_DesignPatters
//
//  Created by polo on 2018/12/2.
//  Copyright © 2018年 GeekLee. All rights reserved.
//  默认返回无图案的画布

#import "CanvasViewGenerator.h"
#import "CanvasView.h"

@implementation CanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)aframe {
    return [[CanvasView alloc] initWithFrame:aframe];
}

@end
