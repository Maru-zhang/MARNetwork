//
//  MARKernel.m
//  MARNetwork
//
//  Created by Maru on 2017/2/16.
//  Copyright © 2017年 alloc. All rights reserved.
//

#import "MARKernel.h"

static NSString *const MARConfigDomainKey       = @"Domain";
static NSString *const MARConfigIdentifierKey   = @"Identifier";
static NSString *const MARConfigCachePolicyKey  = @"RequestCachePolicy";
static NSString *const MARConfigRequestTimeout  = @"TimeoutIntervalForRequest";
static NSString *const MARConfigResourceTimeout = @"TimeoutIntervalForResource";

static const NSMutableDictionary *MAR_HTTP_SESSION_MANAGERS;

@interface MARKernel ()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
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
        _manager = [AFHTTPSessionManager manager];
    }
    return self;
}

#pragma mark - Public Method

- (NSString *)domainFromChannel:(NSString *)channel {
    return [[self.configPlist objectForKey:channel] objectForKey:MARConfigDomainKey];
}

- (void)registerChannelWithName:(NSString *)channelName baseURL:(NSString *)url managerCallBack:(MARManagerConfig)managerCallBack configCallBack:(MARSessionConfig)sessionCallBack {
    if ([MAR_HTTP_SESSION_MANAGERS objectForKey:channelName]) {
        return;
    }else {
        // create new session manager for this channel
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        if (sessionCallBack) {
            sessionCallBack(configuration);
        }else {
            // default configure
            configuration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
            configuration.timeoutIntervalForRequest = 5.0f;
            configuration.timeoutIntervalForResource = 5.0f;
        }
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:url] sessionConfiguration:configuration];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
        if (managerCallBack) {
            managerCallBack(manager);
        }
        // store manager to dic.
        [MAR_HTTP_SESSION_MANAGERS setObject:manager forKey:channelName];
    }
}

- (AFHTTPSessionManager *)managerFromChannel:(NSString *)channel {
    // Lazy load
    AFHTTPSessionManager *manager = [MAR_HTTP_SESSION_MANAGERS objectForKey:channel];
    if (manager) {
        return manager;
    }else {
        return [self defaultManager];
    }
}

#pragma mark - Private Method

- (AFHTTPSessionManager *)defaultManager {
    return _manager;
}

#pragma mark - Property

- (NSDictionary *)configPlist {
    if (!_configPlist) {
        _configPlist = @{};
    }
    return _configPlist;
}

@end
