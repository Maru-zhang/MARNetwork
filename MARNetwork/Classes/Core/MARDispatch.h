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
@class MARDispatch;

#define MARDispatchCenter [[MARDispatch alloc] init]
typedef MARDispatch *(^MARPackageBlock)(RACTuple *tuple);

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

- (nonnull MARDispatch *)mainChannel;
- (nonnull MARDispatch * _Nonnull (^)(NSString * _Nonnull name))channel;

///-----------------------
/// @name Header Operation
///-----------------------

- (nonnull MARDispatch * (^)(NSDictionary *header))header;

///----------------------------
/// @name HTTP Method Operation
///----------------------------

- (MARDispatch * _Nonnull)get;
- (MARDispatch * _Nonnull)post;
- (MARDispatch * _Nonnull)dele;
- (MARDispatch * _Nonnull)put;

///------------------------
/// @name Request Operation
///------------------------

- (RACSignal *_Nonnull)start;
- (RACSignal *_Nonnull)upload;
- (void)stop;

+ (RACSignal *_Nonnull)deliverWithPackage:(MARPackage *_Nonnull)package channel:(NSString *_Nullable)channel;

@end

@interface AFHTTPSessionManager (MARExtension)

- (NSURLSessionDataTask *)taskWithURL:(NSString * _Nonnull)url
             method:(MARHTTPMethodType)method
         parameters:(nullable id)parameters
            success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
            failure:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, NSError *_Nullable error))failure;

@end
