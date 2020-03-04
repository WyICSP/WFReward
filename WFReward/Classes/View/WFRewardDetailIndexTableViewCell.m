//
//  WFRewardDetailIndexTableViewCell.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/22.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardDetailIndexTableViewCell.h"
#import "WFRewardCenterDetailModel.h"
#import "AttributedLbl.h"

@implementation WFRewardDetailIndexTableViewCell

static NSString *const cellId = @"WFRewardDetailIndexTableViewCell";

+ (instancetype)cellWithTableView:(UITableView *)tableView
                        indexPath:(NSIndexPath *)indexPath
                        dataCount:(NSInteger)dataCount {
    WFRewardDetailIndexTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFRewardDetailIndexTableViewCell" owner:nil options:nil] firstObject];
    }
    cell.index = indexPath.row;
    if (dataCount > 1 && indexPath.row == dataCount - 1) {
        cell.bottomLine.hidden = NO;
    }else if (dataCount == 1){
        cell.bottomLine.hidden = NO;
    }else {
        cell.bottomLine.hidden = YES;
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

- (void)setModel:(WFRewardIndexItemModel *)model {
    self.currentData.text = model.currentValue;
    self.rate.text = model.awardsCheckTips;
//    // 如果是第一条数据 并且已经完成
//    if (self.index == 0 && model.awardsCheckStatus) {
//        self.overImg.hidden = NO;
//    }else {
//        self.overImg.hidden = YES;
//    }
}

- (void)bindToCellWithModel:(WFRewardIndexItemModel *)model
          awardsCheckStatus:(BOOL)awardsCheckStatus {
    self.currentData.text = model.currentValue;
    self.rate.text = model.awardsCheckTips;
    self.currentTitle.text = model.currentTitle;
    
    if (self.index == 0 && awardsCheckStatus) {
        self.overImg.hidden = NO;
    }else {
        self.overImg.hidden = YES;
    }
}

@end
