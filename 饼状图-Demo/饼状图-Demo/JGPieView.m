//
//  JGPieView.m
//  饼状图-Demo
//
//  Created by stkcctv on 16/8/23.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGPieView.h"

@implementation JGPieView

- (void)drawRect:(CGRect)rect {

    _dataArray = [self.dataSource valueArrayInPieChart:self];
    
    //画饼形扇形
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5 - 50);
    CGFloat radius = rect.size.width * 0.5  - 10;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    
    for (int i = 0; i < _dataArray.count; i++) {
        
        startA = endA;
        angle = [_dataArray[i] intValue] / 100.0 * M_PI * 2;
        endA = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        NSArray *colorArrM = [self.dataSource colorArrayInPieChart:self];
        [(UIColor *)colorArrM[i] set];
        [path fill];
    }
}

- (void)layoutSubviews {
    
    if ([self.dataSource valueArrayInPieChart:self]) {
        
        NSArray *titleArrM = [self.dataSource descArrayInPieChart:self];
        _dataArray = [self.dataSource valueArrayInPieChart:self];
        for (int i = 0; i < titleArrM.count; i++) {
            
            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(5, 100 + i * 25, self.frame.size.width - 10, 20)];
            NSArray *colorArrM = [self.dataSource colorArrayInPieChart:self];
            lbl.backgroundColor = (UIColor *)colorArrM[i];
            lbl.font = [UIFont systemFontOfSize:14];
            lbl.text = [NSString stringWithFormat:@"%@:%d%%",titleArrM[i],[_dataArray[i] intValue]];
            [self addSubview:lbl];
        }
    }
}


@end
