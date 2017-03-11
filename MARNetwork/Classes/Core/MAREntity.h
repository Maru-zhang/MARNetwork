//
//  MAREntity.h
//  Pods
//
//  Created by Maru on 2017/3/2.
//
//

#import "MARKernel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MAREntity : NSObject

@property (nonatomic, copy, readonly) NSString *url;
@property (nonatomic, copy, readonly) NSString *channelName;
@property (nonatomic, strong, readonly, nullable) id params;
@property (nonatomic, strong, readonly) NSDictionary<NSString *, NSString *> *headers;
@property (nonatomic, assign, readonly) MARHTTPMethodType type;
@property (nonatomic, strong, readonly) NSURLSessionTask *task;

///-----------------------
/// @name Header Operation
///-----------------------

- (MAREntity *(^)(NSDictionary * header))header;

///----------------------------
/// @name HTTP Method Operation
///----------------------------

- (MAREntity *)get;
- (MAREntity *)post;
- (MAREntity *)dele;
- (MAREntity *)put;

///------------------------
/// @name Request Operation
///------------------------

- (RACSignal *)start;
- (void)stop;

///------------------------
/// @name Initialize Operator
///------------------------

- (instancetype)initWithChannelName:(NSString *)channel;

@end

NS_ASSUME_NONNULL_END
