//
//  ViewController.m
//  MapKitMapView
//
//  Created by Лолита on 19.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 30, 100, 40)];
//    label.text = @"Hello";
//    [self.view addSubview:label];
    
 
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(55.7522200, 37.6155600);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 1000000, 1000000);
    [mapView setRegion: region animated: YES];
    [self.view addSubview:mapView];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = @"Title";
    annotation.subtitle = @"Subtitle";
    annotation.coordinate = CLLocationCoordinate2DMake(55.7522200, 37.6155600);
    [mapView addAnnotation:annotation];
    [mapView setDelegate:self];
    [self locationFromAddress:@"Москва, Обыденский 2-й переулок, 13"];
    
    
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *identifier = @"MarkerIdentifier";
    MKMarkerAnnotationView *annotationView = (MKMarkerAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView) {
        annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
        annotationView.calloutOffset = CGPointMake(-5.0, 5.0);
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    annotationView.annotation = annotation;
    return annotationView;
}

- (void)addressFromLocation:(CLLocation *)location {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       
        if ([placemarks count] > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"%@", placemark.name);
            }
        }
        
    }];
}

- (void)locationFromAddress:(NSString *)address {

    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if ([placemarks count] > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"%@", placemark.location);
            }
        }
        
    }];
}

- (void)start {
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    //точность
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    locationManager.distanceFilter = 500;
    
    [locationManager startUpdatingLocation];
}

 -(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations firstObject];
    if (location) {
        NSLog(@"%@", location);
    }
}

@end
