//
//  YNSelectViewObject.h
//  YNActionSheet
//
//  Created by ianc-ios on 16/4/7.
//  Copyright © 2016年 yangneng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YNSelectViewObject : NSObject

@property(nonatomic,copy)NSString *viewTitle;
@property(nonatomic,copy)NSString *viewImage;

-(instancetype)initWithTitle:(NSString *)viewTitle viewImage:(NSString *)viewImage;
@end
