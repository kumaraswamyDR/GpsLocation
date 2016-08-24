//
//  ViewController.m
//  GpsLocation
//
//  Created by Kumaraswamy D R on 11/04/16.
//  Copyright © 2016 Razorthink. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UILabel *latLabel,*longLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (locationManager == nil)
    {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        locationManager.delegate = self;
        [locationManager requestAlwaysAuthorization];
    }
    [locationManager startUpdatingLocation];
    [self createViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createViews
{
    _latLabel  = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 200, 50)];
    _longLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 150, 200, 50)];
     [self.view addSubview:_latLabel];
     [self.view addSubview:_longLabel];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
   _latLabel.text  =  [NSString stringWithFormat:@"%f",newLocation.coordinate.latitude];
   _longLabel.text =  [NSString stringWithFormat:@"%f",newLocation.coordinate.longitude];
    NSLog(@"OldLocation %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    NSLog (@"accuracy: H:%.2f, V:%.2f", newLocation.horizontalAccuracy, newLocation.verticalAccuracy);
}
@end
