//
//  CanvasViewGenerator.h
//  4_factoryMethod_DesignPatters
//
//  Created by polo on 2018/12/2.
//  Copyright © 2018年 GeekLee. All rights reserved.
//  画布生成器

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CanvasView;

@interface CanvasViewGenerator : NSObject

- (CanvasView *)canvasViewWithFrame:(CGRect) aframe;

@end
