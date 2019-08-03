//
//  Screen2Manager.h
//  SBWeather
//
//  Created by 17495310 on 07/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Models/SBWeather.h"
#import "../Models/SBCity.h"
#import "../APIManagerProtocol.h"
#import "SBScreen2ManagerProtocol.h"

@interface Screen2Manager : NSObject <SBScreen2ManagerProtocol>

@property (nonatomic, strong) NSArray *dataForCity;
@property (nonatomic, strong) NSArray *weatherArray;
@property (nonatomic, strong) id <SBCityProtocol> currentCity;
@property (nonatomic, strong) id <APIManagerProtocol> apiManager;

-(void)loadDataForCity:(id <SBCityProtocol>) currentCity completionHandler:(void (^)(NSError * error))completionHandler;
-(void)loadWeatherForCity;
-(instancetype)init;
- (NSString *)transformFahrenheitToCelcius:(float) fahrenheit;
@end

