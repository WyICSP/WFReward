//
//  WFRewardChildTableViewCell.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WFRewardListModel;

NS_ASSUME_NONNULL_BEGIN

@interface WFRewardChildTableViewCell : UITableViewCell
/// contentsView
@property (weak, nonatomic) IBOutlet UIView *contentsView;
/// title
@property (weak, nonatomic) IBOutlet UILabel *title;
/// 奖金
@property (weak, nonatomic) IBOutlet UILabel *bones;
/// 开始时间
@property (weak, nonatomic) IBOutlet UILabel *startTime;
/// 考核时间
//@property (weak, nonatomic) IBOutlet UILabel *assessTime;
/// model
@property (nonatomic, strong) WFRewardListModel *model;
/**初始化*/
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
