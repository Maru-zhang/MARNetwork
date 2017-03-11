//
//  MARDispatch.h
//  Pods
//
//  Created by Maru on 2017/2/17.
//
//

#import <Foundation/Foundation.h>
#import "MARKernel.h"

#define MARDispatchCenter [MARDispatch defaultCenter]

NS_ASSUME_NONNULL_BEGIN

@class MARDispatch;
@class MAREntity;

typedef MAREntity *(^MARPackageBlock)(RACTuple *tuple);

@interface MARDispatch : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *channelName;
@property (nonatomic, strong) id params;
@property (nonatomic, strong) NSSet *httpHeader;
@property (nonatomic, assign) MARHTTPMethodType type;

+ (instancetype)defaultCenter;

///------------------------
/// @name Channel Operation
///------------------------

- (nonnull MAREntity *)mainChannel;
- (nonnull MAREntity * _Nonnull (^)(NSString * _Nonnull name))channel;

@end

@interface AFHTTPSessionManager (MARExtension)

- (NSURLSessionDataTask *)taskWithURL:(NSString * _Nonnull)url
             method:(MARHTTPMethodType)method
         parameters:(nullable id)parameters
            success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
            failure:(void (^)(NSURLSessionDataTask * _Nonnull task, NSError *_Nullable error))failure;

@end

NS_ASSUME_NONNULL_END
