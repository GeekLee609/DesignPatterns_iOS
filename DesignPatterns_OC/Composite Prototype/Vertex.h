//
//  Vertex.h
//  OC_DesignPatterns
//
//  Created by polo on 2018/11/29.
//  Copyright © 2018年 GeekLee. All rights reserved.
//  Mark 的具体类，只包括位置信息，用于画线，实现 Mark 的协议方法，NSCopying 协议用于实现原型模式的 copy 拷贝

#import "Mark.h"

@interface Vertex : NSObject <Mark, NSCopying>

/// 颜色
@property (nonatomic, strong) UIColor *color;
/// 尺寸
@property (nonatomic, assign) CGFloat size;
/// 位置
@property (nonatomic, assign) CGPoint location;
/// 子节点数
@property (nonatomic, assign) NSInteger count;
/// 上一个节点
@property (nonatomic, readonly) id <Mark> lastChild;

/// 只包含 location 信息，用此来初始化
- (id)initWithLocation:(CGPoint)location;

///// 协议方法
//- (void)addMark:(id<Mark>)mark;
//- (void)removeMark:(id<Mark>)mark;
//- (id <Mark>)childMarkAtIndex:(NSInteger)index;
//
//
///// 原型模式
//- (id)copyWithZone:(NSZone *)zone;

@end
