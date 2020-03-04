//
//  WFRewardDetailIndexTableViewCell.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/22.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WFRewardIndexItemModel;

NS_ASSUME_NONNULL_BEGIN

@interface WFRewardDetailIndexTableViewCell : UITableViewCell
/// 底部分割线
@property (weak, nonatomic) IBOutlet UILabel *bottomLine;
/// 当前值
@property (weak, nonatomic) IBOutlet UILabel *currentData;
/// 使用率
@property (weak, nonatomic) IBOutlet UILabel *rate;
/// 完成图标
@property (weak, nonatomic) IBOutlet UIImageView *overImg;
/// 第几条数据
@property (nonatomic, assign) NSInteger index;
/// 赋值
@property (nonatomic, strong) WFRewardIndexItemModel *model;
/**初始化*/
+ (instancetype)cellWithTableView:(UITableView *)tableView
                        indexPath:(NSIndexPath *)indexPath
                        dataCount:(NSInteger)dataCount;

/// 绑定数据
/// @param model 数据
/// @param awardsCheckStatus 显示状态
- (void)bindToCellWithModel:(WFRewardIndexItemModel *)model
          awardsCheckStatus:(BOOL)awardsCheckStatus;
@end

NS_ASSUME_NONNULL_END
