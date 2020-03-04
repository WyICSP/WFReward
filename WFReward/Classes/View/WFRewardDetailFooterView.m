//
//  WFRewardDetailFooterView.m
//  AFNetworking
//
//  Created by 王宇 on 2020/3/4.
//

#import "WFRewardDetailFooterView.h"

@implementation WFRewardDetailFooterView

- (IBAction)clickBtn:(id)sender {
    !self.clickBtnBlock ? : self.clickBtnBlock();
}

@end
