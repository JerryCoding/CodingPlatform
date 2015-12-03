//
//  MeViewController.m
//  CodingPlatform
//
//  Created by Jerry on 15/12/1.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property UITableView *tableView;
@property NSArray *dataSource;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加导航条上的左右item
    [self addItemWithImage:@"addUserBtn_Nav" target:self action:@selector(addUserHandler) isLeft:YES];
    [self addItemWithImage:@"settingBtn_Nav" target:self action:@selector(settingHandler) isLeft:NO];
    //创建数据源
    self.dataSource = @[@[@[@"详细信息",@"user_info_detail"]],
                        @[@[@"我的项目",@"user_info_project"],
                        @[@"我的冒泡",@"user_info_tweet"],
                        @[@"我的话题",@"user_info_topic"],
                        @[@"本地文件",@"user_info_file"]],
                        @[@[@"我的码币",@"user_info_point"]]];
    //创建表格视图
    [self createTableView];
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

- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-64) style:UITableViewStyleGrouped];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSArray *data = self.dataSource[indexPath.section][indexPath.row];
    cell.textLabel.text = data[0];
    UIImage *image = [UIImage imageNamed:data[1]];
    cell.imageView.image = image;
    
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.cornerRadius = image.size.height/2;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"section:%ld row:%ld", indexPath.section, indexPath.row);
}
@end
