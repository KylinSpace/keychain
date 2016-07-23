//
//  ViewController.m
//  getKeyChain
//
//  Created by kylin_cs on 16/7/22.
//  Copyright © 2016年 KylinSpace. All rights reserved.
//

#import "ViewController.h"
#import "SFHFKeychainUtils.h"
@interface ViewController ()
@property(nonatomic,weak)UILabel *label;

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *serviceName;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userName = @"test@qq.com";
    self.serviceName = @"space.kylin.www";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor lightGrayColor];
    button.frame = CGRectMake(200, 200, 120, 40);
    [self.view addSubview:button];
    [button setTitle:@"删除" forState:UIControlStateNormal];
    UILabel *label = [[UILabel alloc]init];
    _label = label;
    label.frame = CGRectMake(100, 300, 200, 40);
    [self.view addSubview:label];
    _label.text = [SFHFKeychainUtils getPasswordForUsername:self.userName andServiceName:self.serviceName error:nil];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick{
    
    NSLog(@"%s",__func__);
    [SFHFKeychainUtils deleteItemForUsername:self.userName andServiceName:self.serviceName error:nil];
    
   _label.text = [SFHFKeychainUtils getPasswordForUsername:self.userName andServiceName:self.serviceName error:nil];
    
}


@end
