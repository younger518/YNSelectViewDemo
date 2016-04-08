//
//  YNSelectView.m
//  YNActionSheet
//
//  Created by ianc-ios on 16/4/7.
//  Copyright © 2016年 yangneng. All rights reserved.
//

#import "YNSelectView.h"

#define CELL_HEIGHT (45)
#define PHONE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define PHONE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface YNSelectView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)UIView *tapView;
@property(nonatomic,weak)UITableView *dataTableView;
@property(nonatomic,assign)CGFloat tableViewHeight;
@property(nonatomic,strong)YNSelectItems *selectionItems;
@property(nonatomic,copy)selectedBlock selBlock;

@end
@implementation YNSelectView

/*-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        ///添加UITableView
        [self setupSubViews];
    }
    return self;
}*/
-(instancetype)init{
    if (self = [super init]) {
        ///添加响应tap事件的View 和 UITableView
        self.frame = CGRectMake(0, 0, PHONE_WIDTH,PHONE_HEIGHT );
        [self setupSubViews];
    }
    return self;
}
-(void)setupSubViews{
    UIView *tapView = [[UIView alloc]init];
    tapView.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapViewtouched:)];
    [tapView addGestureRecognizer:tapG];
    tapView.frame = self.bounds;
    [self addSubview:tapView];
    self.tapView = tapView;
    
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor lightGrayColor];
    tableView.frame = CGRectMake(0, PHONE_HEIGHT, PHONE_WIDTH, 0);
    [self addSubview:tableView];
    self.dataTableView = tableView;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //[self.dataTableView setFrame:self.bounds];
}
-(void)dealloc{
    NSLog(@"dealloc------");
}
-(void)tapViewtouched:(UITapGestureRecognizer *)ges{
    [self disMisMySelf];
}

////懒加载
-(YNSelectItems *)selectionItems{
    if (_selectionItems == nil) {
        _selectionItems = [[YNSelectItems alloc]init];
    }
    return _selectionItems;
}

////实现UITableView的代理


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.selectionItems.itemCount;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    YNSelectViewObject *objec = [self.selectionItems selObjectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:objec.viewImage];
    cell.textLabel.text =objec.viewTitle;
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*if ([self.selectViewDelegate respondsToSelector:@selector(ynSelectView:didSelectItemAtIndex:)]) {
        [self.selectViewDelegate ynSelectView:self didSelectItemAtIndex:indexPath.row];
    }*/
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YNSelectViewObject *objec = [self.selectionItems selObjectAtIndex:indexPath.row];
    self.selBlock(indexPath.row,objec);
    [self disMisMySelf];
}

-(void)showWithAddItemBlock:(addItemBlock)addBlock selBlock:(selectedBlock)selBlock{
    addBlock(self.selectionItems);
    self.selBlock = selBlock;
    self.tableViewHeight = (self.selectionItems.itemCount + 1) * CELL_HEIGHT;
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    
    [UIView animateWithDuration:0.2 animations:^{
        ///从底部动画弹出
        self.dataTableView.frame = CGRectMake(0, PHONE_HEIGHT - self.tableViewHeight, PHONE_WIDTH, self.tableViewHeight);
    }];
}
-(void)disMisMySelf{
    [UIView animateWithDuration:0.2 animations:^{
        self.dataTableView.frame = CGRectMake(0, PHONE_HEIGHT, PHONE_WIDTH, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
