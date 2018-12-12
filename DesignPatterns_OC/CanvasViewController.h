//
//  CanvasViewController
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/11.
//  Copyright © 2018年 GeekLee. All rights reserved.
//  主画板控制器

#import <UIKit/UIKit.h>
#import "CanvasViewGenerator.h"

@interface CanvasViewController : UIViewController






/// 画布生成器方法，工厂模式。子类重载父类方法实现工厂方法，返回不同的子类实例
- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

@end

