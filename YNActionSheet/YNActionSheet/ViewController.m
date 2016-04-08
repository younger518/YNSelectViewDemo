//
//  ViewController.m
//  YNActionSheet
//
//  Created by ianc-ios on 16/4/7.
//  Copyright © 2016年 yangneng. All rights reserved.
//

#import "ViewController.h"
#import "YNSelectView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showActionsheet:(id)sender {
    YNSelectView *view = [[YNSelectView alloc]init];
    [view showWithAddItemBlock:^(YNSelectItems *items) {
        YNSelectViewObject *obj1 = [[YNSelectViewObject alloc]initWithTitle:@"account_32" viewImage:@"account_32"];
        YNSelectViewObject *obj2 = [[YNSelectViewObject alloc]initWithTitle:@"user32" viewImage:@"user32"];
        YNSelectViewObject *obj3 = [[YNSelectViewObject alloc]initWithTitle:@"yue32" viewImage:@"yue32" ];
        [items addItemWithObject:obj1];
        [items addItemWithObject:obj2];
        [items addItemWithObject:obj3];
        
    } selBlock:^(NSInteger index,YNSelectViewObject *objec) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:objec.viewTitle message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:^{
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [alert dismissViewControllerAnimated:YES completion:nil];
            });
            
        }];
        
    }];
}

@end
