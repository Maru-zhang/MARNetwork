//
//  MARKernel.h
//  MARNetwork
//
//  Created by Maru on 2017/2/16.
//  Copyright © 2017年 alloc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFHTTPSessionManager;


@interface MARKernel : NSObject

@property (nonatomic, strong, readonly) AFHTTPSessionManager *manager;

+ (instancetype)shareInstance;

/// load config dictionary from specific URL.
+ (void)loadConfigFromURL:(NSURL *)url;

/// fetch domain string belong to a specific channel
- (NSString *)domainFromChannel:(NSString *)channel;
/// fetch a http session manager belong to a specific channel.
- (AFHTTPSessionManager *)managerFromChannel:(NSString *)channel;

@end
