//
//  WFRewardChildTableViewCell.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardChildTableViewCell.h"
#import "WFRewardListModel.h"
#import "WKConfig.h"

@implementation WFRewardChildTableViewCell

static NSString *const cellId = @"WFRewardChildTableViewCell";

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    WFRewardChildTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFRewardChildTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    self.contentsView.layer.cornerRadius = 10.0f;
    self.bones.layer.borderWidth = 0.5f;
    self.bones.layer.borderColor = UIColorFromRGB(0xF78556).CGColor;
    self.bones.layer.cornerRadius = 2.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setModel:(WFRewardListModel *)model {
    self.title.text = [NSString stringWithFormat:@"%@ ",model.name];
    self.bones.text = [NSString stringWithFormat:@"  %@  ",model.awardsTips];
    self.startTime.text = [NSString stringWithFormat:@"起止日期: %@-%@",model.startTime,model.endTime];
//    self.assessTime.text = [NSString stringWithFormat:@"考核周期: %@",model.roundTips];
}

@end
