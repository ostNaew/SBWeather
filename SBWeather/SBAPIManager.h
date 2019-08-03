//
//  APIManager.h
//  SBWeather
//
//  Created by 17495310 on 25/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBAPIManager.h"
#import "APIManagerProtocol.h"

@class City;
@protocol APIManagerProtocol;

@interface APIManager : NSObject <APIManagerProtocol, NSURLSessionDelegate>

@property (strong, nonatomic) NSURLSession *session;

+(APIManager *) sharedManager;

@end
