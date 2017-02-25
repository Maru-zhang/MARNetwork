//
//  MARReachability.h
//  Pods
//
//  Created by Maru on 2017/2/25.
//
//

#import <Foundation/Foundation.h>
@class RACSignal;

@interface MARReachability : NSObject

/// Single Instance
+ (instancetype)shareInstance;

/// return a signal that send AFNetworkReachabilityStatus value.
- (RACSignal *)startMonitoring;

@end
