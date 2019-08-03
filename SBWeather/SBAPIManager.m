//
//  APIManager.m
//  SBWeather
//
//  Created by 17495310 on 25/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "SBAPIManager.h"
#import "Models/SBCity.h"
#import "SBAPIManager.h"

@implementation APIManager

static APIManager *sharedManager = nil;

- (void)retrieveData:(id <SBCityProtocol>)currentCity completionHandler:(void (^)(NSArray * dataForCity))completionHandler{
    NSString *urlString = [NSString stringWithFormat: @"https://api.darksky.net/forecast/9e5895f7287828326b95ac16d083f94e/%f,%f", currentCity.cityLatitude, currentCity.cityLongitude];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//      additional
        NSData *dayData = [dictionary valueForKey:@"daily"];
        NSArray *dataForCity = [dayData valueForKey:@"data"];        
        if (completionHandler) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(dataForCity);
            });
        }
    }];
    [dataTask resume];
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler{
    
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
        if([challenge.protectionSpace.host isEqualToString:@"api.darksky.net"]){
            NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
        }
    }
}

+(APIManager *) sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[super alloc] init];
    });
    
    return sharedManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
    }
    return self;
}

@end
