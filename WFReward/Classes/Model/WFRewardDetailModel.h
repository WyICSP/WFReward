//
//  WFRewardDetailModel.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/28.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFRewardDetailModel : NSObject
/// 奖励类型（1-片区营业额，2-现金，3-活动金，4-授信台数）
@property (nonatomic, assign) NSInteger awardType;
/// 奖励完成id
@property (nonatomic, copy) NSString *awardsFinalId;
/// 奖励说明
@property (nonatomic, copy) NSString *explainValue;
/// 完成营业额(只有片区营业额类型才有)
@property (nonatomic, copy) NSString *finalValue;
/// 结算时间
@property (nonatomic, copy) NSString *grantTime;
/// 片区名称
@property (nonatomic, copy) NSString *groupName;
/// 奖励名称
@property (nonatomic, copy) NSString *awardsName;
/// 奖励金额
@property (nonatomic, strong) NSNumber *awardsMoney;
/// 0:交易失败 1:交易成功
@property (nonatomic, assign) BOOL awardsStatus;
/// 结算单号
@property (nonatomic, copy) NSString *sn;
/// 奖励百分比(只有片区营业额类型才有)
@property (nonatomic, copy) NSString *value;
/// 客服 url
@property (nonatomic, copy) NSString *jumpUrl;
/// 数据
@property (nonatomic, strong) NSArray *awardsDetailList;
@end

@interface WFRewardDetailSrttingModel : NSObject
/// name
@property (nonatomic, copy) NSString *name;
/// 值
@property (nonatomic, copy) NSString *value;
@end

NS_ASSUME_NONNULL_END
