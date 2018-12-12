//
//  ViewController.m
//  DesignPatterns_OC
//
//  Created by polo on 2018/12/11.
//  Copyright © 2018年 GeekLee. All rights reserved.
//  设计模式代码

#import "CanvasViewController.h"
#import "CanvasView.h"
#import "Scribble.h"
#import "Stroke.h"
#import "Dot.h"

@interface CanvasViewController ()

/// 存储的对象
@property (nonatomic, strong) Scribble *scribble;
/// 画布视图
@property (nonatomic, strong) CanvasView *canvasView;
/// 涂鸦的颜色
@property (nonatomic, strong) UIColor *strokeColor;
/// 涂鸦的尺寸
@property (nonatomic, assign) CGFloat strokeSize;
/// 起点
@property (nonatomic, assign) CGPoint startPoint;


@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //  画布的生成
    CanvasViewGenerator *generator = [[CanvasViewGenerator alloc] init];
    [self loadCanvasViewWithGenerator:generator];
    
    Scribble *scribble = [[Scribble alloc] init];
    self.scribble = scribble;
    
    //  获取本地存储的颜色
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat redValue = [userDefaults floatForKey:@"red"];
    CGFloat greenValue = [userDefaults floatForKey:@"green"];
    CGFloat blueValue = [userDefaults floatForKey:@"blue"];
    CGFloat sizeValue = [userDefaults floatForKey:@"size"];
    self.strokeSize = sizeValue;
    self.strokeColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0];
}

#pragma mark - public methods
- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
    //  移除之前的画布
    [self.canvasView removeFromSuperview];
    CanvasView *canvasView = [generator canvasViewWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44)];
    self.canvasView = canvasView;
    //  放置在最上面的视图
    [self.view insertSubview:self.canvasView atIndex:(self.view.subviews.count - 1)];
}

#pragma mark - touch methods
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.startPoint = [[touches anyObject] locationInView:self.canvasView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:self.canvasView];
    if (CGPointEqualToPoint(lastPoint, self.startPoint)) {
        id <Mark>newStroke = [[Stroke alloc] init];
        newStroke.color = self.strokeColor;
        newStroke.size = self.strokeSize;
        
        NSInvocation *drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&newStroke atIndex:2];
        
        NSInvocation *undrawInvocation = [self undrawScribbleInvocation];
        [undrawInvocation setArgument:&newStroke atIndex:2];

        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
    }
    
    CGPoint currentPoint = [[touches anyObject] locationInView:self.canvasView];
    Vertex *vertex = [[Vertex alloc] initWithLocation:currentPoint];
    [self.scribble addMark:vertex shouldAddToPreviousMark:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:self.canvasView];
    CGPoint currentPoint = [[touches anyObject] locationInView:self.canvasView];
    
    if (CGPointEqualToPoint(lastPoint, currentPoint)) {
        //  画点
        Dot *singleDot = [[Dot alloc] initWithLocation:currentPoint];
        singleDot.color = self.strokeColor;
        singleDot.size = self.strokeSize;
        
        NSInvocation *drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&singleDot atIndex:2];
        
        NSInvocation *undrawInvocation = [self undrawScribbleInvocation];
        [undrawInvocation setArgument:&singleDot atIndex:2];
        
        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
    }
    self.startPoint = CGPointZero;
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.startPoint = CGPointZero;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([object isKindOfClass:[Scribble class]] && [keyPath isEqualToString:@"parentMark"]) {
        id <Mark> mark = [change objectForKey:NSKeyValueChangeNewKey];
        self.canvasView.mark = mark;
        [self.canvasView setNeedsDisplay];
    }
}


#pragma mark - tabbar action
/// 撤销
- (IBAction)commandRovoke:(UIBarButtonItem *)sender {
    [self.undoManager undo];
}

/// 返回
- (IBAction)commandBack:(UIBarButtonItem *)sender {
    [self.undoManager redo];
}


- (void)setStrokeSize:(CGFloat)strokeSize {
    _strokeSize = MAX(5, strokeSize);
}

- (void)setScribble:(Scribble *)scribble {
    _scribble = scribble;
    //  设置kvo
    [_scribble addObserver:self forKeyPath:@"parentMark" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    
}

#pragma mark - Draw Scribble Invocation Generation Methods
- (NSInvocation *)drawScribbleInvocation {
    NSMethodSignature *executeMethodSignature = [self.scribble methodSignatureForSelector:@selector(addMark:shouldAddToPreviousMark:)];
    NSInvocation *drawInvocation = [NSInvocation invocationWithMethodSignature:executeMethodSignature];
    [drawInvocation setTarget:self.scribble];
    [drawInvocation setSelector:@selector(addMark:shouldAddToPreviousMark:)];
    BOOL attchToPreviousMark = NO;
    [drawInvocation setArgument:&attchToPreviousMark atIndex:3];
    return drawInvocation;
}

- (NSInvocation *)undrawScribbleInvocation {
    NSMethodSignature *unexecuteMethodSignature = [self.scribble methodSignatureForSelector:@selector(removeMark:)];
    NSInvocation *undrawInvocation = [NSInvocation invocationWithMethodSignature:unexecuteMethodSignature];
    [undrawInvocation setTarget:self.scribble];
    [undrawInvocation setSelector:@selector(removeMark:)];
    return undrawInvocation;
}

- (void)executeInvocation:(NSInvocation *)invocation withUndoInvocation:(NSInvocation *)undoInvocation {
    [invocation retainArguments];
    [[self.undoManager prepareWithInvocationTarget:self] unexecuteInvocation:undoInvocation withRedoInvocation:invocation];
    [invocation invoke];
}

- (void)unexecuteInvocation:(NSInvocation *)invocation withRedoInvocation:(NSInvocation *)redoInvocation {
    [[self.undoManager prepareWithInvocationTarget:self] executeInvocation:redoInvocation withUndoInvocation:invocation];
    [invocation invoke];
}


@end
