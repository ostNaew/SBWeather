//
//  SBScreen2ManagerProtocol.h
//  SBWeather
//
//  Created by 17495310 on 31/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

@protocol SBCityProtocol;

@protocol SBScreen2ManagerProtocol <NSObject>

@property (nonatomic, strong) NSArray *dataForCity;
@property (nonatomic, strong) NSArray *weatherArray;
@property (nonatomic, strong) id <SBCityProtocol> currentCity;
@property (nonatomic, strong) id <APIManagerProtocol> apiManager;

-(void)loadDataForCity:(id <SBCityProtocol>) currentCity completionHandler:(void (^)(NSError * error))completionHandler;
-(void)loadWeatherForCity;
-(instancetype)init;
- (NSString *)transformFahrenheitToCelcius:(float) fahrenheit;

@end
