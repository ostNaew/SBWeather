//
//  SBcreen3ViewController.m
//  SBWeather
//
//  Created by 17495310 on 20/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "SBScreen3ViewController.h"
#import "SBScreen3Manager.h"
#import "../Models/SBCity.h"
#import "SBCityListViewController.h"
#import "../Models/SBCityProtocol.h"

@interface SBScreen3ViewController ()

@property (strong, nonatomic) id <SBScreen3ManagerProtocol> manager;

@end

@implementation SBScreen3ViewController

@synthesize delegate = _delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCityDidClick:)];
    [self.navigationItem setRightBarButtonItem:add];
    self.manager = [[SBScreen3Manager alloc] init];
}

- (void) addCityDidClick:(UIButton *)sender {
    if (!([self.manager validateCoordInput:self.cityLongitudeTextField] && [self.manager validateCoordInput:self.cityLatitudeTextField])) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Invalid Input"
                                                                   message:@"Make sure you are entering coords the right way. Ex. 12.3456"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if (self.cityNameTextField.text.length != 0) {
        [self.manager initNewCityWithName:self.cityNameTextField.text andLatitude:self.cityLatitudeTextField.text andLongitude:self.cityLongitudeTextField.text];
        self.cityNameTextField.text = @"";
        self.cityLatitudeTextField.text = @"";
        self.cityLongitudeTextField.text = @"";
        //delegate
        [self.delegate didTapAddButton:(id)self.manager.theNewCity];
    }
    else {
        UIAlertController* alert2 = [UIAlertController alertControllerWithTitle:@"Invalid Input"
                                                                       message:@"Don't forget to enter City name"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert2 addAction:defaultAction];
        [self presentViewController:alert2 animated:YES completion:nil];
    }
}

@end

