//
//  CustomWeiboCellTableViewCell.h
//  TableViewSample2
//
//  Created by vicliu on 16/1/4.
//  Copyright © 2016年 shangqian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboData.h"

// 自定义table view cell用于显示微博信息

@interface CustomWeiboCell : UITableViewCell
// 用户图片
@property (strong, nonatomic) UIImageView *userImg;
// 用户名
@property (strong, nonatomic) UILabel *userName;
// 用户类型
@property (strong, nonatomic) UIImageView *mbType;
// 发布时间
@property (strong, nonatomic) UILabel *createAt;
// 发布设备
@property (strong, nonatomic) UILabel *sourceDevice;
// 发布信息
@property (strong, nonatomic) UILabel *text;

// 绑定的微博信息数据
@property (strong, nonatomic) WeiboData *weiboData;
// 整个cell的高度
@property (assign, nonatomic) CGFloat height;

- (void)setCellData:(WeiboData *)weiboData;

@end
