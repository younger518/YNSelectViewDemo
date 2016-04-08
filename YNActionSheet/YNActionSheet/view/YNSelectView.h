//
//  YNSelectView.h
//  YNActionSheet
//
//  Created by ianc-ios on 16/4/7.
//  Copyright © 2016年 yangneng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YNSelectItems.h"
typedef void(^addItemBlock)(YNSelectItems *items);
typedef void(^selectedBlock)(NSInteger index,YNSelectViewObject *selObjec);

/*@class YNSelectView;

@protocol YNSelectViewDelegate <NSObject>

@optional
-(void)ynSelectView:(YNSelectView *)ynSelectView didSelectItemAtIndex:(NSInteger)itemIndex;

@end*/


@interface YNSelectView : UIView


//@property(nonatomic,weak)id<YNSelectViewDelegate>selectViewDelegate;

-(void)showWithAddItemBlock:(addItemBlock)addBlock selBlock:(selectedBlock)selBlock;

@end
