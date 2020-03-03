//
//  WFRewardDataTool.m
//  WFReward_Example
//
//  Created by 王宇 on 2020/2/28.
//  Copyright © 2020 wyxlh. All rights reserved.
//

#import "WFRewardDataTool.h"
#import "WFRewardListModel.h"
#import <MJExtension/MJExtension.h>
#import "WFRewardDetailModel.h"
#import "WFRewardCenterDetailModel.h"
#import "WKConfig.h"
#import "WKRequest.h"
#import "WKSetting.h"

@implementation WFRewardDataTool

+ (void)getRewardListWithParams:(NSDictionary *)params
                    resultBlock:(void(^)(NSArray <WFRewardListModel *> *models))resultBlock
                      failBlock:(void(^)(void))failBlock {
    //接口地址
    NSString *path = [NSString stringWithFormat:@"%@yzc-app-partner-awards/yzc/v1/partner/awards/list",NEW_HOST_URL];
    [WKRequest getWithURLString:path parameters:params isShowHud:YES success:^(WKBaseModel *baseModel) {
        if (CODE_ZERO) {
            resultBlock([WFRewardListModel mj_objectArrayWithKeyValuesArray:[[baseModel.mDictionary safeJsonObjForKey:@"data"] safeJsonObjForKey:@"list"]]);
        }else {
            failBlock();
        }
    } failure:^(NSError *error) {
        failBlock();
    }];
}

/// 获取奖励明细 详情
/// @param params 参数
/// @param resultBlock 返回结果
+ (void)getRewardDetailWithParams:(NSDictionary *)params
                      resultBlock:(void(^)(WFRewardCenterDetailModel *models))resultBlock {
    //接口地址
    NSString *path = [NSString stringWithFormat:@"%@yzc-app-partner-awards/yzc/v1/partner/awards/detail",NEW_HOST_URL];
    [WKRequest getWithURLString:path parameters:params isShowHud:YES success:^(WKBaseModel *baseModel) {
        if (CODE_ZERO) {
            resultBlock([WFRewardCenterDetailModel mj_objectWithKeyValues:baseModel.data]);
        }else {
            [YFToast showMessage:baseModel.message inView:[[YFKeyWindow shareInstance] getCurrentVC].view];
        }
    } failure:^(NSError *error) {
        
    }];
}

/// 获取现金奖励列表
/// @param params 参数
/// @param resultBlock 返回结果
/// @param failBlock 返回失败
+ (void)getCrashRewardListWithParams:(NSDictionary *)params
                         resultBlock:(void(^)(NSArray <WFCrashRewardListModel *> *models, WFCrashRewardHeadModel *hModel))resultBlock
                           failBlock:(void(^)(void))failBlock {
    //接口地址
    NSString *path = [NSString stringWithFormat:@"%@yzc-app-partner-awards/yzc/v1/partner/awards/crash/get",NEW_HOST_URL];
    [WKRequest getWithURLString:path parameters:params isShowHud:YES success:^(WKBaseModel *baseModel) {
        if (CODE_ZERO) {
            //列表数据
            NSArray *list = [[[baseModel.mDictionary safeJsonObjForKey:@"data"] safeJsonObjForKey:@"pageInfo"] safeJsonObjForKey:@"list"];
            //返回数据
            resultBlock([WFCrashRewardListModel mj_objectArrayWithKeyValuesArray:list],[WFCrashRewardHeadModel mj_objectWithKeyValues:baseModel.data]);
        }else {
            failBlock();
        }
    } failure:^(NSError *error) {
        failBlock();
    }];
}

/// 获取现金奖励明细
/// @param params 参数
/// @param resultBlock 返回结果
+ (void)getCrashRewardDetailWithParams:(NSDictionary *)params
                           resultBlock:(void(^)(WFRewardDetailModel *models))resultBlock {
    //接口地址
    NSString *path = [NSString stringWithFormat:@"%@yzc-app-partner-awards/yzc/v1/partner/awards/crash/detail/get",NEW_HOST_URL];
    [WKRequest getWithURLString:path parameters:params isShowHud:YES success:^(WKBaseModel *baseModel) {
        if (CODE_ZERO) {
            resultBlock([WFRewardDetailModel mj_objectWithKeyValues:baseModel.data]);
        }else{
            [YFToast showMessage:baseModel.message inView:[[YFKeyWindow shareInstance] getCurrentVC].view];
        }
    } failure:^(NSError *error) {
    }];
}
@end
