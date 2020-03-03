//
//  WFRewardDetailViewController.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/22.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#define TopSpace ISIPHONEX ? 20.0f+XHEIGHT : 20.0f    // 上间距

#import "WFRewardDetailViewController.h"
#import "WFRewardDetailIndexTableViewCell.h"
#import "WFRewardDetailArriveTableViewCell.h"
#import "WFRewardIncomeDetailViewController.h"
#import "WFRewardDetailHeadView.h"
#import "WFRewardDetailSectionView.h"
#import "WFRewardCenterDetailModel.h"
#import "WFRewardDataTool.h"
#import "WKConfig.h"

@interface WFRewardDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
/// tableView
@property (nonatomic, strong, nullable) UITableView *tableView;
/// headView
@property (nonatomic, strong, nullable) WFRewardDetailHeadView *headView;
/// 数据源
@property (nonatomic, strong, nullable) WFRewardCenterDetailModel *mainModel;
/// 多少个区
@property (nonatomic, assign) NSInteger sectionCount;
/// navbarView
@property (nonatomic, strong, nullable) UIView *navBarView;
 ///返回按钮
@property (nonatomic, strong, nullable) UIButton *backBtn;
///  查看按钮
@property (nonatomic, strong, nullable) UIButton *lookBtn;
/// title
@property (nonatomic, strong, nullable) UILabel *titleLbl;
@end

@implementation WFRewardDetailViewController

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark 私有方法
- (void)setUI {
    [self.view addSubview:self.navBarView];
    [self getRewardDetailData];
}

/// 获取数据
- (void)getRewardDetailData {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params safeSetObject:self.awardsConfigId forKey:@"awardsConfigId"];
    @weakify(self)
    [WFRewardDataTool getRewardDetailWithParams:params resultBlock:^(WFRewardCenterDetailModel * _Nonnull models) {
        @strongify(self)
        self.mainModel = models;
        // 获取总的区的个数
        self.sectionCount = self.mainModel.awardsIndex.count;
        // title
        self.titleLbl.text = self.mainModel.name;
        if (self.mainModel.awardsIndex.count != 0 && [[[self.mainModel.awardsIndex safeObjectAtIndex:0] awardsIndexParams] count] != 0) {
            WFRewardIndexItemModel *iModel = [[[self.mainModel.awardsIndex safeObjectAtIndex:0] awardsIndexParams] safeObjectAtIndex:0];
            self.lookBtn.hidden = !iModel.awardsCheckStatus;
        }
        [self.tableView reloadData];
    }];
}

/// 返回
- (void)backBtn:(UIButton *)sender {
    [self goBack];
}

/// 查看明细
- (void)lookBtnClick:(UIButton *)sender {
    WFRewardIncomeDetailViewController *detail = [[WFRewardIncomeDetailViewController alloc] init];
    detail.awardsFinalId = self.mainModel.awardsConfigId;
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionCount + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == self.sectionCount) {
        return 1;
    }
    return [[[self.mainModel.awardsIndex safeObjectAtIndex:section] awardsIndexParams] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == self.sectionCount) {
        WFRewardDetailArriveTableViewCell *cell = [WFRewardDetailArriveTableViewCell cellWithTableView:tableView];
        cell.model = self.mainModel;
        return cell;
    }
    WFRewardDetailIndexTableViewCell *cell = [WFRewardDetailIndexTableViewCell cellWithTableView:tableView indexPath:indexPath dataCount:self.sectionCount];
    cell.model = [[[self.mainModel.awardsIndex safeObjectAtIndex:indexPath.section] awardsIndexParams] safeObjectAtIndex:indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section != self.sectionCount) {
        WFRewardDetailSectionView *sectionView = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFRewardDetailSectionView" owner:nil options:nil] firstObject];
        return sectionView;
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == self.sectionCount ? CGFLOAT_MIN : 40.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.0f;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    self.titleLbl.alpha = offset / 100;
}

#pragma mark get set
/// navBarView
- (UIView *)navBarView {
    if (!_navBarView) {
        _navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, NavHeight)];
        _navBarView.backgroundColor = NavColor;
        [_navBarView addSubview:self.backBtn];
        [_navBarView addSubview:self.lookBtn];
        [_navBarView addSubview:self.titleLbl];
    }
    return _navBarView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navBarView.maxY, ScreenWidth, ScreenHeight-self.navBarView.maxY-SafeAreaBottom) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.estimatedRowHeight = 80.0f;
        _tableView.estimatedSectionFooterHeight = 0.0f;
        _tableView.estimatedSectionHeaderHeight = 0.0f;
        _tableView.tableHeaderView = self.headView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = 0;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

/// headView
- (WFRewardDetailHeadView *)headView {
    if (!_headView) {
        _headView = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFRewardDetailHeadView" owner:nil options:nil] firstObject];
        _headView.bLine.backgroundColor = NavColor;
        _headView.model = self.mainModel;
    }
    return _headView;
}

/// 返回按钮
- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(10, TopSpace, 44.0f, 44.0f);
        [_backBtn addTarget:self action:@selector(backBtn:) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -15,0, 0);
        [_backBtn setImage:[UIImage imageNamed:@"white_back"] forState:0];
    }
    return _backBtn;
}

/// 查看明细
- (UIButton *)lookBtn {
    if (!_lookBtn) {
        _lookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _lookBtn.frame = CGRectMake(ScreenWidth- 70, TopSpace, 60, 44.0f);
        [_lookBtn setTitle:@"奖励明细" forState:0];
        [_lookBtn addTarget:self action:@selector(lookBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _lookBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_lookBtn setTitleColor:UIColor.whiteColor forState:0];
        _lookBtn.hidden = YES;
    }
    return _lookBtn;
}

/// title
- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.backBtn.width + 15, TopSpace, ScreenWidth-self.backBtn.width - self.lookBtn.width - 30, 44.0f)];
        _titleLbl.textColor = UIColor.whiteColor;
        _titleLbl.font = [UIFont boldSystemFontOfSize:16];
        _titleLbl.alpha = 0;
        _titleLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLbl;
}

@end
