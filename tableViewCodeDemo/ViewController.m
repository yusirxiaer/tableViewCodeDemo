//
//  ViewController.m
//  TableViewSample2
//
//  Created by vicliu on 16/1/4.
//  Copyright © 2016年 shangqian. All rights reserved.
//

#import "ViewController.h"
#import "WeiboData.h"
#import "CustomWeiboCell.h"

@interface ViewController ()

@end

@implementation ViewController
{
    // 存储相应的cell，用于动态计算cell的高度
    NSMutableArray *_cellArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    
    [self initView];
}

// 初始化数据源
- (void)initData {
    // 从当前工程目录下取得WeiboDataInfo.plist文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"WeiboDataInfo" ofType:@"plist"];
    
    // 根据指定路径文件内容初始化数组
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    self.dataArray = [[NSMutableArray alloc] init];
    _cellArray = [[NSMutableArray alloc] init];
    
    // 遍历访问数组array，根据数组中的字典数据初始化微博信息数据对象
    for (NSDictionary *dict in array) {
        // 添加到数据源中
        [self.dataArray addObject:[WeiboData weiboDataWithDictionary:dict]];
        
        // 添加到备份cell中，用于动态计算高度
        CustomWeiboCell *cell = [[CustomWeiboCell alloc] init];
        [_cellArray addObject:cell];
    }
}

// 初始化视图
- (void)initView {
    // 创建一个屏幕大小的表视图
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view data source
// 返回某一个分组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

// 返回某一分组中的某一行用于显示用的cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CustomWeiboCell";
    CustomWeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CustomWeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    WeiboData *data = self.dataArray[indexPath.row];
    [cell setCellData:data];
    
    return cell;
}

#pragma mark - table view delegate
// 返回cell的高度（可以互不相同）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 从备份的cell数组中取出相应的cell
    CustomWeiboCell *cell = _cellArray[indexPath.row];
    // 安装微博信息数据，动态计算高度
    [cell setCellData:self.dataArray[indexPath.row]];
    
    return cell.height;
}

@end
