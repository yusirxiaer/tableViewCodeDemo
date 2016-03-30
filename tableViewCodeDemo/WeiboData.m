//
//  WeiboData.m
//  TableViewSample2
//
//  Created by vicliu on 16/1/4.
//  Copyright © 2016年 shangqian. All rights reserved.
//

#import "WeiboData.h"

@implementation WeiboData

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.userID = (int)[dict[@"id"] integerValue];
        self.profileImgName = dict[@"profileImageUrl"];
        self.userName = dict[@"userName"];
        self.membershipType = dict[@"mbtype"];
        self.createAt = dict[@"createdAt"];
        self.sourceDevice = dict[@"source"];
        self.text = dict[@"text"];
    }
    
    return self;
}

+ (instancetype)weiboDataWithDictionary:(NSDictionary *)dict {
    return [[WeiboData alloc] initWithDictionary:dict];
}

@end
