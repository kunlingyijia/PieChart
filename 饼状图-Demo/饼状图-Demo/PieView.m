//
//  PieView.h
//  饼状图-Demo
//
//  Created by stkcctv on 16/8/23.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "PieView.h"

@implementation PieView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
      NSArray *dataArray =  @[@10,@10,@10,@10,@10,@10,@10,@10,@10,@10];
    
    //画饼图扇形
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;

    for (NSNumber *num in dataArray) {
        startA = endA;
        angle = num.intValue / 100.0 * M_PI * 2;
        endA = startA + angle;
       UIBezierPath  *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[self randomColor] set];
        [path fill];
    }
    
}

//随机生成一个颜色
- (UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;

    //0-255.
//    colorWithRed  0-1
   return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self setNeedsDisplay];
}


- (void)drawPie{
    //画饼图扇形
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    CGFloat radius = self.bounds.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat angle = 25 / 100.0 * M_PI * 2;
    CGFloat endA = startA + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor redColor] set];
    [path fill];
    
    startA = endA;
    angle = 25 / 100.0 * M_PI * 2;
    endA = startA + angle;
    path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor greenColor] set];
    [path fill];
    
    
    startA = endA;
    angle = 50 / 100.0 * M_PI * 2;
    endA = startA + angle;
    path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor blueColor] set];
    [path fill];
    

}



@end
