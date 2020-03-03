//
//  WFRewardChildViewController.h
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/21.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import <WFKitMain/YFBaseViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFRewardChildViewController : YFBaseViewController
/// 0:进行中 1:已完成 2:即将开始
@property (nonatomic, assign) NSInteger status;
@end

NS_ASSUME_NONNULL_END
