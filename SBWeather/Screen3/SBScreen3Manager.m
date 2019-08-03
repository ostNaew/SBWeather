//
//  SBScreen3Manager.m
//  SBWeather
//
//  Created by 17495310 on 20/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "SBScreen3Manager.h"

@implementation SBScreen3Manager

@synthesize listOfNewCities = _listOfNewCities;
@synthesize theNewCity = _newCity;

-(BOOL)validateCoordInput:(UITextField*)textField {
    NSRange dotRange = [textField.text rangeOfString:@"."];
    if (dotRange.length == 1 && textField.text.length > dotRange.location + 1)
        return YES;
    return NO;
}

-(void)initNewCityWithName:(NSString*)cityName andLatitude:(NSString*)cityLat andLongitude:(NSString*)cityLong{
    self.theNewCity = [[City alloc] init];
    self.theNewCity.cityName = cityName;
    NSString *newStringForLat = [NSString stringWithFormat:@"%.4f",[cityLat floatValue]];
    self.theNewCity.cityLatitude = [newStringForLat floatValue];
    NSString *newStringForLong = [NSString stringWithFormat:@"%.4f",[cityLong floatValue]];
    self.theNewCity.cityLongitude = [newStringForLong floatValue];
}

@end
