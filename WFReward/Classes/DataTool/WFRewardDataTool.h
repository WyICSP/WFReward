//
//  WFRewardDataTool.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/28.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WFRewardListModel;
@class WFCrashRewardListModel;
@class WFCrashRewardHeadModel;
@class WFRewardDetailModel;
@class WFRewardCenterDetailModel;

NS_ASSUME_NONNULL_BEGIN

@interface WFRewardDataTool : NSObject
/// 获取奖励列表
/// @param params 参数
/// @param resultBlock 返回结果
/// @param failBlock 返回失败
+ (void)getRewardListWithParams:(NSDictionary *)params
                    resultBlock:(void(^)(NSArray <WFRewardListModel *> *models))resultBlock
                      failBlock:(void(^)(void))failBlock;

/// 获取奖励明细
/// @param params 参数
/// @param resultBlock 返回结果
+ (void)getRewardDetailWithParams:(NSDictionary *)params
                      resultBlock:(void(^)(WFRewardCenterDetailModel *models))resultBlock;

/// 获取现金奖励列表
/// @param params 参数
/// @param resultBlock 返回结果
/// @param failBlock 返回失败
+ (void)getCrashRewardListWithParams:(NSDictionary *)params
                         resultBlock:(void(^)(NSArray <WFCrashRewardListModel *> *models, WFCrashRewardHeadModel *hModel))resultBlock
                           failBlock:(void(^)(void))failBlock;

/// 获取现金奖励明细 不是详情
/// @param params 参数
/// @param resultBlock 返回结果
+ (void)getCrashRewardDetailWithParams:(NSDictionary *)params
                           resultBlock:(void(^)(WFRewardDetailModel *models))resultBlock;
@end

NS_ASSUME_NONNULL_END
