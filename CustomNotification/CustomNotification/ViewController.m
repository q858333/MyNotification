//
//  ViewController.m
//  CustomNotification
//
//  Created by DengBin on 15/11/2.
//  Copyright © 2015年 DengBin. All rights reserved.
//

#import "ViewController.h"
#import "MyNotification.h"
#import "MessageBusManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[MyNotification shareNotification] postWithName:@"name"];
    
    [[MessageBusManager shareMessageManager] postMessageWithMessageName:@"123"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
