//
//  JYTabBarController.m
//  CodingPlatform
//
//  Created by Jerry on 15/11/30.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "JYTabBarController.h"
#import "BaseViewController.h"

@interface JYTabBarController ()

@end

@implementation JYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置导航条的背景色
    [UINavigationBar appearance].barTintColor = BarTintColor;
    //设置导航条的显示风格，会影响状态栏的显示
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    //设置tabBar的背景色
    self.tabBar.backgroundColor = BottomColor;
    //设置tabBar选中标题色
    [UITabBar appearance].tintColor = BarTintColor;
    //创建子视图控制器
    [self createChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createChildViewControllers
{
    NSArray *infoAry = @[@[@"Project",@"项目",@"project"],
                        @[@"Task",@"任务",@"task"],
                        @[@"Tweet",@"冒泡",@"tweet"],
                        @[@"Message",@"消息",@"message"],
                        @[@"Me",@"我",@"me"]];
    for (NSArray *info in infoAry) {
        //拼接类名字符串
        NSString *className = [info[0] stringByAppendingString:@"ViewController"];
        //根据类名创建Class变量
        Class cls = NSClassFromString(className);
        //创建视图控制器
        BaseViewController *bvc = [[cls alloc] init];
        //根据视图控制器创建导航控制器
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:bvc];
        //设置导航控制的tabBarItem
        //设置标题
        nc.tabBarItem.title = info[1];
        //设置正常背景图
        NSString *normalImageName = [info[2] stringByAppendingString:@"_normal"];
        nc.tabBarItem.image = [[UIImage imageNamed:normalImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //设置选中背景图
        NSString *selectedImageName = [info[2] stringByAppendingString:@"_selected"];
        nc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //设置导航条为不透明
        nc.navigationBar.translucent = NO;
        //添加到子视图控制器数组
        [self addChildViewController:nc];
    }
}

@end
