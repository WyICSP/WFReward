//
//  WFRewardChildViewController.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardChildViewController.h"
#import "WFRewardChildTableViewCell.h"
#import "WFRewardDetailViewController.h"
#import "UITableView+YFExtension.h"
#import "WFRewardDataTool.h"
#import "WFRewardListModel.h"
#import "MJRefresh.h"
#import "WKConfig.h"

@interface WFRewardChildViewController ()<UITableViewDelegate,UITableViewDataSource>
/// tableView
@property (nonatomic, strong, nullable) UITableView *tableView;
/// 数据源
@property (nonatomic, strong, nullable) NSMutableArray <WFRewardListModel *> *mainModels;
/// 页面
@property (nonatomic, assign) NSInteger pageNo;

@end

@implementation WFRewardChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
}

- (void)setUI {
    self.pageNo = 1;
    [self getRewardList];
}

/// 获取数据
- (void)getRewardList {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params safeSetObject:@(self.status) forKey:@"status"];
    [params safeSetObject:@(10) forKey:@"pageSize"];
    [params safeSetObject:@(self.pageNo) forKey:@"pageNo"];
    @weakify(self)
    [WFRewardDataTool getRewardListWithParams:params resultBlock:^(NSArray<WFRewardListModel *> * _Nonnull models) {
        @strongify(self)
        [self requestVipDataSuccessWith:models];
    } failBlock:^{
        @strongify(self)
        [self.tableView.mj_footer endRefreshing];
    }];
}

- (void)requestVipDataSuccessWith:(NSArray<WFRewardListModel *> * _Nonnull)models {
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
    
    [self.tableView isShowEmptyView:self.mainModels.count == 0];
    
    [self.tableView reloadData];
}

#pragma mark UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.mainModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WFRewardChildTableViewCell *cell = [WFRewardChildTableViewCell cellWithTableView:tableView];
    cell.model = [self.mainModels safeObjectAtIndex:indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WFRewardDetailViewController *detail = [[WFRewardDetailViewController alloc] init];
    detail.awardsConfigId = [[self.mainModels safeObjectAtIndex:indexPath.section] awardsConfigId];
    [self.parentViewController.navigationController pushViewController:detail animated:YES];
}

#pragma mark get set
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-SafeAreaBottom-44.0f-NavHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = UIColorFromRGB(0xF5F5F5);
        _tableView.estimatedRowHeight = 112.0f;
        _tableView.estimatedSectionFooterHeight = 0.0f;
        _tableView.estimatedSectionHeaderHeight = 0.0f;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = 0;
        [_tableView addEmptyView];
        @weakify(self)
        _tableView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
            @strongify(self)
            self.pageNo ++;
            [self getRewardList];
        }];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray<WFRewardListModel *> *)mainModels {
    if (!_mainModels) {
        _mainModels = [[NSMutableArray alloc] init];
    }
    return _mainModels;
}

@end
