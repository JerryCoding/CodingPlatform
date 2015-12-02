//
//  MessageViewController.m
//  CodingPlatform
//
//  Created by Jerry on 15/12/1.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加导航条上的右侧item
    [self addItemWithImage:@"tweetBtn_Nav" target:self action:@selector(tweetHandler) isLeft:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tweetHandler
{
    NSLog(@"点击冒泡按钮");
}

@end
