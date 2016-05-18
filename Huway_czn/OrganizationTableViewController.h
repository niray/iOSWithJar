//
//  OrganizationTableViewController.h
//  Huway_czn
//
//  Created by Huway Mac on 15/11/19.
//  Copyright © 2015年 Android Develope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h> 
@interface OrganizationTableViewController : UITableViewController 
@property (nonatomic ,assign) MKCoordinateRegion theRegion;
@property (nonatomic, strong) MKMapView *mapView;

@end
