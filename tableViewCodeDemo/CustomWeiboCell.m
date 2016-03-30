//
//  CustomWeiboCellTableViewCell.m
//  TableViewSample2
//
//  Created by vicliu on 16/1/4.
//  Copyright © 2016年 shangqian. All rights reserved.
//

#import "CustomWeiboCell.h"

@implementation CustomWeiboCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    
    return self;
}

// 想table cell中添加相应的view
- (void)initView {
    self.userImg = [[UIImageView alloc] init];
    [self.contentView addSubview:self.userImg];
    
    self.userName = [[UILabel alloc] init];
    self.userName.textColor = [UIColor redColor];
    self.userName.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.userName];
    
    self.mbType = [[UIImageView alloc] init];
    [self.contentView addSubview:self.mbType];
    
    self.createAt = [[UILabel alloc] init];
    self.createAt.textColor = [UIColor blueColor];
    self.createAt.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.createAt];
    
    self.sourceDevice = [[UILabel alloc] init];
    self.sourceDevice.textColor = [UIColor greenColor];
    self.sourceDevice.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.sourceDevice];
    
    self.text = [[UILabel alloc] init];
    self.text.font = [UIFont systemFontOfSize:15];
    self.text.numberOfLines = 0;
    [self.contentView addSubview:self.text];
}

// 绑定cell需要显示的数据，并根据数据动态计算cell的高度
- (void)setCellData:(WeiboData *)weiboData {
    self.weiboData = weiboData;
    
    // 设置用户头像
    CGFloat userImgX = 10;
    CGFloat userImgY = 10;
    CGRect frame = CGRectMake(userImgX, userImgY, 40, 40);
    self.userImg.image = [UIImage imageNamed:self.weiboData.profileImgName];
    self.userImg.frame = frame;
    
    // 设置用户名
    CGFloat userNameX = CGRectGetMaxX(self.userImg.frame) + 10;
    CGFloat userNameY = userImgY;
    CGSize userNameSize = [self.weiboData.userName sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    frame = CGRectMake(userNameX, userNameY, userNameSize.width, userNameSize.height);
    self.userName.text = self.weiboData.userName;
    self.userName.frame = frame;
    
    // 设置用户类型
    CGFloat mbTypeX = CGRectGetMaxX(self.userName.frame) + 10;
    CGFloat mbTypeY = userImgY;
    frame = CGRectMake(mbTypeX, mbTypeY, 12, 12);
    self.mbType.image = [UIImage imageNamed:self.weiboData.membershipType];
    self.mbType.frame = frame;
    
    // 设置发布时间
    CGSize createAtSize = [self.weiboData.createAt sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    CGFloat createAtX = userNameX;
    CGFloat createAtY = CGRectGetMaxY(self.userImg.frame) - createAtSize.height;
    frame = CGRectMake(createAtX, createAtY, createAtSize.width, createAtSize.height);
    self.createAt.text = self.weiboData.createAt;
    self.createAt.frame = frame;
    
    // 设置发布设备
    CGSize sourceDeviceSize = [self.weiboData.sourceDevice sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    CGFloat sourceDeviceX = CGRectGetMaxX(self.createAt.frame) + 10;
    CGFloat sourceDeviceY = createAtY;
    frame = CGRectMake(sourceDeviceX, sourceDeviceY, sourceDeviceSize.width, sourceDeviceSize.height);
    self.sourceDevice.text = self.weiboData.sourceDevice;
    self.sourceDevice.frame = frame;
    
    // 设置发布内容
    CGFloat textX = userImgX;
    CGFloat textY = CGRectGetMaxY(self.userImg.frame) + 10;
    CGFloat textWidth = self.frame.size.width - 2*10;
    CGSize textSize = [self.weiboData.text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    frame = CGRectMake(textX, textY, textSize.width, textSize.height);
    self.text.text = self.weiboData.text;
    self.text.frame = frame;
    
    // 更具内容计算出cell的高度
    self.height = CGRectGetMaxY(self.text.frame) + 10;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
