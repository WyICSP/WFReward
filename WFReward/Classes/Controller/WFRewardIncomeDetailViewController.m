//
//  WFRewardIncomeDetailViewController.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardIncomeDetailViewController.h"
#import "WFIncomeDetailServiceTableViewCell.h"
#import "WFIncomeDetailItemTableViewCell.h"
#import "WFIncomeDetalEndlTableViewCell.h"
#import "WFBaseWebViewController.h"
#import "WFIncomeDetailHeadView.h"
#import "WFRewardDetailModel.h"
#import "WFRewardDataTool.h"
#import "WKConfig.h"

@interface WFRewardIncomeDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
/// tableView
@property (nonatomic, strong, nullable) UITableView *tableView;
/// headView
@property (nonatomic, strong, nullable) WFIncomeDetailHeadView *headView;
/// 数据源
@property (nonatomic, strong, nullable) WFRewardDetailModel *mainModel;
@end

@implementation WFRewardIncomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

#pragma mark 奖励明细
- (void)setUI {
    self.title = @"奖励明细";
    // 获取数据
    [self getRewardDetail];
}

/// 获取数据
- (void)getRewardDetail {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params safeSetObject:self.awardsFinalId forKey:@"awardsFinalId"];
    @weakify(self)
    [WFRewardDataTool getCrashRewardDetailWithParams:params resultBlock:^(WFRewardDetailModel * _Nonnull models) {
        @strongify(self)
        self.mainModel = models;
        [self.tableView reloadData];
    }];
}

#pragma mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? self.mainModel.awardsDetailList.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        WFIncomeDetailItemTableViewCell *cell = [WFIncomeDetailItemTableViewCell cellWithTableView:tableView];
        cell.models = [self.mainModel.awardsDetailList safeObjectAtIndex:indexPath.row];
        return cell;
    }else if (indexPath.section == 1) {
        WFIncomeDetalEndlTableViewCell *cell = [WFIncomeDetalEndlTableViewCell cellWithTableView:tableView];
        cell.model = self.mainModel;
        return cell;
    }
    WFIncomeDetailServiceTableViewCell *cell = [WFIncomeDetailServiceTableViewCell cellWithTableView:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == 1 ? 92.0f : 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 2 ? 10.0f : CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColorFromRGB(0xF5F5F5);
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        WFBaseWebViewController *web = [[WFBaseWebViewController alloc] init];
        web.urlString = self.mainModel.jumpUrl;
        web.progressColor = NavColor;
        [self.navigationController pushViewController:web animated:YES];
    }
}

#pragma mark get set
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-SafeAreaBottom-NavHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor = self.view.backgroundColor = UIColorFromRGB(0xF5F5F5);
        _tableView.estimatedRowHeight = 0.0f;
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

- (WFIncomeDetailHeadView *)headView {
    if (!_headView) {
        _headView = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFIncomeDetailHeadView" owner:nil options:nil] firstObject];
        _headView.model = self.mainModel;
    }
    return _headView;
}

@end
