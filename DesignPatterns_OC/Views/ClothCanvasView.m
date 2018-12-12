//
//  ClothCanvasView.m
//  4_factoryMethod_DesignPatters
//
//  Created by polo on 2018/12/2.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "ClothCanvasView.h"

@implementation ClothCanvasView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImage *imageCloth = [UIImage imageNamed:@"Cloth"];
        UIImageView *imageViewCloth = [[UIImageView alloc] initWithImage:imageCloth];
        [self addSubview:imageViewCloth];
    }
    return self;
}


@end
