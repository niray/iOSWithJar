//
//  UserTableViewCell.m
//  Huway_czn
//
//  Created by Huway Mac on 15/11/20.
//  Copyright © 2015年 Android Develope. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    
    self.iv_avatar.clipsToBounds = YES;
    self.iv_avatar.layer.cornerRadius = 50.0f;
    
    self.iv_avatar.layer.borderColor = [UIColor redColor].CGColor;
    self.iv_avatar.layer.borderWidth = 5.0f;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
