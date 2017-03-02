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
#import <ReactiveObjC/ReactiveObjc.h>
#endif

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

extern NSString *const MARMainChannelKey;

typedef void(^MARManagerConfig)(AFHTTPSessionManager *manager);
typedef void(^MARSessionConfig)(NSURLSessionConfiguration *configureation);

typedef enum : NSUInteger {
    MARHTTPMethodTypeGET     = 0,
    MARHTTPMethodTypePOST    = 1,
    MARHTTPMethodTypePUT     = 2,
    MARHTTPMethodTypeDELETE  = 3,
    MARHTTPMethodTypeHEAD    = 4,
} MARHTTPMethodType;

@interface MARKernel : NSObject

/// Single Instance
+ (instancetype)shareInstance;

/// Register Main Channel For MARNetwork
- (void)registerMainChannelWithBaseURL:(NSString *)url
                       managerCallBack:(MARManagerConfig)managerCallBack
                        configCallBack:(MARSessionConfig)sessionCallBack;

/// Register a Channel For MARNetwork With a specific identifier
- (void)registerChannelWithName:(NSString *)channelName
                        baseURL:(NSString *)url
                managerCallBack:(MARManagerConfig)managerCallBack
                 configCallBack:(MARSessionConfig)sessionCallBack;

/// fetch domain string belong to a specific channel
- (NSString *)domainFromChannel:(NSString *)channel;

/// fetch a http session manager belong to a specific channel
- (AFHTTPSessionManager *)managerFromChannel:(NSString *)channel;

@end
