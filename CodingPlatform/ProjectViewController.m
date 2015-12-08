//
//  ProjectViewController.m
//  CodingPlatform
//
//  Created by Jerry on 15/12/1.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "ProjectViewController.h"

#define IndicateTag 100

@interface ProjectViewController ()

@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加导航条上的左右item
    [self addItemWithImage:@"search_Nav" target:self action:@selector(searchHandler) isLeft:YES];
    [self addItemWithImage:@"addBtn_Nav" target:self action:@selector(addHandler) isLeft:NO];
    //创建分段控制器
    [self createSegmentControl];
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

- (void)createSegmentControl
{
    UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:@[@"全部项目",@"我参与的",@"我创建的"]];
    sc.selectedSegmentIndex = 0;
    sc.frame = CGRectMake(0, 0, VIEW_WIDTH, 40);
    sc.tintColor = [UIColor clearColor];
    [sc setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    [sc setTitleTextAttributes:@{NSForegroundColorAttributeName:LightGreenColor,NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateSelected];
    [sc addTarget:self action:@selector(changePlate:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sc];
    //创建水平线
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 43.5, VIEW_WIDTH, 0.5)];
    label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
    //创建用于指示选中状态的label
    CGFloat width = VIEW_WIDTH/sc.numberOfSegments;
    UILabel *indicateLabel = [[UILabel alloc] initWithFrame:CGRectMake(width*sc.selectedSegmentIndex, 42, width, 2)];
    indicateLabel.backgroundColor = LightGreenColor;
    [self.view addSubview:indicateLabel];
    indicateLabel.tag = IndicateTag;
}

- (void)changePlate:(UISegmentedControl *)sc
{
    [UIView animateWithDuration:0.2 animations:^{
        UIView *view = [self.view viewWithTag:IndicateTag];
        CGRect frame = view.frame;
        frame.origin.x = sc.selectedSegmentIndex*frame.size.width;
        view.frame = frame;
    }];
}

@end
