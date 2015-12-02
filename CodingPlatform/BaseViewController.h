//
//  BaseViewController.h
//  CodingPlatform
//
//  Created by Jerry on 15/12/1.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)addTitleViewWithTitle:(NSString *)title;
- (void)addItemWithImage:(NSString *)image target:(id)target action:(SEL)action isLeft:(BOOL)isLeft;

@end
