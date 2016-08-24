//
//  ViewController.h
//  GpsLocation
//
//  Created by Kumaraswamy D R on 11/04/16.
//  Copyright © 2016 Razorthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}



@end

