//
//  MessageViewController.m
//  CodingPlatform
//
//  Created by Jerry on 15/12/1.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property UITableView *tableView;
@property NSArray *dataSource;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加导航条上的右侧item
    [self addItemWithImage:@"tweetBtn_Nav" target:self action:@selector(tweetHandler) isLeft:NO];
    //创建资源
    self.dataSource = @[@[@"@我的",@"messageAT"],
                        @[@"评论",@"messageComment"],
                        @[@"系统通知",@"messageSystem"]];
    //创建表格视图
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tweetHandler
{
    NSLog(@"点击冒泡按钮");
}

- (void)createTableView
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-64);
    
    //设置代理
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.layer.masksToBounds = YES;
        cell.imageView.layer.cornerRadius = cell.frame.size.height/2;
    }
    cell.textLabel.text = self.dataSource[indexPath.row][0];
    cell.imageView.image = [UIImage imageNamed:self.dataSource[indexPath.row][1]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"row:%ld", indexPath.row);
}

@end
