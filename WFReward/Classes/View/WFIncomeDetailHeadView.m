//
//  WFIncomeDetailHeadView.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFIncomeDetailHeadView.h"
#import "WFRewardDetailModel.h"

@implementation WFIncomeDetailHeadView

- (void)setModel:(WFRewardDetailModel *)model {
    self.title.text = model.awardsName.length == 0 ? model.groupName : model.awardsName;
    self.money.text = [NSString stringWithFormat:@"+%@",@(model.awardsMoney.floatValue/100.0f)];
    self.status.text = model.awardsStatus ? @"交易成功" : @"交易失败";
}

@end
