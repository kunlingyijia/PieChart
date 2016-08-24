//
//  ViewController.m
//  饼状图-Demo
//
//  Created by stkcctv on 16/8/23.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "ViewController.h"
#import "JGPieView.h"


@interface ViewController () <JGPieViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JGPieView *pieView = [[JGPieView alloc] initWithFrame:CGRectMake(50, 300, 100, 200)];
    pieView.backgroundColor = [UIColor clearColor];
    pieView.dataSource = self;
    [self.view addSubview:pieView];
}


#pragma mark - <JGPieViewDataSource> -
- (NSArray *)valueArrayInPieChart:(JGPieView *)pieChart {
    return @[@20,@30,@40,@10];
}

- (NSArray *)descArrayInPieChart:(JGPieView *)pieChart {
    return @[@"一年级",@"二年级",@"三年级",@"四年级"];
}

- (NSArray *)colorArrayInPieChart:(JGPieView *)pieChart {
    
    NSArray *colorArr = @[
                          [UIColor redColor],
                          [UIColor greenColor],
                          [UIColor cyanColor],
                          [UIColor yellowColor]
                          ];
    
    return colorArr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
