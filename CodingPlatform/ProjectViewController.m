//
//  ProjectViewController.m
//  CodingPlatform
//
//  Created by Jerry on 15/12/1.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "ProjectViewController.h"

@interface ProjectViewController ()

@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加导航条上的左右item
    [self addItemWithImage:@"search_Nav" target:self action:@selector(searchHandler) isLeft:YES];
    [self addItemWithImage:@"addBtn_Nav" target:self action:@selector(addHandler) isLeft:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchHandler
{
    NSLog(@"点击搜索按钮");
}

- (void)addHandler
{
    NSLog(@"点击添加按钮");
}

@end
