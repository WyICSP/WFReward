//
//  WFRewardCenterDetailModel.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/29.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardCenterDetailModel.h"
#import <MJExtension/MJExtension.h>



@implementation WFRewardCenterDetailModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"awardsIndex":@"WFRewardAwardsIndexModel"};
}


@end

@implementation WFRewardAwardsIndexModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"awardsIndexParams":@"WFRewardIndexItemModel"};
}

@end

@implementation WFRewardIndexItemModel

@end
