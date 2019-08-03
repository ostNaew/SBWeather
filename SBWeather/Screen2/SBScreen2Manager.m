//
//  Screen2Manager.m
//  SBWeather
//
//  Created by 17495310 on 07/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "SBScreen2Manager.h"
#import "../SBAPIManager.h"

//@property (nonatomic, strong) id<MyProtocol> apiSrvice;

@implementation Screen2Manager

@synthesize dataForCity = _dataForCity;
@synthesize weatherArray = _weatherArray;
@synthesize apiManager = _apiManager;

- (id <SBWeatherProtocol>)loadWeatherForDay:(NSInteger) index {
    return [self.weatherArray objectAtIndex:index];
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.apiManager = [[APIManager alloc] init];
    }
    return self;
}

-(void)loadDataForCity:(id <SBCityProtocol>) currentCity completionHandler:(void (^)(NSError * error))compHandler{
    __weak typeof(self) weakSelf = self;
    NSError *error;
    [self.apiManager retrieveData:currentCity completionHandler:^(NSArray *dataForCity) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.dataForCity = dataForCity;
        if (compHandler) {
            compHandler(error);
        }
    }];
}
- (id<SBCityProtocol>)wetherObjectForIndexPath:(NSInteger) index {
    return [self.weatherArray objectAtIndex:index];
}

-(void)loadWeatherForCity {
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *weatherDict in self.dataForCity) {
        id <SBWeatherProtocol> weatherObject = [[Weather alloc] init];
        weatherObject.minTempForDay = [self transformFahrenheitToCelcius:[weatherDict[@"temperatureMin"] floatValue]];
        weatherObject.maxTempForDay = [self transformFahrenheitToCelcius:[weatherDict[@"temperatureMax"] floatValue]];
        weatherObject.dayPressure = [NSString stringWithFormat:@"P %.0f", [weatherDict[@"pressure"] floatValue]];
        weatherObject.dayWind = [NSString stringWithFormat:@"Wind %.0f м/с", [weatherDict[@"windSpeed"]floatValue]];
        weatherObject.daySummary = weatherDict[@"summary"];
        NSString *iconType = weatherDict[@"icon"];
        weatherObject.dayPicture = [self getPictureForDay:iconType];
        [tempArray addObject:weatherObject];
    }
    self.weatherArray = [NSArray arrayWithArray:tempArray];
}

- (UIImage *) getPictureForDay:(NSString *) iconName {
    if ([iconName isEqualToString:@"rain"])
        return [UIImage imageNamed:@"rain.png"];
    else if ([iconName isEqualToString:@"fog"])
        return [UIImage imageNamed:@"fog.png"];
    else if ([iconName isEqualToString:@"snow"])
        return [UIImage imageNamed:@"snow.png"];
    else if ([iconName isEqualToString:@"sleet"])
        return [UIImage imageNamed:@"sleet.png"];
    else if ([iconName isEqualToString:@"wind"])
        return [UIImage imageNamed:@"windy.png"];
    else if ([iconName isEqualToString:@"cloudy"])
        return [UIImage imageNamed:@"cloudy.png"];
    else if ([iconName isEqualToString:@"party-cloudy-day"] || [iconName isEqualToString:@"party-cloudy-night"])
        return [UIImage imageNamed:@"parylycloudy.png"];
    else if ([iconName isEqualToString:@"clear-day"] || [iconName isEqualToString:@"clear-night"])
        return [UIImage imageNamed:@"clear.png"];
    return [UIImage imageNamed:@"clear.png"];
}

- (NSString *) transformFahrenheitToCelcius: (float) fahrenheit {
    NSString *returnString = [NSString stringWithFormat:@"%.0f C",(fahrenheit - 32.0) * (5.0 / 9.0)];
    return returnString;
}

@end



