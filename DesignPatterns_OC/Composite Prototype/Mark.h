//
//  Mark.h
//  OC_DesignPatterns
//
//  Created by polo on 2018/11/29.
//  Copyright © 2018年 GeekLee. All rights reserved.
//  组合对象的父类协议

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MarkVisitor.h"

@protocol Mark <NSObject>

/// 颜色
@property (nonatomic, strong) UIColor *color;
/// 尺寸
@property (nonatomic, assign) CGFloat size;
/// 位置
@property (nonatomic, assign) CGPoint location;
/// 子节点的个数
@property (nonatomic, assign, readonly) NSInteger count;
/// 上一个节点
@property (nonatomic, readonly) id <Mark> lastChild;

#pragma mark - 协议方法
/// 拷贝方法，原型模式，快速生成对象
- (id)copy;

#pragma mark - 画图相关
/// 添加一个节点
- (void)addMark:(id <Mark>) mark;
/// 删除一个节点
- (void)removeMark:(id <Mark>) mark;
/// 获取指定索引的节点
- (id <Mark>)childMarkAtIndex:(NSInteger)index;
/// 画图协议方法
- (void)drawWithContext:(CGContextRef)context;

#pragma mark -  树的遍历迭代
/// 迭代器
- (NSEnumerator *)enumerator;

/// 迭代器进行树的遍历
- (void)enumerateMarksUsingBlock:(void (^)(id <Mark>item, BOOL *stop))block;

/// 访问者接口
- (void)acceptMarkVisitor:(id <MarkVisitor>)visitor;

@end
