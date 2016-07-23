//
//  ViewController.m
//  saveKeyChain
//
//  Created by kylin_cs on 16/7/22.
//  Copyright © 2016年 KylinSpace. All rights reserved.
//

#import "ViewController.h"
#import "SFHFKeychainUtils.h"
@interface ViewController ()
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userPassword;
@property (nonatomic, strong) NSString *serviceName;
@property(nonatomic,weak)UILabel *label;
@property(nonatomic,weak)UILabel *label2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userName = @"test@qq.com";
    self.userPassword = @"1234567890";
    self.serviceName = @"space.kylin.www";
    NSError *error;
    BOOL saved = [SFHFKeychainUtils storeUsername:self.userName andPassword:self.userPassword
                                   forServiceName:self.serviceName updateExisting:YES error:&error];
   
    
    if (!saved) {
        NSLog(@"❌Keychain保存密码时出错：%@", error);
    }else{
        NSLog(@"✅Keychain保存密码成功！");
    }
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor lightGrayColor];
    button.frame = CGRectMake(200, 200, 120, 40);
    [self.view addSubview:button];
    [button setTitle:@"读取" forState:UIControlStateNormal];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor lightGrayColor];
    button1.frame = CGRectMake(200, 400, 120, 40);
    [self.view addSubview:button1];
    [button1 setTitle:@"删除" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor lightGrayColor];
    button2.frame = CGRectMake(200, 500, 120, 40);
    [self.view addSubview:button2];
    [button2 setTitle:@"清空" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    UILabel *label = [[UILabel alloc]init];
    _label = label;
    label.frame = CGRectMake(100, 300, 200, 40);
    [self.view addSubview:label];
    

    _label.text = [SFHFKeychainUtils getPasswordForUsername:self.userName andServiceName:self.serviceName error:nil];
    
   
    [button2 addTarget:self action:@selector(purgeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [button1 addTarget:self action:@selector(buttonClickDel) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(getButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)getButtonClick{
   
    _label.text =  [SFHFKeychainUtils getPasswordForUsername:self.userName andServiceName:self.serviceName error:nil];
    
}

- (void)buttonClickDel{
    
    [SFHFKeychainUtils deleteItemForUsername:self.userName andServiceName:self.serviceName error:nil];
   
    _label.text =  [SFHFKeychainUtils getPasswordForUsername:self.userName andServiceName:self.serviceName error:nil];
   
}

- (void)purgeButtonClick{
    [SFHFKeychainUtils purgeItemsForServiceName:self.serviceName error:nil];
    
    _label.text = [SFHFKeychainUtils getPasswordForUsername:self.userName andServiceName:self.serviceName error:nil];
    
}


@end
