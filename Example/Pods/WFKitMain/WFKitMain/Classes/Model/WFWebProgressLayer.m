//
//  WFWebProgressLayer.m
//  WFKitMain_Example
//
//  Created by 王宇 on 2019/10/12.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import "WFWebProgressLayer.h"
#import "NSTimer+WFAddition.h"
#import "WKHelp.h"
#import <UIKit/UIKit.h>

static NSTimeInterval const ProgressTimeInterval = 0.03;

@interface WFWebProgressLayer()
@property (nonatomic, strong) CAShapeLayer *layer;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) CGFloat plusWidth;
@end

@implementation WFWebProgressLayer

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initBezierPath];
    }
    return self;
    
}

- (void)initBezierPath {
    //绘制贝塞尔曲线
    UIBezierPath *path = [UIBezierPath bezierPath];
    //起点
    [path moveToPoint:CGPointMake(0, 3)];
    //终点
    [path addLineToPoint:CGPointMake(ScreenWidth,3)];
    
    self.path = path.CGPath;
    self.strokeEnd = 0;
    _plusWidth = 0.005;
    self.lineWidth = 2;
    self.strokeColor = [UIColor redColor].CGColor;
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:ProgressTimeInterval target:self selector:@selector(pathChanged:) userInfo:nil repeats:YES];
    [_timer pauseTime];
    
}

// 设置进度条增加的进度
- (void)pathChanged:(NSTimer *)timer{
    self.strokeEnd += _plusWidth;
    if (self.strokeEnd > 0.60) {
        _plusWidth = 0.002;
    }
    
    if (self.strokeEnd > 0.85) {
        _plusWidth = 0.0007;
    }
    
    if (self.strokeEnd > 0.93) {
        _plusWidth = 0;
    }
}

//在KVO 计算  实际的读取进度时,调用改方法
- (void)WebViewPathChanged:(CGFloat)estimatedProgress {
    self.strokeEnd = estimatedProgress;
    
}
//开始加载
-(void)startLoad{
    [self.timer webPageTimeWithTimeInterval:ProgressTimeInterval];
}
//加载完成
-(void)finishedLoadWithError:(NSError * __nullable)error {
    CGFloat timer;
    if (error == nil) {
        [self closeTimer];
        timer = 0.5;
        self.strokeEnd = 1.0;
    }else {
        timer = 45.0;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (timer == 45.0) {
            [self closeTimer];
        }
        self.hidden = YES;
        [self removeFromSuperlayer];
        
    });
}
//关闭时间
-(void)closeTimer{
    [_timer invalidate];
    _timer = nil;
}

- (void)webViewPathChanged:(CGFloat)estimatedProgress{
    [self closeTimer];
}
@end
