//
//  MARReachability.m
//  Pods
//
//  Created by Maru on 2017/2/25.
//
//

#import "MARReachability.h"
#import "MARKernel.h"

@implementation MARReachability

+ (instancetype)shareInstance {
    static MARReachability *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MARReachability alloc] init];
    });
    return instance;
}

- (RACSignal *)startMonitoring {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            [subscriber sendNext:@(status)];
        }];
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

@end
