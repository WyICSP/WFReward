//
//  WFRewardDetailFooterView.h
//  AFNetworking
//
//  Created by 王宇 on 2020/3/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFRewardDetailFooterView : UIView
/// 点击事件
@property (nonatomic, copy) void(^clickBtnBlock)(void);
@end

NS_ASSUME_NONNULL_END
