//
//  WFIncomeDetalEndlTableViewCell.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WFRewardDetailModel;

NS_ASSUME_NONNULL_BEGIN

@interface WFIncomeDetalEndlTableViewCell : UITableViewCell
/// 结束时间
@property (weak, nonatomic) IBOutlet UILabel *time;
/// 订单
@property (weak, nonatomic) IBOutlet UILabel *sn;
/// 赋值
@property (nonatomic, strong) WFRewardDetailModel *model;
/**初始化*/
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
