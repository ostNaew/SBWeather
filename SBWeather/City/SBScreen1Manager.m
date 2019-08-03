//
//  Screen1Manager.m
//  SBWeather
//
//  Created by 17495310 on 30/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "SBScreen1Manager.h"
#import "../Models/SBCityProtocol.h"

#import <Foundation/Foundation.h>

@implementation Screen1Manager

@synthesize countCities;
@synthesize cityList;

-(BOOL)checkAddedCity:(id <SBCityProtocol>)newCity {
    if (newCity.cityName && newCity.cityLatitude && newCity.cityLongitude)
        return YES;
    return NO;
}

- (City *)showCityAtIndex: (NSInteger) index {
    return [self.cityList objectAtIndex:index];
}

- (NSInteger)cityCount {
    return [self.cityList count];
}

- (instancetype) init {
    self = [super init];
    
    if (self) {
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        
        id <SBCityProtocol> aCity = [[City alloc] init];
        id <SBCityProtocol> bCity = [[City alloc] init];
        id <SBCityProtocol> cCity = [[City alloc] init];
        id <SBCityProtocol> dCity = [[City alloc] init];
        
        aCity.cityName = @"Moscow";
        aCity.cityLatitude = 55.7512;
        aCity.cityLongitude = 37.6184;
        
        bCity.cityName = @"Saint Petersburg";
        bCity.cityLatitude = 59.9390;
        bCity.cityLongitude = 30.3158;
        
        cCity.cityName = @"Tula";
        cCity.cityLatitude = 54.2021;
        cCity.cityLongitude = 37.6442;
        
        dCity.cityName = @"Voronezh";
        dCity.cityLatitude = 51.6615;
        dCity.cityLongitude = 39.2002;
        
        [tempArray addObject:aCity];
        [tempArray addObject:bCity];
        [tempArray addObject:cCity];
        [tempArray addObject:dCity];
        
        self.cityList = [tempArray copy];
    }
    return self;
}

-(void)addCityToList:(id <SBCityProtocol>)newCity {
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:self.cityList];
    [tempArr addObject:newCity];
    self.cityList = [tempArr copy];
}

@end
