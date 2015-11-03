//
//  ViewController.m
//  地理编码
//
//  Created by 章芝源 on 15/11/3.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()
@property(nonatomic, strong)CLGeocoder *geocoder;
@end

@implementation ViewController

#pragma mark - lazy
- (CLGeocoder *)geocoder
{
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc]init];
    }
    return _geocoder;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   

}

///编码
- (IBAction)geoCoder:(id)sender {
   
    NSString *str = @"章村";
    [self.geocoder geocodeAddressString:str completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        for (CLPlacemark *placemark in placemarks) {
            
            CLLocation *loc = placemark.location;
            
            NSLog(@"%@    %f,   %f", placemark.name, loc.coordinate.latitude, loc.coordinate.longitude);
        }
    }];
}

///反地理编码
- (IBAction)reverseCoder:(id)sender {
    
    ///需要一个地理经纬度
    CLLocation *location = [[CLLocation alloc]initWithLatitude:40 longitude:116];
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        CLPlacemark *p = placemarks.firstObject;
        
        NSLog(@"%@", p.name);
    }];
}

@end
