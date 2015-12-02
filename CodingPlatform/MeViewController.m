//
//  MeViewController.m
//  CodingPlatform
//
//  Created by Jerry on 15/12/1.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加导航条上的左右item
    [self addItemWithImage:@"addUserBtn_Nav" target:self action:@selector(addUserHandler) isLeft:YES];
    [self addItemWithImage:@"settingBtn_Nav" target:self action:@selector(settingHandler) isLeft:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addUserHandler
{
    NSLog(@"点击添加用户按钮");
}

- (void)settingHandler
{
    NSLog(@"点击设置按钮");
}

@end
