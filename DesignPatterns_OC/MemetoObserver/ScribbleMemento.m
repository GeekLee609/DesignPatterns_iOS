//
//  ScribbleMemento.m
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/12.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "ScribbleMemento.h"
#import "ScribbleMemento+Friend.h"

@implementation ScribbleMemento

#pragma mark - public methods
+ (ScribbleMemento *)memetoWithData:(NSData *)data {
    id <Mark> retoredMark = (id <Mark>)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    ScribbleMemento *memeto = [[ScribbleMemento alloc] initWithMark:retoredMark];
    return memeto;
}

- (NSData *)data {
    return [NSKeyedArchiver archivedDataWithRootObject:self.mark];
}

- (instancetype)initWithMark:(id<Mark>)aMark {
    if (self = [super init]) {
        self.mark = aMark;
    }
    return self;
}

@end
