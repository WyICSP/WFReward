//
//  WFRewardIncomeTableViewCell.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WFCrashRewardListModel;

NS_ASSUME_NONNULL_BEGIN

@interface WFRewardIncomeTableViewCell : UITableViewCell
/// title
@property (weak, nonatomic) IBOutlet UILabel *title;
/// money
@property (weak, nonatomic) IBOutlet UILabel *money;
/// 总价
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
/// 时间
@property (weak, nonatomic) IBOutlet UILabel *time;
/// 赋值
@property (nonatomic, strong) WFCrashRewardListModel *models;
/**初始化*/
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END

