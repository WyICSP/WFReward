//
//  WFRewardDetailHeadView.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/22.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardDetailHeadView.h"
#import "WFRewardCenterDetailModel.h"

@implementation WFRewardDetailHeadView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.title.adjustsFontSizeToFitWidth = YES;
}

- (void)setModel:(WFRewardCenterDetailModel *)model {
    self.title.text = model.name;
    self.startTime.text = model.time;
//    self.kaoTime.text = model.roundTips;
    self.settleTime.text = model.settleExplain;
}

@end
