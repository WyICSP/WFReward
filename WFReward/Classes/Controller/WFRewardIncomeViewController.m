//
//  WFRewardIncomeViewController.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardIncomeViewController.h"
#import "WFRewardIncomeTableViewCell.h"
#import "WFRewardIncomeHeadView.h"
#import "WFRewardIncomeDetailViewController.h"
#import "WFRewardDataTool.h"
#import "WFRewardListModel.h"
#import "NSString+Regular.h"
#import "MJRefresh.h"
#import "WKConfig.h"

@interface WFRewardIncomeViewController ()<UITableViewDataSource,UITableViewDelegate>
/// tableView
@property (nonatomic, strong, nullable) UITableView *tableView;
/// headView
@property (nonatomic, strong, nullable) WFRewardIncomeHeadView *headView;
/// 数据源
@property (nonatomic, strong, nullable) NSMutableArray <WFCrashRewardListModel *> *mainModels;
/// 头部数据
@property (nonatomic, strong, nullable) WFCrashRewardHeadModel *hModel;
/// 页面
@property (nonatomic, assign) NSInteger pageNo;
/// 2:奖励金 3:活动金
@property (nonatomic, assign) NSInteger awardType;
@end

@implementation WFRewardIncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

#pragma mark 私有方法
- (void)setUI {
    self.title = self.type == 0 ? @"奖励收入" : @"活动金收入";
    //2:奖励金 3:活动金
    self.awardType = self.type == 0 ? 2 : 3;
    // 页码
    self.pageNo = 1;
    // 获取数据
    [self getCrashRewardList];
}

/// 获取数据
- (void)getCrashRewardList {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params safeSetObject:@(self.awardType) forKey:@"awardType"];
    [params safeSetObject:@(10) forKey:@"pageSize"];
    [params safeSetObject:@(self.pageNo) forKey:@"pageNo"];
    @weakify(self)
    [WFRewardDataTool getCrashRewardListWithParams:params resultBlock:^(NSArray<WFCrashRewardListModel *> * _Nonnull models, WFCrashRewardHeadModel * _Nonnull hModel) {
        @strongify(self)
        [self requestVipDataSuccessWith:models hModel:hModel];
    } failBlock:^{
        @strongify(self)
        [self.tableView.mj_footer endRefreshing];
    }];
}

- (void)requestVipDataSuccessWith:(NSArray<WFCrashRewardListModel *> * _Nonnull)models
                           hModel:(WFCrashRewardHeadModel *_Nonnull)hmodel {
    self.hModel = hmodel;
    // 结束刷新
    [self.tableView.mj_footer endRefreshing];
    //将获取的数据添加到数组中
    if (models.count != 0) [self.mainModels addObjectsFromArray:models];
    
    //如果没有数据隐藏 footer
    self.tableView.mj_footer.hidden = self.mainModels.count < 10 ? YES : NO;
    
    if (models.count == 0 & self.mainModels.count != 0 & self.pageNo != 1) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    } else {
        [self.tableView.mj_footer resetNoMoreData];
    }
    [self.tableView reloadData];
}

#pragma mark UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mainModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WFRewardIncomeTableViewCell *cell = [WFRewardIncomeTableViewCell cellWithTableView:tableView];
    cell.models = [self.mainModels safeObjectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WFRewardIncomeDetailViewController *detail = [[WFRewardIncomeDetailViewController alloc] init];
    detail.awardsFinalId = [[self.mainModels safeObjectAtIndex:indexPath.row] awardsFinalId];
    [self.navigationController pushViewController:detail animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = UIColorFromRGB(0xE4E4E4);
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.5f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}


#pragma mark get set
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-SafeAreaBottom-NavHeight) style:UITableViewStyleGrouped];
        _tableView.rowHeight = 67.0f;
        _tableView.estimatedRowHeight = 0.0f;
        _tableView.estimatedSectionFooterHeight = 0.0f;
        _tableView.estimatedSectionHeaderHeight = 0.0f;
        _tableView.tableHeaderView = self.headView;
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = 0;
        @weakify(self)
        _tableView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
            @strongify(self)
            self.pageNo ++;
            [self getCrashRewardList];
        }];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

/// headView
- (WFRewardIncomeHeadView *)headView {
    if (!_headView) {
        _headView = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFRewardIncomeHeadView" owner:nil options:nil] firstObject];
        _headView.frame = CGRectMake(0, 0, ScreenWidth, KHeight(147.0f)+10);
        if (self.type == 0) {
            //奖励金
            NSString *awardsMoney = [NSString stringWithFormat:@"%.3f",[NSString decimalPriceWithDouble:self.hModel.awardsMoney.doubleValue/1000]];
            _headView.money.text = awardsMoney;
            _headView.title.text = @"奖励收入(元)";
        }else {
            //活动金
            NSString *activityMoney = [NSString stringWithFormat:@"%.3f",[NSString decimalPriceWithDouble:self.hModel.activityMoney.doubleValue/1000]];
            _headView.money.text = activityMoney;
            _headView.title.text = @"活动金收入(元)";
        }
    }
    return _headView;
}

- (NSMutableArray<WFCrashRewardListModel *> *)mainModels {
    if (!_mainModels) {
        _mainModels = [[NSMutableArray alloc] init];
    }
    return _mainModels;
}


@end
