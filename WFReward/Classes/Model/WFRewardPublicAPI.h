//
//  WFRewardPublicAPI.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/25.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFRewardPublicAPI : NSObject

/// 打开授信充值页面
/// @param controller 上一个页面
+ (void)openRewardCtrlWithController:(UIViewController *)controller;


/// 打开奖励收入
/// @param contrller 上一个页面
/// @param type 0 奖励 1 活动
+ (void)openActivityOrRewardCtrlWithParams:(NSArray *)params;

@end

NS_ASSUME_NONNULL_END
