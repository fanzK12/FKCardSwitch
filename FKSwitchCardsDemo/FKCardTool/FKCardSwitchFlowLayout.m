//
//  FKCardSwitchFlowLayout.m
//  FKSwitchCardsDemo
//
//  Created by apple on 17/3/15.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FKCardSwitchFlowLayout.h"

@implementation FKCardSwitchFlowLayout

//设置放大动画
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray * arr = [self getCopyOfAttributes:[super layoutAttributesForElementsInRect:rect]];
    //屏幕中线
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width/2.0f;
    //刷线cell缩放
    for (UICollectionViewLayoutAttributes * attributes in arr) {
        CGFloat distance = fabs(attributes.center.x - centerX);
        //移动的距离和屏幕宽度的比例
        CGFloat apartScale = distance/self.collectionView.bounds.size.width;
        //把卡片移动范围固定到 -π/4 到 +π/4这个范围内
        CGFloat scale = fabs(cos(apartScale * M_PI/4));
        //设置cell的缩放 按照余弦函数曲线 越居中越趋近于1
        attributes.transform = CGAffineTransformMakeScale(1.0, scale);
    }
    return arr;
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return true;
}

//防止报错 先复制attributes
- (NSArray *)getCopyOfAttributes:(NSArray *)attributes{
    NSMutableArray * copyArr = [NSMutableArray new];
    for (UICollectionViewLayoutAttributes * attribute in attributes) {
        [copyArr addObject:[attribute copy]];
    }
    return copyArr;
}
@end
