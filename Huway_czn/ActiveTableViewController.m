//
//  ActiveTableViewController.m
//  Huway_czn
//
//  Created by Huway Mac on 15/11/19.
//  Copyright © 2015年 Android Develope. All rights reserved.
//

#import "ActiveTableViewController.h"
#import "SVProgressHUD.h"

@interface ActiveTableViewController () {
    UITableView *tbv;
}

@end

@implementation ActiveTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *date = [[NSDate date] description];
    [SVProgressHUD showSuccessWithStatus:date];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBack:) name:@"imback" object:nil];
    tbv = (UITableView *) self.view;
    
    
//    self.viewArray = [NSMutableArray alloc];
    self.viewArray = [NSMutableArray array];
//    self.viewArray = [[NSMutableArray alloc] init];
//    self.viewArray = [NSMutableArray new];
    
    CGFloat ssize = [UIScreen alloc].bounds.size.width;
    
    UIView *lbl = [[UIView alloc]initWithFrame:CGRectMake(333, 0, ssize, 333)];
    lbl.backgroundColor=[UIColor redColor];
    
    
    
    
    UILabel *lbl2 = [[UILabel alloc]init];
    [lbl2 sizeToFit];
    lbl2.text=@"label 2 ";
    lbl2.backgroundColor=[UIColor blueColor];
    
    
    
    
    UILabel *lbl3 = [[UILabel alloc]init];
    [lbl3 sizeToFit];
    lbl3.text=@"label 3 ";
    lbl3.backgroundColor=[UIColor greenColor];
    
    [self.viewArray addObject:lbl];
    [self.viewArray addObject:lbl2];
    [self.viewArray addObject:lbl3];
    
    tbv.tableHeaderView = [self getScrollView] ;
    
}

-(UIScrollView*)getScrollView{
    if(self.banner)  return self.banner;
    self.banner = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 350)] ;
    self.banner.pagingEnabled = YES;
    self.banner.delegate = self;
    
    int count =(int) self.viewArray.count;
    
    CGFloat mScreenWidth = [UIScreen mainScreen].bounds.size.width;
    
    for (int i = 0; i < count; i++) {
        CGFloat x = i * mScreenWidth;
//        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(x, 0, mScreenWidth, 300)];
        
        UIView *v = ((UIView*)self.viewArray[i]);
        v.frame=CGRectMake(x,0, mScreenWidth, 350);
        

        v.backgroundColor = [UIColor colorWithRed:((float)(arc4random() % 100))/ 100.0f
                                            green:((float)(arc4random() % 100))/ 100.0f
                                             blue:((float)(arc4random() % 100))/ 100.0f
                                            alpha:1];
  
         [self.banner addSubview:v];
    
//        [iv sd_setimage]
        
    }
    
    self.banner.contentSize = CGSizeMake(mScreenWidth * count, 350);
    self.banner.backgroundColor=[UIColor blackColor];
    return self.banner;
}

#pragma mark - UIScrollView Delegate 方法分隔线
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{ 
    CGFloat mScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat offsetX = self.banner.contentOffset.x;
    int currPage = (int)offsetX / mScreenWidth;
    
}


- (void)onBack:(NSNotification *)note {
    NSDictionary *my = note.userInfo;
    [SVProgressHUD showSuccessWithStatus:my[@"name"]];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

//即将显示
- (void)viewWillAppear:(BOOL)animated {
    [SVProgressHUD showSuccessWithStatus:@"viewWillAppear"];
}

//显示完成
- (void)viewDidAppear:(BOOL)animated {
    [SVProgressHUD showSuccessWithStatus:@"viewDidAppear"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 330  )];
    cell.backgroundColor=[UIColor redColor];
    cell.textLabel.text=[NSString stringWithFormat:@"%ldpath",indexPath.row];
    return cell;
}


@end
