//
//  ActiveTableViewController.h
//  Huway_czn
//
//  Created by Huway Mac on 15/11/19.
//  Copyright © 2015年 Android Develope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActiveTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UIScrollView *banner;
@property (nonatomic,strong)NSMutableArray *viewArray;
@end
