//
//  PaperCanvasView.m
//  4_factoryMethod_DesignPatters
//
//  Created by polo on 2018/12/2.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "PaperCanvasView.h"

@implementation PaperCanvasView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //  添加画布特定的方法
        UIImage *imagePaper = [UIImage imageNamed:@"Paper"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:imagePaper];
        [self addSubview:imageView];
    }
    return self;
}

@end
