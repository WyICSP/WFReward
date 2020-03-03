//
//  WFViewController.m
//  WFReward
//
//  Created by wyxlh on 02/21/2020.
//  Copyright (c) 2020 wyxlh. All rights reserved.
//

#import "WFViewController.h"
#import "WFRewardBaseViewController.h"
#import "WFRewardIncomeViewController.h"
#import "UserData.h"
#import "YFToast.h"

@interface WFViewController ()

@end

@implementation WFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UserData userInfo:nil];
    [YFToast showMessage:@"退出成功, 请重启 APP" inView:self.view];
}

@end
