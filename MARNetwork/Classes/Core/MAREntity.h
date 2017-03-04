//
//  MAREntity.h
//  Pods
//
//  Created by Maru on 2017/3/2.
//
//

#import "MARKernel.h"

@interface MAREntity : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *url;
@property (nonatomic, copy, readonly, nonnull) NSString *channelName;
@property (nonatomic, strong, readonly, nullable) id params;
@property (nonatomic, strong, readonly, nullable) NSDictionary<NSString *, NSString *> *headers;
@property (nonatomic, assign, readonly) MARHTTPMethodType type;
@property (nonatomic, strong, readonly, nullable) NSURLSessionTask *task;

///-----------------------
/// @name Header Operation
///-----------------------

- (MAREntity * _Nonnull (^)(NSDictionary * _Nullable header))header;

///----------------------------
/// @name HTTP Method Operation
///----------------------------

- (MAREntity * _Nonnull)get;
- (MAREntity * _Nonnull)post;
- (MAREntity * _Nonnull)dele;
- (MAREntity * _Nonnull)put;

///------------------------
/// @name Request Operation
///------------------------

- (RACSignal *_Nonnull)start;
- (void)stop;

///------------------------
/// @name Initialize Operator
///------------------------

- (instancetype)initWithChannelName:(NSString * _Nonnull)channel;

@end
