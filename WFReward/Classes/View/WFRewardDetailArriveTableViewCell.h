//
//  WFRewardDetailArriveTableViewCell.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/23.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WFRewardCenterDetailModel;

NS_ASSUME_NONNULL_BEGIN

@interface WFRewardDetailArriveTableViewCell : UITableViewCell
/// model
@property (nonatomic, strong) WFRewardCenterDetailModel *model;
/// title
@property (weak, nonatomic) IBOutlet UILabel *taskLbl;
/// 奖励发放
@property (weak, nonatomic) IBOutlet UILabel *rawardisLbl;
/**初始化*/
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
