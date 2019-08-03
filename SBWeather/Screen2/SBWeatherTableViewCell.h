//
//  WeatherTableViewCell.h
//  SBWeather
//
//  Created by 17495310 on 08/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *maxTempForCell;
@property (weak, nonatomic) IBOutlet UILabel *minTempForCell;
@property (weak, nonatomic) IBOutlet UILabel *dateForCell;
@property (weak, nonatomic) IBOutlet UIImageView *PicForCell;

@end
