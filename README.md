# PieChart
饼状图-Demo
#### 创建

包含头文件`#import "JGPieView.h`或者`#import "PieView.h"`

	JGPieView *pieView = [[JGPieView alloc] initWithFrame:CGRectMake(50, 300, 100, 200)];
    pieView.backgroundColor = [UIColor clearColor];
    pieView.dataSource = self;
    [self.view addSubview:pieView];
    
    
###数据源方法 -- 必须实现

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
