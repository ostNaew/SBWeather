//
//  SBcreen3ViewController.h
//  SBWeather
//
//  Created by 17495310 on 20/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBCityListViewController.h"
#import "../Models/SBCity.h"
#import "Screen3Delegate.h"

@interface SBScreen3ViewController :UIViewController

//delegate
@property (nonatomic, assign) id <Screen3Delegate> delegate;
//delegate

@property (strong, nonatomic) IBOutlet UIView *screenView;
@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityLatitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityLongitudeTextField;

@end

