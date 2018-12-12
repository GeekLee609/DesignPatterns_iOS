//
//  Scribble.m
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/12.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "Scribble.h"
#import "Stroke.h"
#import "ScribbleMemento+Friend.h"

@interface Scribble ()

/// 父节点
@property (nonatomic, strong) id <Mark> parentMark;
/// 添加的节点
@property (nonatomic, strong) id <Mark> incrementalMark;

@end

@implementation Scribble

#pragma mark - init method
- (instancetype)init {
    if (self = [super init]) {
        self.parentMark = [[Stroke alloc] init];
    }
    return self;
}

#pragma mark - public methods
- (void)addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark {
    /// 手动触发 KVO
    [self willChangeValueForKey:@"parentMark"];
    
    if (shouldAddToPreviousMark) {
        [self.parentMark.lastChild addMark:aMark];
    } else {
        [self.parentMark addMark:aMark];
        self.incrementalMark = aMark;
    }
    [self didChangeValueForKey:@"parentMark"];
}

- (void)removeMark:(id <Mark>)aMark {
    if (aMark == self.parentMark) {
        return;
    }
    [self willChangeValueForKey:@"parentMark"];
    [self.parentMark removeMark:aMark];
    if (aMark == self.incrementalMark) {
        self.incrementalMark = nil;
    }
    [self didChangeValueForKey:@"parentMark"];
}

- (instancetype)initWithMemeto:(ScribbleMemento *)aMemeto {
    if (self = [super init]) {
        if (aMemeto.hasCompleteSnapshot) {
            self.parentMark = aMemeto.mark;
        } else {
            self.parentMark = [[Stroke alloc] init];
            [self attachStateFromMemeto:aMemeto];
        }
    }
    return self;
}

- (void)attachStateFromMemeto:(ScribbleMemento *)memeto {
    [self addMark:memeto.mark shouldAddToPreviousMark:NO];
}

- (ScribbleMemento *)scribblrMemetoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot {
    id <Mark> memetoMark = self.incrementalMark;
    if (hasCompleteSnapshot) {
        memetoMark = self.parentMark;
    } else if(memetoMark == nil) {
        return nil;
    }
    ScribbleMemento *memeto = [[ScribbleMemento alloc] initWithMark:memetoMark];
    memeto.hasCompleteSnapshot = hasCompleteSnapshot;
    return memeto;
}

- (ScribbleMemento *)scribbleMemeto {
    return [self scribblrMemetoWithCompleteSnapshot:YES];
}

+ (Scribble *)scribbleWithMemeto:(ScribbleMemento *)aMemeto {
    return [[Scribble alloc] initWithMemeto:aMemeto];
}

@end
