//
//  OrganizationTableViewController.m
//  Huway_czn
//
//  Created by Huway Mac on 15/11/19.
//  Copyright © 2015年 Android Develope. All rights reserved.
//

#import "OrganizationTableViewController.h"

@interface OrganizationTableViewController (){
    UITableView *uiTbv;
}

@end

@implementation OrganizationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    uiTbv =(UITableView*) self.view;
    
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0 , self.view.frame.size.width, 330)];
    
//    self.locationManager = LocationManeger.instance;
//    self.locationManager.instance
//    [self.view addSubview:self.mapView];

    
    
    UIButton *btnSelf = [[ UIButton alloc]initWithFrame:CGRectMake(50,self.view.frame.size.height-160, 50, 50)];
    btnSelf.backgroundColor=[UIColor redColor];
    [btnSelf setTitle:@"の"forState:normal];
    [btnSelf setTitle:@"丶"forState:UIControlStateSelected];
    [btnSelf setSelected:YES];
    [btnSelf addTarget:self action:@selector(toSelf) forControlEvents:UIControlEventTouchUpInside];
    
 
    self.mapView.scrollEnabled = NO;
 //   [self.view addSubview:btnSelf];
    uiTbv.tableHeaderView =self.mapView;
}

-(void) toSelf{
    [self.mapView setRegion:self.theRegion];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.mapView.frame = self.view.frame;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
  //  [[LocationManager instance] startLocationWithCallback:^{
   //     CLLocationCoordinate2D loc = [LocationManager instance].currLocation;
        
   //
   //     MKCoordinateSpan theSpan;
        //地图的范围 越小越精确
   //     theSpan.latitudeDelta=0.05;
   //     theSpan.longitudeDelta=0.05;
        
   //     self.theRegion = MKCoordinateRegionMake(loc, theSpan);
   //     [self toSelf];
//        self.mapView.mapType = normal;

  //  }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { 
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 133)];
    cell.textLabel .text= [NSString stringWithFormat:@"%ldA",indexPath.row];
    
    return cell;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
