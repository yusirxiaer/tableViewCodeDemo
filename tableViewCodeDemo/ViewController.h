//
//  ViewController.h
//  TableViewSample2
//
//  Created by vicliu on 16/1/4.
//  Copyright © 2016年 shangqian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

// 表视图
@property (strong, nonatomic) UITableView *tableView;
// 数据源数组
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

