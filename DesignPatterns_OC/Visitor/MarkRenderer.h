//
//  MarkRenderer.h
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/12.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarkVisitor.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarkRenderer : NSObject <MarkVisitor>

- (instancetype)initWithCGContext:(CGContextRef)context;

@end

NS_ASSUME_NONNULL_END
