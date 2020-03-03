//
//  WFRewardDetailArriveTableViewCell.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/23.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardDetailArriveTableViewCell.h"
#import "WFRewardCenterDetailModel.h"

@implementation WFRewardDetailArriveTableViewCell

static NSString *const cellId = @"WFRewardDetailArriveTableViewCell";

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    WFRewardDetailArriveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFRewardDetailArriveTableViewCell" owner:nil options:nil] firstObject];
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

- (void)setModel:(WFRewardCenterDetailModel *)model {
    self.rawardisLbl.text = model.strategy;
    // 解码
    NSString *base = [self dencode:model.strategy];
    // 设置富文本
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithData:[base dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.rawardisLbl.attributedText = attStr;
}

/// base64 解码
/// @param base64String 后台传的值
- (NSString *)dencode:(NSString *)base64String {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

@end
