//
//  WeatherCell.h
//  SBWeather
//
//  Created by 17495310 on 17/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *cellMaxTemp;
@property (weak, nonatomic) IBOutlet UILabel *cellMinTemp;
@property (weak, nonatomic) IBOutlet UILabel *cellWind;
@property (weak, nonatomic) IBOutlet UILabel *cellPressure;
@property (weak, nonatomic) IBOutlet UILabel *cellSummary;

@end

NS_ASSUME_NONNULL_END
