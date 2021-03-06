//
//  WFRewardIncomeTableViewCell.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardIncomeTableViewCell.h"
#import "WFRewardListModel.h"
#import "NSString+Regular.h"

@implementation WFRewardIncomeTableViewCell

static NSString *const cellId = @"WFRewardIncomeTableViewCell";

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    WFRewardIncomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFRewardIncomeTableViewCell" owner:nil options:nil] firstObject];
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

- (void)setModels:(WFCrashRewardListModel *)models {
    self.title.text = models.awardsName;
    
    NSString *awardsMoney = [NSString stringWithFormat:@"%.3f",[NSString decimalPriceWithDouble:models.awardsMoney.doubleValue/1000]];
    self.money.text = awardsMoney;
    
    NSString *settleMoney = [NSString stringWithFormat:@"%.3f",[NSString decimalPriceWithDouble:models.settleMoney.doubleValue/1000]];
    self.totalPrice.text = settleMoney;
    
    self.time.text = [NSString stringWithFormat:@"结算时间: %@",models.grantTime];
}

@end
