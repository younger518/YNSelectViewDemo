//
//  YNSelectViewObject.m
//  YNActionSheet
//
//  Created by ianc-ios on 16/4/7.
//  Copyright © 2016年 yangneng. All rights reserved.
//

#import "YNSelectViewObject.h"

@implementation YNSelectViewObject

-(instancetype)initWithTitle:(NSString *)viewTitle viewImage:(NSString *)viewImage{
    if (self = [super init]) {
        self.viewTitle = viewTitle;
        self.viewImage = viewImage;
    }
    return self;
}
@end
