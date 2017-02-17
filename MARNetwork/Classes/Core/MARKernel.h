//
//  MARKernel.h
//  MARNetwork
//
//  Created by Maru on 2017/2/16.
//  Copyright © 2017年 alloc. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include("ReactiveCocoa.h")
#import "ReactiveCocoa.h"
#else
#import <ReactiveObjC/ReactiveObjC.h>
#endif

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

typedef void(^MARManagerConfig)(AFHTTPSessionManager *manager);
typedef void(^MARSessionConfig)(NSURLSessionConfiguration *configureation);

@interface MARKernel : NSObject

/// Single Instance
+ (instancetype)shareInstance;

/// load config dictionary from specific URL.
+ (void)loadConfigFromURL:(NSURL *)url;


/// Register a Channel For MARNetwork, Notice: ====> baseURL should end with "\" character !!!!
- (void)registerChannelWithName:(NSString *)channelName
                        baseURL:(NSString *)url
                managerCallBack:(MARManagerConfig)managerCallBack
                 configCallBack:(MARSessionConfig)sessionCallBack;
/// fetch domain string belong to a specific channel
- (NSString *)domainFromChannel:(NSString *)channel;
/// fetch a http session manager belong to a specific channel.
- (AFHTTPSessionManager *)managerFromChannel:(NSString *)channel;

@end
