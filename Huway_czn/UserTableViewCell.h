//
//  UserTableViewCell.h
//  Huway_czn
//
//  Created by Huway Mac on 15/11/20.
//  Copyright © 2015年 Android Develope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_nick;
@property (weak, nonatomic) IBOutlet UIImageView *iv_avatar;

@end
