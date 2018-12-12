//
//  Stroke.h
//  OC_DesignPatterns
//
//  Created by polo on 2018/11/29.
//  Copyright © 2018年 GeekLee. All rights reserved.
//  组合类，包含线条 Vertex， 点 Dot

#import "Mark.h"

@interface Stroke : NSObject <Mark, NSCopying>

/// 颜色
@property (nonatomic, strong) UIColor *color;
/// 尺寸
@property (nonatomic, assign) CGFloat size;
/// 位置
@property (nonatomic, assign) CGPoint location;
/// 子节点的个数
@property (nonatomic, assign) NSInteger count;
/// 上一个子节点
@property (nonatomic, readonly) id <Mark> lastChild;

- (void)addMark:(id<Mark>)mark;
- (void)removeMark:(id<Mark>)mark;
- (id <Mark>)childMarkAtIndex:(NSInteger)index;

- (id)copyWithZone:(NSZone *)zone;

@end
