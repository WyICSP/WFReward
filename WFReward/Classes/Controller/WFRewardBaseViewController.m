//
//  WFRewardBaseViewController.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardBaseViewController.h"
#import "WFRewardChildViewController.h"
#import "TitleScrollView.h"
#import "WKConfig.h"
#import "UserData.h"

@interface WFRewardBaseViewController ()<UIScrollViewDelegate>
/// contentView
@property (nonatomic, strong) UIScrollView *contentView;
/// TitleScrollView
@property (nonatomic, strong) TitleScrollView *titleScroll;
/// title 数据源
@property (nonatomic, strong) NSArray *titleArray;
@end

@implementation WFRewardBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
}

- (void)setUI {
    self.title = @"奖励中心";
    self.titleArray = @[@"进行中",@"已完成",@"即将开始"];
    [self setupChildViewControllers];
    //添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:self.contentView];
}

#pragma mark  初始化子控制器
- (void)setupChildViewControllers {
    for (int i = 0; i < 3; i ++) {
        WFRewardChildViewController *child  = [WFRewardChildViewController new];
        child.status = i;
        [self addChildViewController:child];
    }
}

#pragma mark 便签栏按钮点击
-(void)titleClick:(NSInteger)index {
    //滚动,切换子控制器
    CGPoint offset = self.contentView.contentOffset;
    offset.x  = index * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}

#pragma mark -UIScrollViewDelegate
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //添加子控制器的view
    //当前索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    //取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0;//设置控制器的y值为0(默认为20)
    vc.view.height = scrollView.height;//设置控制器的view的height值为整个屏幕的高度（默认是比屏幕少20）
    [scrollView addSubview:vc.view];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
    //当前索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    //点击butto
    [self.titleScroll setSelectedIndex:index];
}

#pragma mark get set
/**
 创建 UIScrollView

 @return contentView
 */
- (UIScrollView *)contentView {
    if (!_contentView) {
        //不要自动调整inset
        self.automaticallyAdjustsScrollViewInsets = NO;
        _contentView = [[UIScrollView alloc] init];
        _contentView.frame = CGRectMake(0, self.titleScroll.height, ScreenWidth, ScreenHeight - self.titleScroll.height);
        _contentView.delegate = self;
        _contentView.contentSize = CGSizeMake(_contentView.width * self.childViewControllers.count, 0);
        _contentView.pagingEnabled = YES;
        _contentView.bounces = NO;
        _contentView.showsHorizontalScrollIndicator = FALSE;
        _contentView.scrollEnabled = NO;
        [self.view insertSubview:_contentView atIndex:0];
        _contentView.contentOffset = CGPointMake(0*ScreenWidth, 0);
        //添加第一个控制器的view
        [self scrollViewDidEndScrollingAnimation:_contentView];
    }
    return _contentView;
}

- (TitleScrollView *)titleScroll {
    if (!_titleScroll) {
        @weakify(self)
        _titleScroll = [[TitleScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44) lineName:@"segmentedLine" TitleArray:self.titleArray selectedIndex:0 titleFontSize:14 scrollEnable:NO lineEqualWidth:NO isFontNeedChange:NO selectColor:UIColorFromRGB(0x333333) defaultColor:UIColorFromRGB(0x817170) SelectBlock:^(NSInteger index) {
            @strongify(self)
            [self titleClick:index];

        }];
        _titleScroll.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_titleScroll];
    }
    return _titleScroll;
}

@end
