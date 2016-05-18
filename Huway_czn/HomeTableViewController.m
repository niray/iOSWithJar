//
//  HomeTableViewController.m
//  Huway_czn
//
//  Created by Huway Mac on 15/11/19.
//  Copyright © 2015年 Android Develope. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>
#import <MJRefresh/MJRefreshAutoNormalFooter.h>
#import <MJRefresh/MJRefreshNormalHeader.h>
#import "HomeTableViewController.h"
#import "UserLoginModel.h"
#import "HttpUtil.h"
#import "UserTableViewCell.h"
#import "UserInfoModel.h"
#import "UIImageView+WebCache.h"
#import "UIScrollView+MJRefresh.h"
#import "UIView+zn.h"

@interface HomeTableViewController () {
    UITableView *tv;
}

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *back = [[ UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self
                                                                           action:@selector(backEvent)];
    self.title=@"我的好友们";
    self.navigationItem.leftBarButtonItem=back;
    
    
    self.uid = [[[NSUserDefaults standardUserDefaults] valueForKey:@"uid"] intValue];
    self.page = 1;
    self.userArr = [NSMutableArray array];
    [self onRequestUserList];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];
    
    tv = (UITableView *) self.view;
    
#if DEBUG
    [tv zn_roundCornerWithRadius:11];
#endif
    
    // 下拉刷新
    tv.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self onRequestUserList];
    }];
    
    // 上拉刷新
    tv.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self onRequestUserList];
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableViewCell *cell = (UserTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
    UserInfoModelUserList *userInfo = self.userArr[indexPath.row];
    cell.lbl_nick.text = userInfo.nickname;
    
    NSString *avatarUrl = [NSString stringWithFormat:@"http://uc.huway.com/avatar.php?uid=%@&w=48&h=48", userInfo.uid];
    NSURL *url = [NSURL URLWithString:avatarUrl];
    [cell.iv_avatar sd_setImageWithURL:url];
    
    return cell;
}

- (void) backEvent{
    
    [SVProgressHUD showSuccessWithStatus:INT_2_STRING(self.page)];
}
- (void)onRequestUserList {
    NSString *url = @"http://api.huway.org/uc/info/friend";
    NSDictionary *params = @{@"page" : @(self.page),
                             @"pageSize" : @5,
                             @"type" : @2,
                             @"uid" : @(self.uid)};
    
    NSLog([NSString stringWithFormat:@"page::%d", self.page]);
    
    [[HttpUtil instance] startNormalAsyncAction:url param:params model:[UserInfoModel class] ok:^(JSONModel *model) {
        
        [tv.mj_header endRefreshing];
        [tv.mj_footer endRefreshing];
        
        UserInfoModel *userInfoModel = (UserInfoModel *) model;
        [self.userArr addObjectsFromArray:userInfoModel.userList];
        
        [(UITableView *) self.view reloadData];
        self.page++;
        //      [SVProgressHUD showSuccessWithStatus:model.toJSONString];
    }                                        ng:^(NSString *errMsg) {
        [SVProgressHUD showErrorWithStatus:errMsg];
        
    }                               requestType:TYPE_GET needToken:YES];
    
}


@end
