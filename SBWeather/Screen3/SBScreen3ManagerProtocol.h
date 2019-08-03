//
//  SBScreen3ManagerProtocol.h
//  SBWeather
//
//  Created by 17495310 on 31/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

@protocol SBCityProtocol;

@protocol SBScreen3ManagerProtocol <NSObject>

@property (strong, nonatomic) NSArray *listOfNewCities;
@property (nonatomic, strong) id <SBCityProtocol> theNewCity;

-(void)initNewCityWithName:(NSString*)cityName andLatitude:(NSString*)cityLat andLongitude:(NSString*)cityLong;
-(BOOL) validateCoordInput:(UITextField*)textField;

@end
