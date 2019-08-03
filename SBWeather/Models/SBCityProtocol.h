//
//  SBCityProtocol.h
//  SBWeather
//
//  Created by 17495310 on 29/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SBCityProtocol

@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, assign) CGFloat cityLongitude;
@property (nonatomic, assign) CGFloat cityLatitude;

-(instancetype)initCitywithName:(NSString *) cityName;

@end
