//
//  HomeTableViewController.h
//  Huway_czn
//
//  Created by Huway Mac on 15/11/19.
//  Copyright © 2015年 Android Develope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewController : UITableViewController
@property (assign,nonatomic) int page ;
@property (assign, nonatomic)int uid;
@property (strong,nonatomic)NSMutableArray *userArr;

@end
