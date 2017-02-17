//
//  MARDispatch.h
//  Pods
//
//  Created by Maru on 2017/2/17.
//
//

#import <Foundation/Foundation.h>
#import "MARKernel.h"
#import "MARPackage.h"

@class MARPackage;

@interface MARDispatch : NSObject

+ (RACSignal *_Nonnull)deliverWithPackage:(MARPackage *_Nonnull)package channel:(NSString *_Nullable)channel;

@end

@interface AFHTTPSessionManager (MARExtension)

- (void)taskWithURL:(NSString * _Nonnull)url
             method:(MARHTTPMethodType)method
         parameters:(nullable id)parameters
            success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
            failure:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, NSError *_Nullable error))failure;

@end
