//
//  WFRewardPublicAPI.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/25.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardPublicAPI.h"
#import "WFRewardBaseViewController.h"
#import "WFRewardIncomeViewController.h"

@implementation WFRewardPublicAPI

+ (void)openRewardCtrlWithController:(UIViewController *)controller {
    WFRewardBaseViewController *reward = [[WFRewardBaseViewController alloc] init];
    reward.hidesBottomBarWhenPushed = YES;
    [controller.navigationController pushViewController:reward animated:YES];
}

+ (void)openActivityOrRewardCtrlWithParams:(NSArray *)params {
    if (params.count != 0) {
        //获取UIViewController
        UIViewController *ctrl = params.firstObject;
        // 获取参数
        NSInteger type = [params.lastObject integerValue];
        //跳转逻辑
        WFRewardIncomeViewController *income = [[WFRewardIncomeViewController alloc] init];
        income.hidesBottomBarWhenPushed = YES;
        income.type = type;
        [ctrl.navigationController pushViewController:income animated:YES];
    }
    
}

@end
