//
//  WFRewardDetailSectionView.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/23.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardDetailSectionView.h"
#import "WKConfig.h"

@implementation WFRewardDetailSectionView

- (void)awakeFromNib {
    [super awakeFromNib];
    SKViewsBorder(self.contentsView, 0, 0.5, UIColorFromRGB(0xE4E4E4));
}

@end
