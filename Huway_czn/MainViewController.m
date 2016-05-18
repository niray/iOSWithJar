//
//  HomeViewController.m
//  Huway_czn
//
//  Created by Huway Mac on 15/11/19.
//  Copyright © 2015年 Android Develope. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if ([tabBarController.viewControllers indexOfObject:viewController] == 3) {

        NSString *token = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
        if (token.length == 0) {
            UIStoryboard *usb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UINavigationController *lvc = [usb instantiateViewControllerWithIdentifier:@"LoginNvg"];

            [self presentViewController:lvc animated:YES completion:^{

            }];
            return NO;
        }
//        [self.navigationController pushViewController:lvc animated:YES];

        return YES;
    }
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    int index = [tabBarController.viewControllers indexOfObject:viewController];
    NSLog(@"%d", index);

}
@end
