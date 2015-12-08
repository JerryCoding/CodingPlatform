//
//  TweetViewController.m
//  CodingPlatform
//
//  Created by Jerry on 15/12/1.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "TweetViewController.h"

#define ScrollViewTag   100
#define TitleLabelTag   200
#define PageControlTag  300

@interface TweetViewController ()<UIScrollViewDelegate>

@end

@implementation TweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加导航条上的左右item
    [self addItemWithImage:@"search_Nav" target:self action:@selector(searchHandler) isLeft:YES];
    [self addItemWithImage:@"tweetBtn_Nav" target:self action:@selector(tweetHandler) isLeft:NO];
    
    //创建滚动视图
    [self createScrollView];
    
    //创建标题视图
    [self createTitleView];
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

- (void)createTitleView
{
    //标题视图
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH-88, 44)];
    titleView.layer.masksToBounds = YES;
    //titleView.backgroundColor = [UIColor redColor];
    //按页控制
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(titleView.frame.size.width/2-22, 30, 44, 14)];
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    pageControl.tag = PageControlTag;
    [titleView addSubview:pageControl];
    //指示标题
    NSArray *titles = @[@"冒泡广场",@"朋友圈",@"热门冒泡"];
    for (NSInteger i=0; i<titles.count; i++) {
        CGFloat titleViewWidth = titleView.frame.size.width;
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 88, 30)];
        titleLabel.center = CGPointMake((i+1)*titleViewWidth/2, 15);
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.tag = TitleLabelTag+i;
        titleLabel.alpha = 1-(fabs(titleViewWidth/2-titleLabel.center.x))/(titleView.frame.size.width/2);
        [titleView addSubview:titleLabel];
    }
    self.navigationItem.titleView = titleView;
}

- (void)createScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-64)];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(3*VIEW_WIDTH, VIEW_HEIGHT-64);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.tag = ScrollViewTag;
    
    [self.view addSubview:scrollView];
}

- (void)viewWillLayoutSubviews
{
    UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:ScrollViewTag];
    //获取标题视图
    UIView *titleView = self.navigationItem.titleView;
    CGFloat halfWidth = titleView.frame.size.width/2;
    CGSize size = scrollView.frame.size;
    //偏移比例
    CGFloat offsetScale = scrollView.contentOffset.x/size.width;
    for (NSInteger i=0; i<3; i++) {
        UIView *view = [titleView viewWithTag:i+TitleLabelTag];
        CGPoint center = view.center;
        center.x = (i+1-offsetScale)*halfWidth;
        view.center = center;
        view.alpha = 1-fabs(halfWidth-center.x)/halfWidth;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获取标题视图
    UIView *titleView = self.navigationItem.titleView;
    CGFloat halfWidth = titleView.frame.size.width/2;
    CGSize size = scrollView.frame.size;
    //偏移比例
    CGFloat offsetScale = scrollView.contentOffset.x/size.width;
    for (NSInteger i=0; i<3; i++) {
        UIView *view = [titleView viewWithTag:i+TitleLabelTag];
        CGPoint center = view.center;
        center.x = (i+1-offsetScale)*halfWidth;
        view.center = center;
        view.alpha = 1-fabs(halfWidth-center.x)/halfWidth;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    UIPageControl *pageControl = (UIPageControl *)[self.navigationItem.titleView viewWithTag:PageControlTag];
    pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
}

@end
