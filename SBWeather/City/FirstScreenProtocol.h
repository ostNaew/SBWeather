//
//  FirstScreenProtocol.h
//  SBWeather
//
//  Created by 17495310 on 31/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

@protocol SBCityProtocol;

@protocol FirstScreenProtocol <NSObject>

@property (strong,nonatomic) NSArray *cityList;
@property (nonatomic) NSUInteger countCities;

- (id <SBCityProtocol>)showCityAtIndex: (NSInteger) index;
- (NSInteger) cityCount;
- (instancetype) init;
- (void)addCityToList:(id <SBCityProtocol>)newCity;
- (BOOL)checkAddedCity:(id <SBCityProtocol>)newCity;

@end
