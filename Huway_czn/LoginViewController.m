//
//  LoginViewController.m
//  Huway_czn
//
//  Created by Huway Mac on 15/11/19.
//  Copyright © 2015年 Android Develope. All rights reserved.
//

#import <AFNetworking/AFNetworkReachabilityManager.h>
#import "LoginViewController.h"
#import <AFHTTPRequestOperationManager.h>
#import "AFHTTPRequestOperation.h"
#import "SVProgressHUD.h"
#import "UserLoginModel.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *bbtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onCancel)];
    self.navigationItem.leftBarButtonItem = bbtn;
    
    self.tfAccount.text=@"huway";
    self.tfPWD.text  =@"72@huway";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onLoginClick:(id)sender {

    NSString *postUrl = @"http://api.huway.org/uc/login";

    NSDictionary *parameters = @{@"username" : self.tfAccount.text,
            @"password" : self.tfPWD.text};


    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/plain", @"text/html", nil];
//     manager.requestSerializer = []

    AFHTTPRequestSerializer *request = [[AFHTTPRequestSerializer alloc] init];

    [request setValue:@"4" forHTTPHeaderField:@"Request-Source"];
    [request setValue:@"text/json" forHTTPHeaderField:@"Request-Type"];
    [request setValue:@"v_1_0" forHTTPHeaderField:@"version"];

    manager.requestSerializer = request;

    [SVProgressHUD show];

    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);

        UserLoginModel *bean = [[UserLoginModel alloc] initWithDictionary:responseObject error:NULL];

        //   [self.iv_show sd_setImageWithURL:[NSURL URLWithString:b2.pic]];

        [SVProgressHUD showSuccessWithStatus:bean.userInfo.nickname];
        
        
        [self onSuccess:bean.userInfo.token andUID:bean.userInfo.uid];
           
    }     failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        [SVProgressHUD showErrorWithStatus:error.description];
        NSLog(@"Error: %@", operation.responseString);
    }];

}

- (void)onSuccess:(NSString*) token andUID:(NSInteger) uid{
    //存值
    [[NSUserDefaults standardUserDefaults] setValue:token forKey:@"token"];
    [[NSUserDefaults standardUserDefaults] setValue:@(uid) forKey:@"uid"];
    //取值
    [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    //同步
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)onCancel {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
