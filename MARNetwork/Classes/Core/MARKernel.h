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
