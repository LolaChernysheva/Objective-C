//
//  Location.h
//  TestProject
//
//  Created by Лолита on 06.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Locality.h"
#import "County.h"
#import "Country.h"
#import "Region.h"
#import "Neighbourhood.h"

NS_ASSUME_NONNULL_BEGIN

@interface Location : NSObject

@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, copy) NSString *accuracy;
@property (nonatomic, copy) NSString *context;
@property (nonatomic, strong) Locality *locality;
@property (nonatomic, strong) County *county;
@property (nonatomic, strong) Region *region;
@property (nonatomic, strong) Country *country;
@property (nonatomic, strong) Neighbourhood *neighbourhood;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;



@end

NS_ASSUME_NONNULL_END
