//
//  SBScreen2ViewController.m
//  SBWeather
//
//  Created by 17495310 on 17/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "SBScreen2ViewController.h"
#import "WeatherCell.h"
#import "../Models/SBWeatherProtocol.h"
#import "../Models/SBCityProtocol.h"

@interface SBScreen2ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) id <SBScreen2ManagerProtocol> manager;

@end

@implementation SBScreen2ViewController

@synthesize currentCity = _currentCity;


- (void)viewDidLoad {
    [super viewDidLoad];
    id <SBCityProtocol> currentCity = self.currentCity;
    self.manager = [[Screen2Manager alloc] init];
    UINib *nib2 = [UINib nibWithNibName:NSStringFromClass([WeatherCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:NSStringFromClass([WeatherCell class])];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    //вынести в отдельный метод
    __weak typeof(self) weakSelf = self;
    [self.manager loadDataForCity:currentCity completionHandler:^(NSError * error){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.manager loadWeatherForCity];
        [strongSelf.tableView reloadData];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.manager.weatherArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WeatherCell class])];
    id <SBWeatherProtocol> weather = [self.manager.weatherArray objectAtIndex:indexPath.row];
    cell.cellSummary.text = weather.daySummary;
    cell.cellMaxTemp.text = weather.maxTempForDay;
    cell.cellMinTemp.text = weather.minTempForDay;
    cell.cellPressure.text = weather.dayPressure;
    cell.cellWind.text = weather.dayWind;
    cell.cellImage.image = weather.dayPicture;
    return cell;
}

@end
