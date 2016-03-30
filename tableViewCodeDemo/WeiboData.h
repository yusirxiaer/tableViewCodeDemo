//
//  WeiboData.h
//  TableViewSample2
//
//  Created by vicliu on 16/1/4.
//  Copyright © 2016年 shangqian. All rights reserved.
//

#import <Foundation/Foundation.h>

// 微博信息数据类

@interface WeiboData : NSObject

// 用户ID
@property (assign, nonatomic) int userID;
// 用户头像图片名
@property (copy, nonatomic) NSString *profileImgName;
// 用户名
@property (copy, nonatomic) NSString *userName;
// 用户类型
@property (copy, nonatomic) NSString *membershipType;
// 发布时间
@property (copy, nonatomic) NSString *createAt;
// 发布设备
@property (copy, nonatomic) NSString *sourceDevice;
// 发布信息
@property (copy, nonatomic) NSString *text;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

+ (instancetype)weiboDataWithDictionary:(NSDictionary *)dict;

@end
