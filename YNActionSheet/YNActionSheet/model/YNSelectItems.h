//
//  YNSelectItems.h
//  YNActionSheet
//
//  Created by ianc-ios on 16/4/7.
//  Copyright © 2016年 yangneng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YNSelectViewObject.h"

@protocol YNSelectItemsDelegate <NSObject>

@required
- (void)addItemWithObject:(YNSelectViewObject *)object;
@end

@interface YNSelectItems : NSObject<YNSelectItemsDelegate>
@property(nonatomic,assign)NSInteger itemCount;
-(YNSelectViewObject *)selObjectAtIndex:(NSInteger)index;
@end
