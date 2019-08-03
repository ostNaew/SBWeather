//
//  SBScreen2ViewController.h
//  SBWeather
//
//  Created by 17495310 on 17/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBWeatherInfoTableViewController.h"
#import "SBWeatherTableViewCell.h"
#import "SBScreen2Manager.h"
#import "../SBAPIManager.h"
#import "CustomCell.h"
#import "../Models/SBCityProtocol.h"


@interface SBScreen2ViewController : UIViewController

@property (strong, nonatomic) id <SBCityProtocol> currentCity;

@end

