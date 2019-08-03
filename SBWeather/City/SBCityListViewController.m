//
//  CityListViewController.m
//  SBWeather
//
//  Created by 17495310 on 30/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "SBCityListViewController.h"
#import "../Screen2/SBWeatherInfoTableViewController.h"
#import "SBScreen1Manager.h"
#import "../Screen2/SBScreen2ViewController.h"
#import "../Screen3/SBScreen3ViewController.h"
#import "../Models/SBCityProtocol.h"

@interface CityListViewController () <UITableViewDelegate, UITableViewDataSource, Screen3Delegate>

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) NSArray *content;
@property (strong, nonatomic) id <FirstScreenProtocol> manager;

@end

@implementation CityListViewController

//delegate
-(void) didTapAddButton:(id <SBCityProtocol>)newCity {
        [self.manager addCityToList:newCity];
        [self.table reloadData];
}
//delegate

- (void) configureTableView {
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manager = [[Screen1Manager alloc] init];
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCity:)];
    [self.navigationItem setRightBarButtonItem:add];
    [self configureTableView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.table];
    self.table.translatesAutoresizingMaskIntoConstraints = false;
    UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.table.topAnchor constraintEqualToAnchor:guide.topAnchor constant:0],
                                              [self.table.leftAnchor constraintEqualToAnchor:guide.leftAnchor constant:0],
                                              [self.table.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor constant:0],
                                              [self.table.rightAnchor constraintEqualToAnchor:guide.rightAnchor constant:0],
                                              ]];
    
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.manager cityCount];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    id <SBCityProtocol> cellCity = [[City alloc] init];
    cellCity = [self.manager showCityAtIndex:indexPath.row];
    cell.textLabel.text = [cellCity cityName];
    cell.textLabel.font = [UIFont fontWithName:@"ArialMT" size:42];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    Переход на второй экран через сторибоард
    NSString * storyboardIdentifier = @"SBScreen2";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardIdentifier bundle: [NSBundle mainBundle]];
    SBScreen2ViewController *secondScreenViewController = [storyboard instantiateViewControllerWithIdentifier:@"SecondScreen"];
    secondScreenViewController.currentCity = [self.manager showCityAtIndex:indexPath.row];
    [self.navigationController pushViewController:secondScreenViewController animated:YES];   
//    вызов нового контроллера
//    WeatherInfoTableViewController *secondScreen = [[WeatherInfoTableViewController alloc] init];
//    secondScreen.cityName = [self.manager showCityAtIndex:indexPath.row];
//    [self presentViewController:secondScreen animated:YES completion:nil];
}

- (void)addCity:(UIBarButtonItem*)sender {
    NSString * storyboardIdentifier = @"Screen3";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardIdentifier bundle: [NSBundle mainBundle]];
    SBScreen3ViewController * thirdScreenViewController = [storyboard instantiateViewControllerWithIdentifier:@"thirdScreen"];
    //adding delegate
    thirdScreenViewController.delegate = self;
    [self.navigationController pushViewController:thirdScreenViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
