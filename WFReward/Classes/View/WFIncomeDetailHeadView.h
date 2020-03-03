//
//  WFIncomeDetailHeadView.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WFRewardDetailModel;

NS_ASSUME_NONNULL_BEGIN

@interface WFIncomeDetailHeadView : UIView
/// title
@property (weak, nonatomic) IBOutlet UILabel *title;
/// 钱
@property (weak, nonatomic) IBOutlet UILabel *money;
/// 状态
@property (weak, nonatomic) IBOutlet UILabel *status;
/// 赋值
@property (nonatomic, strong) WFRewardDetailModel *model;
@end

NS_ASSUME_NONNULL_END
