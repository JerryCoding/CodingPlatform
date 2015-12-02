//
//  TweetViewController.m
//  CodingPlatform
//
//  Created by Jerry on 15/12/1.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "TweetViewController.h"

@interface TweetViewController ()

@end

@implementation TweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加导航条上的左右item
    [self addItemWithImage:@"search_Nav" target:self action:@selector(searchHandler) isLeft:YES];
    [self addItemWithImage:@"tweetBtn_Nav" target:self action:@selector(tweetHandler) isLeft:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchHandler
{
    NSLog(@"点击搜索按钮");
}

- (void)tweetHandler
{
    NSLog(@"点击冒泡按钮");
}

@end
