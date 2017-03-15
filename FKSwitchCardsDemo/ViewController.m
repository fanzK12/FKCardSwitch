//
//  ViewController.m
//  FKSwitchCardsDemo
//
//  Created by apple on 17/3/15.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "FKCardSwitchView.h"
#import "FKCardModel.h"
@interface ViewController ()<FKCardSwitchDelegate>
{
    FKCardSwitchView * _cardSwitch;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FKCardSwitch";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"DataPropertyList" ofType:@"plist"];
    NSArray * arr = [NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray * modelArr = [NSMutableArray new];
    for (NSDictionary * dic in arr) {
        FKCardModel * model = [FKCardModel new];
        [model setValuesForKeysWithDictionary:dic];
        [modelArr addObject:model];
    }
    
    _cardSwitch = [[FKCardSwitchView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    _cardSwitch.modelArrs = modelArr;
    _cardSwitch.delegate = self;
    [self.view addSubview:_cardSwitch];

}

- (void)FKCardSwitchDidSelectedAt:(NSInteger)index{
    NSLog(@"选中了：%zd",index);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
