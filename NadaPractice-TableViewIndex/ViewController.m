//
//  ViewController.m
//  NadaPractice-TableViewIndex
//
//  Created by Nada on 15/7/3.
//  Copyright (c) 2015年 nada. All rights reserved.
//

#import "ViewController.h"
#import "NadaTableViewIndex.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NadaTableViewIndex *vc=[[NadaTableViewIndex alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
