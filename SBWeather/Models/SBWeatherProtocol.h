//
//  SBWeatherProtocol.h
//  SBWeather
//
//  Created by 17495310 on 29/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

@protocol SBWeatherProtocol

@property (strong, nonatomic) NSString *maxTempForDay;
@property (strong, nonatomic) NSString *minTempForDay;
@property (strong, nonatomic) NSString *dayPressure;
@property (strong, nonatomic) NSString *dayWind;
@property (strong, nonatomic) NSString *daySummary;
@property (strong, nonatomic) UIImage *dayPicture;

@end
