//
//  ScribbleMemento.h
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/12.
//  Copyright © 2018年 GeekLee. All rights reserved.
//  备忘录存储类

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleMemento : NSObject

/// 存储，由 data 返回一个备忘录对象
+ (ScribbleMemento *)memetoWithData:(NSData *)data;

/// 返回备忘录中的数据
- (NSData *)data;

@end

NS_ASSUME_NONNULL_END
