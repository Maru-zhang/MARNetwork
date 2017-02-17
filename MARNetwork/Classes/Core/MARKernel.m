//
//  MARKernel.m
//  MARNetwork
//
//  Created by Maru on 2017/2/16.
//  Copyright © 2017年 alloc. All rights reserved.
//

#import "MARKernel.h"

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <ReactiveObjc/ReactiveObjc.h>
#else
#import "ReactiveObjc.h"
#endif

typedef enum : NSUInteger {
    MARHTTPMethodTypeGET    = 0,
    MARHTTPMethodTypePOST   = 1,
    MARHTTPMethodTypePUT    = 2,
    MARHTTPMethodTypeDELETE = 3,
    MARHTTPMethodTypeHEAD   = 4,
    MARHTTPMethodTypeCONNECT= 5,
    MARHTTPMethodTypeOPTIONS= 6,
    MARHTTPMethodTypeTRACE  = 7,
} MARHTTPMethodType;

static const NSMutableDictionary *MAR_HTTP_SESSION_MANAGERS;

@interface MARKernel ()
@property (nonatomic, strong, readwrite) AFHTTPSessionManager *manager;
@property (nonatomic, strong) NSDictionary *configPlist;
@end
@implementation MARKernel

#pragma mark - Static Method

+ (void)load { [self setupStaticStuff]; }

+ (instancetype)shareInstance {
    static MARKernel *kernel;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kernel = [[MARKernel alloc] init];
    });
    return kernel;
}

+ (void)setupStaticStuff {
    MAR_HTTP_SESSION_MANAGERS = @{}.mutableCopy;
}

+ (void)loadConfigFromURL:(NSURL *)url {
    NSAssert(url, @"The config file url couldn't be nil!");
    [MARKernel shareInstance].configPlist = [NSDictionary dictionaryWithContentsOfURL:url];
}

#pragma mark - Initialize

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - Public Method

- (NSString *)domainFromChannel:(NSString *)channel {
    return [[self.configPlist objectForKey:channel] objectForKey:@"Domain"];
}

- (AFHTTPSessionManager *)managerFromChannel:(NSString *)channel {
    // Lazy load
    if (MAR_HTTP_SESSION_MANAGERS) {
        AFHTTPSessionManager *manager = [MAR_HTTP_SESSION_MANAGERS objectForKey:channel];
        if (manager) {
            return manager;
        }else {
            NSDictionary *channel = [self.configPlist objectForKey:channel];
            if (channel) {
                // create a manager from specific manager and save to dic.
                NSString *baseURL = [channel objectForKey:@"Domain"];
                NSString *identifier = [channel objectForKey:@"Identifier"];
                NSNumber *requestCachePolicy = [channel objectForKey:@"RequestCachePolicy"];
                NSNumber *timeoutIntervalForRequest = [channel objectForKey:@"TimeoutIntervalForRequest"];
                NSNumber *timeoutIntervalForResource = [channel objectForKey:@"TimeoutIntervalForResource"];
                NSURLSessionConfiguration *configureation = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:identifier];
                /// look up the map in `NSURLRequestCachePolicy`.
                configureation.requestCachePolicy = [requestCachePolicy integerValue];
                configureation.timeoutIntervalForRequest = [timeoutIntervalForRequest doubleValue];
                configureation.timeoutIntervalForResource = [timeoutIntervalForResource doubleValue];
                manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseURL] sessionConfiguration:configureation];
                /// store manager to dic.
                [MAR_HTTP_SESSION_MANAGERS setObject:manager forKey:channel];
                return manager;
            }else {
                return [self defaultManager];
            }
        }
    }else {
        return [self defaultManager];
    }
}

#pragma mark - Private Method

- (AFHTTPSessionManager *)defaultManager {
    return [AFHTTPSessionManager manager];
}



@end
