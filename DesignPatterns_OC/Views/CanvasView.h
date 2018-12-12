//
//  CanvasView.h
//  4_factoryMethod_DesignPatters
//
//  Created by polo on 2018/12/2.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Mark ;

@interface CanvasView : UIView

@property (nonatomic, strong) id <Mark> mark;

@end
