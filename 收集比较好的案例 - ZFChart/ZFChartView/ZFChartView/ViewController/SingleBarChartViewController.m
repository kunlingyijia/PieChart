//
//  SingleBarChartViewController.m
//  ZFChartView
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SingleBarChartViewController.h"
#import "ZFChart.h"

@interface SingleBarChartViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>

@property (nonatomic, strong) ZFBarChart * barChart;

@property (nonatomic, assign) CGFloat height;

@end

@implementation SingleBarChartViewController

- (void)setUp{
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight){
        //首次进入控制器为横屏时
        _height = SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT * 0.5;
        
    }else{
        //首次进入控制器为竖屏时
        _height = SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    
    self.barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, _height)];
    self.barChart.dataSource = self;
    self.barChart.delegate = self;
    self.barChart.topicLabel.text = @"xx小学各年级人数";
    self.barChart.unit = @"人";
    self.barChart.isAnimated = NO;
//    self.barChart.isResetAxisLineMinValue = YES;
//    self.barChart.isShowAxisLineValue = NO;
//    self.barChart.valueLabelPattern = kPopoverLabelPatternBlank;
    self.barChart.isShowSeparate = YES;
//    self.barChart.topicLabel.textColor = ZFWhite;
//    self.barChart.unitColor = ZFWhite;
//    self.barChart.axisColor = ZFWhite;
//    self.barChart.axisLineNameColor = ZFWhite;
//    self.barChart.axisLineValueColor = ZFWhite;
//    self.barChart.backgroundColor = ZFPurple;
    [self.view addSubview:self.barChart];
    [self.barChart strokePath];
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    return @[@"123", @"256", @"300", @"283", @"490", @"236"];
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    return @[@"一年级", @"二年级", @"三年级", @"四年级", @"五年级", @"六年级"];
}

- (NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart{
    return @[ZFMagenta];
}

- (CGFloat)axisLineMaxValueInGenericChart:(ZFGenericChart *)chart{
    return 500;
}

//- (CGFloat)axisLineMinValueInGenericChart:(ZFGenericChart *)chart{
//    return 50;
//}

- (NSInteger)axisLineSectionCountInGenericChart:(ZFGenericChart *)chart{
    return 10;
}

#pragma mark - ZFBarChartDelegate

//- (CGFloat)barWidthInBarChart:(ZFBarChart *)barChart{
//    return 40.f;
//}
//
//- (CGFloat)paddingForGroupsInBarChart:(ZFBarChart *)barChart{
//    return 40.f;
//}
//
//- (id)valueTextColorArrayInBarChart:(ZFGenericChart *)barChart{
//    return ZFBlue;
//}

- (void)barChart:(ZFBarChart *)barChart didSelectBarAtGroupIndex:(NSInteger)groupIndex barIndex:(NSInteger)barIndex{
    NSLog(@"第%ld组========第%ld个",(long)groupIndex,(long)barIndex);
}

- (void)barChart:(ZFBarChart *)barChart didSelectPopoverLabelAtGroupIndex:(NSInteger)groupIndex labelIndex:(NSInteger)labelIndex{
    NSLog(@"第%ld组========第%ld个",(long)groupIndex,(long)labelIndex);
}

#pragma mark - 横竖屏适配(若需要同时横屏,竖屏适配，则添加以下代码，反之不需添加)

/**
 *  PS：size为控制器self.view的size，若图表不是直接添加self.view上，则修改以下的frame值
 */
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator{
    
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight){
        self.barChart.frame = CGRectMake(0, 0, size.width, size.height - NAVIGATIONBAR_HEIGHT * 0.5);
    }else{
        self.barChart.frame = CGRectMake(0, 0, size.width, size.height + NAVIGATIONBAR_HEIGHT * 0.5);
    }
    
    [self.barChart strokePath];
}

@end
