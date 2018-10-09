//
//  ViewController.m
//  RCYTrieTree
//
//  Created by hcwh on 2018/10/8.
//  Copyright © 2018年 huchengwenhao. All rights reserved.
//

#import "ViewController.h"
#import "RCYTrieTree.h"
#import "RCYPinYinSplitService.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.yellowColor;

    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 50, UIScreen.mainScreen.bounds.size.width, 50)];
    self.textField.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.textField];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, UIScreen.mainScreen.bounds.size.width, 50)];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button addTarget:self action:@selector(splitString) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)splitString {
    NSLog(@"点击时间");
    [RCYPinYinSplitService splitPinYinWithString:[self.textField.text lowercaseString] successBlock:^(NSArray *successArray) {
        NSLog(@"%@", successArray);
    }];
    
    [RCYPinYinSplitService splitPinYinFrontAddSpaceWithString:[self.textField.text lowercaseString] successBlock:^(NSArray *successArray) {
        NSLog(@"%@", successArray);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
