//
//  WFRewardCenterDetailModel.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/29.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFRewardCenterDetailModel : NSObject
/// 奖励id
@property (nonatomic, copy) NSString *awardsConfigId;
/// 奖励名称
@property (nonatomic, copy) NSString *name;
/// 考核周期
@property (nonatomic, copy) NSString *roundTips;
/// 结算说明
@property (nonatomic, copy) NSString *settleExplain;
/// 奖励攻略
@property (nonatomic, copy) NSString *strategy;
/// 起止时间
@property (nonatomic, copy) NSString *time;
/// 奖励数据
@property (nonatomic, strong) NSArray *awardsIndex;
@end

@interface WFRewardAwardsIndexModel : NSObject
/// 奖励指标
@property (nonatomic, strong) NSArray *awardsIndexParams;
/// 奖励标签
@property (nonatomic, copy) NSString *awardsTips;
/// 是否完成
@property (nonatomic, assign) BOOL awardsCheckStatus;
/// 奖励标签
@property (nonatomic, copy) NSString *awardsFinalId;
@end

@interface WFRewardIndexItemModel : NSObject
/// 考核指标
@property (nonatomic, copy) NSString *awardsCheckTips;
/// 当前值
@property (nonatomic, copy) NSString *currentValue;

@end

NS_ASSUME_NONNULL_END
