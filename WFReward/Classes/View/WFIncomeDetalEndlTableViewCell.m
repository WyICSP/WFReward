//
//  WFIncomeDetalEndlTableViewCell.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFIncomeDetalEndlTableViewCell.h"
#import "WFRewardDetailModel.h"

@implementation WFIncomeDetalEndlTableViewCell

static NSString *const cellId = @"WFIncomeDetalEndlTableViewCell";

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    WFIncomeDetalEndlTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFIncomeDetalEndlTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(WFRewardDetailModel *)model {
    self.time.text = model.grantTime;
    self.sn.text = model.sn;
}

@end
