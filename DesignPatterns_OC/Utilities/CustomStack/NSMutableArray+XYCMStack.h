//
//  NSMutableArray+XYCMStack.h
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/11.
//  Copyright © 2018年 GeekLee. All rights reserved.
//  通过可变数组实现自定义栈数据结构

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (XYCMStack)

/// 压栈
- (void)push:(id)object;

/// 出栈
- (id)pop;

/// 删除栈底元素
- (void)dropBottom;

@end

NS_ASSUME_NONNULL_END
