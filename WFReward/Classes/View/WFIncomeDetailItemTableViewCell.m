//
//  WFIncomeDetailItemTableViewCell.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFIncomeDetailItemTableViewCell.h"
#import "WFRewardDetailModel.h"

@implementation WFIncomeDetailItemTableViewCell

static NSString *const cellId = @"WFIncomeDetailItemTableViewCell";

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    WFIncomeDetailItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFIncomeDetailItemTableViewCell" owner:nil options:nil] firstObject];
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

- (void)setModels:(WFRewardDetailSrttingModel *)models {
    self.title.text = models.name;
    self.detailLbl.text = models.value;
}

@end
