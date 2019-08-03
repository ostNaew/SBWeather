//
//  City.m
//  SBWeather
//
//  Created by 17495310 on 25/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "SBCity.h"

@implementation City

@synthesize cityLatitude;
@synthesize cityLongitude;
@synthesize cityName;

-(instancetype)initCitywithName:(NSString *) cityName {
    self = [super init];
    self.cityName = cityName;
    return self;
}



@end
