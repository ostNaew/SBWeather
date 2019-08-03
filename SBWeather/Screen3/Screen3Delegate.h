//
//  Screen3Delegate.h
//  SBWeather
//
//  Created by 17495310 on 21/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

@class City;

@protocol Screen3Delegate <NSObject>

@required
-(void)didTapAddButton:(id <SBCityProtocol>) newCity;

@end
