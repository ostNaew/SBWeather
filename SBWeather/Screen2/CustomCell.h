//
//  CustomCell.h
//  SBWeather
//
//  Created by 17495310 on 15/05/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
+ (NSString *) reuseIdentifier;
@property (weak, nonatomic) IBOutlet UILabel *cellMaxTemp;
@property (weak, nonatomic) IBOutlet UILabel *cellMinTemp;
@property (weak, nonatomic) IBOutlet UILabel *cellWind;
@property (weak, nonatomic) IBOutlet UILabel *cellPressure;
@property (weak, nonatomic) IBOutlet UIImageView *cellPicture;
@property (weak, nonatomic) IBOutlet UILabel *cellSummary;

@end
