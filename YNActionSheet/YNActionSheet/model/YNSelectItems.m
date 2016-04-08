//
//  YNSelectItems.m
//  YNActionSheet
//
//  Created by ianc-ios on 16/4/7.
//  Copyright © 2016年 yangneng. All rights reserved.
//

#import "YNSelectItems.h"


@interface YNSelectItems()

@property(nonatomic,strong)NSMutableArray *items;
@end


@implementation YNSelectItems


///懒加载
-(NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}
-(void)addItemWithObject:(YNSelectViewObject *)object{
    [self.items addObject:object];
}
-(NSInteger)itemCount{
    return self.items.count;
}
-(YNSelectViewObject *)selObjectAtIndex:(NSInteger)index
{
    return [self.items objectAtIndex:index];
}
@end
