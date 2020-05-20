//
//  WFIncomeDetailHeadView.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFIncomeDetailHeadView.h"
#import "WFRewardDetailModel.h"
#import "NSString+Regular.h"

@implementation WFIncomeDetailHeadView

- (void)setModel:(WFRewardDetailModel *)model {
    self.title.text = model.awardsName.length == 0 ? model.groupName : model.awardsName;
    
    NSString *awardsMoney = [NSString stringWithFormat:@"%.3f",[NSString decimalPriceWithDouble:model.awardsMoney.doubleValue/1000]];
    self.money.text = [NSString stringWithFormat:@"+%@",awardsMoney];
    
    self.status.text = model.awardsStatus ? @"交易成功" : @"交易失败";
}

@end
