//
//  ClothCanvasViewGenerator.m
//  4_factoryMethod_DesignPatters
//
//  Created by polo on 2018/12/2.
//  Copyright © 2018年 GeekLee. All rights reserved.
//  子类重载父类的方法，生成各式各样的画布

#import "ClothCanvasViewGenerator.h"
#import "ClothCanvasView.h"

@implementation ClothCanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)aframe {
    return [[ClothCanvasView alloc] initWithFrame:aframe];
}

@end
