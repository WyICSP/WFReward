//
//  WFRewardListModel.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/28.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFRewardListModel : NSObject
@property (nonatomic, copy) NSString *awardsConfigId;
/// 奖励
@property (nonatomic, copy) NSString *awardsTips;
@property (nonatomic, assign) NSInteger awardsType;
@property (nonatomic, assign) NSInteger configType;
@property (nonatomic, copy) NSString *endTime;
@property (nonatomic, copy) NSString *startTime;
/// 奖励名称
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger roundNum;
@property (nonatomic, assign) NSInteger roundType;
/// 考核周期
@property (nonatomic, copy) NSString *roundTips;
/// 起止时间
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) NSInteger stopped;
@property (nonatomic, assign) NSInteger value;
@end

@interface WFCrashRewardListModel : NSObject
/// 奖励完成id
@property (nonatomic, copy) NSString *awardsFinalId;
/// 奖金
@property (nonatomic, strong) NSNumber *awardsMoney;
/// 奖励名称
@property (nonatomic, copy) NSString *awardsName;
/// 结算时间
@property (nonatomic, copy) NSString *grantTime;
/// 结算后金额
@property (nonatomic, strong) NSNumber *settleMoney;

@end

@interface WFCrashRewardHeadModel : NSObject
/// 奖金
@property (nonatomic, strong) NSNumber *awardsMoney;
/// 活动奖金
@property (nonatomic, strong) NSNumber *activityMoney;
@end



NS_ASSUME_NONNULL_END
