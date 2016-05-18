//
//  LoginViewController.h
//  Huway_czn
//
//  Created by Huway Mac on 15/11/19.
//  Copyright © 2015年 Android Develope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tfAccount;
@property (weak, nonatomic) IBOutlet UITextField *tfPWD;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
- (IBAction)onLoginClick:(id)sender;

@end
