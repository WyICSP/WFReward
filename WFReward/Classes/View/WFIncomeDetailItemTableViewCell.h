//
//  WFIncomeDetailItemTableViewCell.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WFRewardDetailSrttingModel;

NS_ASSUME_NONNULL_BEGIN

@interface WFIncomeDetailItemTableViewCell : UITableViewCell
/// title
@property (weak, nonatomic) IBOutlet UILabel *title;
/// detail
@property (weak, nonatomic) IBOutlet UILabel *detailLbl;
/// 赋值
@property (nonatomic, strong) WFRewardDetailSrttingModel *models;
/**初始化*/
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
