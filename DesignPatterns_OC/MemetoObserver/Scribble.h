//
//  Scribble.h
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/12.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
#import "ScribbleMemento.h"

NS_ASSUME_NONNULL_BEGIN

@interface Scribble : NSObject

/// 添加节点与移除节点
- (void)addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;
- (void)removeMark:(id <Mark>)aMark;

- (id)initWithMemeto:(ScribbleMemento *)aMemeto;
+ (Scribble *)scribbleWithMemeto:(ScribbleMemento *)aMemeto;
- (ScribbleMemento *)scribbleMemeto;
- (ScribbleMemento *)scribblrMemetoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot;
- (void)attachStateFromMemeto:(ScribbleMemento *)memeto;

@end

NS_ASSUME_NONNULL_END
