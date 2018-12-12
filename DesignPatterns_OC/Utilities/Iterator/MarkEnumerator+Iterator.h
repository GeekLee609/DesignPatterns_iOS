//
//  MarkEnumerator+Iterator.h
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/11.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "MarkEnumerator.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarkEnumerator ()

- (instancetype)initWithMark:(id <Mark>)mark;

- (void)traverseAndBuildStackWithMark:(id <Mark>)mark;

@end

NS_ASSUME_NONNULL_END
