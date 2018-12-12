//
//  ScribbleMemento+Friend.h
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/12.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "ScribbleMemento.h"
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleMemento ()

- (instancetype)initWithMark:(id <Mark>)aMark;

@property (nonatomic, strong) id<Mark> mark;
/// 是否完成截图
@property (nonatomic, assign) BOOL hasCompleteSnapshot;

@end

NS_ASSUME_NONNULL_END
