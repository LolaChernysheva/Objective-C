//
//  LocationService.h
//  UIComponentsWithoutInterfaceBuilder
//
//  Created by Лолита on 26.01.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#define kLocationServiceDidUpdateCurrentLocation @"LocationServiceDidUpdateCurrentLocation"

@interface LocationService : NSObject <CLLocationManagerDelegate>

@end


