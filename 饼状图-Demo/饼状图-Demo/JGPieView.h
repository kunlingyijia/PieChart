//
//  JGPieView.h
//  饼状图-Demo
//
//  Created by stkcctv on 16/8/23.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JGPieView;

/************************    数据源方法 必须实现      ********************************/
@protocol JGPieViewDataSource <NSObject>

@required
/**
 *  value数据
 *
 *  @return NSArray必须存储NSString类型
 */
- (NSArray *)valueArrayInPieChart:(JGPieView *)pieChart;

/**
 *  颜色数组
 *
 *  @return NSArray必须存储UIColor类型
 */
- (NSArray *)colorArrayInPieChart:(JGPieView *)pieChart;
/**
 *  每组数据的描述
 *
 *  @return NSArray必须存储NSString类型
 */
- (NSArray *)descArrayInPieChart:(JGPieView *)pieChart;
@end



@interface JGPieView : UIView

/** 数据源  */
@property (nonatomic, strong)NSArray *dataArray;
/** 饼状图每部分说明  */
@property (nonatomic, strong)NSArray *descDataArray;

/** 数据源代理 */
@property (nonatomic, weak) id <JGPieViewDataSource> dataSource;

@end
