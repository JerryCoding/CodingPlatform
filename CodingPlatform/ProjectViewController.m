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

- (void)viewWillLayoutSubviews
{
    //启动动画设置
    [self startAnimate];
}

- (void)startAnimate
{
    __block CGRect frame = [UIScreen mainScreen].bounds;
    UIImageView *launch = [[UIImageView alloc] initWithFrame:frame];
    NSString *launchFile = [[NSBundle mainBundle] pathForResource:@"LaunchImage-700-568h@2x" ofType:@"png"];
    launch.image = [[UIImage alloc] initWithContentsOfFile:launchFile];
    UIImageView *view = [[UIImageView alloc] initWithFrame:frame];
    NSString *file = [[NSBundle mainBundle] pathForResource:@"STARTIMAGE" ofType:@"jpg"];
    view.image = [[UIImage alloc] initWithContentsOfFile:file];

    NSString *logoFile = [[NSBundle mainBundle] pathForResource:@"logo_coding_top@2x" ofType:@"png"];
    UIImage *logoImage = [[UIImage alloc] initWithContentsOfFile:logoFile];
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2-logoImage.size.width/3.32, 95, logoImage.size.width/1.66, logoImage.size.height/1.66)];
    
    logo.image = logoImage;
    [self.view.window addSubview:view];
    [view addSubview:logo];
    [self.view.window addSubview:launch];
    //设置动画
    [UIView animateWithDuration:2 animations:^{
        launch.alpha = 0.0;
    } completion:^(BOOL finished) {
        [launch removeFromSuperview];
        [UIView animateWithDuration:1 animations:^{
            frame.origin.x -= frame.size.width;
            view.frame = frame;
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
    }];
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
