//
//  Dot.h
//  OC_DesignPatterns
//
//  Created by polo on 2018/11/29.
//  Copyright © 2018年 GeekLee. All rights reserved.
//  Vertex 的子类，是一个点，包含颜色和尺寸

#import "Vertex.h"

@interface Dot : Vertex

/// 颜色
@property (nonatomic, strong) UIColor *color;
/// 尺寸
@property (nonatomic, assign) CGFloat size;

@end
