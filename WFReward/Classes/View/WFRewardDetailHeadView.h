//
//  WFRewardDetailHeadView.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/22.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WFRewardCenterDetailModel;

NS_ASSUME_NONNULL_BEGIN

@interface WFRewardDetailHeadView : UIView
/// 背景
@property (weak, nonatomic) IBOutlet UILabel *bLine;
/// title
@property (weak, nonatomic) IBOutlet UILabel *title;
///  起始日期
@property (weak, nonatomic) IBOutlet UILabel *startTime;
/// 考核时间
//@property (weak, nonatomic) IBOutlet UILabel *kaoTime;
/// 结算时间
@property (weak, nonatomic) IBOutlet UILabel *settleTime;
/// 赋值
@property (nonatomic, strong) WFRewardCenterDetailModel *model;
@end

NS_ASSUME_NONNULL_END
