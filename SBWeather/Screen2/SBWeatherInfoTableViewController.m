//
//  WeatherInfoTableViewController.m
//  SBWeather
//
//  Created by 17495310 on 07/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "SBWeatherInfoTableViewController.h"
#import "SBWeatherTableViewCell.h"
#import "SBScreen2Manager.h"
#import "../SBAPIManager.h"
#import "CustomCell.h"

@interface WeatherInfoTableViewController ()

//@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) Screen2Manager *manager;

@end

@implementation WeatherInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    City *currentCity = [[City alloc] init];
    currentCity = self.cityName;
    self.manager = [[Screen2Manager alloc] init];
//регистрация ниба
    UINib *nib = [UINib nibWithNibName:@"CustomCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CustomCellIdentifier"];
//    [self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"CustomCellIdentifier"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.manager.weatherArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CustomCellIdentifier";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    Weather *weather = [self.manager.weatherArray objectAtIndex:indexPath.row];
    cell.cellSummary.text = weather.daySummary;
    cell.cellMaxTemp.text = weather.maxTempForDay;
    cell.cellMinTemp.text = weather.minTempForDay;
    cell.cellPressure.text = weather.dayPressure;
    cell.cellWind.text = weather.dayWind;
    cell.cellPicture.image = weather.dayPicture;
    return cell;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    return UITableViewAutomaticDimension;
//}

//delete
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 110;
//}

@end
