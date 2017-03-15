//
//  FKCardSwitchView.h
//  FKSwitchCardsDemo
//
//  Created by apple on 17/3/15.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FKCardSwitchDelegate <NSObject>

@optional
//滚动代理方法
- (void)FKCardSwitchDidSelectedAt:(NSInteger)index;

@end

@interface FKCardSwitchView : UIView

@property (nonatomic, strong) NSArray * modelArrs;

@property (nonatomic, weak) id<FKCardSwitchDelegate>delegate;
@end
