//
//  APIManagerProtocol.h
//  SBWeather
//
//  Created by 17495310 on 29/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

@class City;
@protocol SBCityProtocol;

@protocol APIManagerProtocol <NSObject>

- (void)retrieveData:(id <SBCityProtocol>)currentCity completionHandler:(void (^)(NSArray * dataForCity))completionHandler;

@end
