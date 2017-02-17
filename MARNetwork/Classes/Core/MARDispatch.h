//
//  MARDispatch.h
//  Pods
//
//  Created by Maru on 2017/2/17.
//
//

#import <Foundation/Foundation.h>
#import "MARPackage.h"
@class MARPackage;

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <ReactiveObjc/ReactiveObjc.h>
#else
#import "ReactiveObjc.h"
#endif

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

@interface MARDispatch : NSObject

+ (RACSignal *)deliverWithPackage:(MARPackage *)package channel:(NSString *)channel;

@end

@interface AFHTTPSessionManager (MARExtension)

- (void)taskWithURL:(NSString *)url
             method:(MARHTTPMethodType)method
         parameters:(nullable id)parameters
            success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
            failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

@end
