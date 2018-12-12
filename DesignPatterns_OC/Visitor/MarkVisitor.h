//
//  MarkVisitor.h
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/12.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Mark;
@class Dot, Vertex, Stroke;

@protocol MarkVisitor <NSObject>

- (void)visitorMark:(id <Mark>)mark;
- (void)visitorDot:(Dot *)dot;
- (void)visitorVertex:(Vertex *)vertex;
- (void)visitorStroke:(Stroke *)stroke;

@end

NS_ASSUME_NONNULL_END
