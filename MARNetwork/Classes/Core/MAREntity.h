//
//  MAREntity.h
//  Pods
//
//  Created by Maru on 2017/3/2.
//
//

#import "MARKernel.h"

@interface MAREntity : NSObject

@property (nonatomic, copy, readonly) NSString *url;
@property (nonatomic, copy, readonly) NSString *channelName;
@property (nonatomic, strong, readonly) id params;
@property (nonatomic, strong, readonly) NSSet *httpHeader;
@property (nonatomic, assign, readonly) MARHTTPMethodType type;

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

///------------------------
/// @name Request Operation
///------------------------

- (instancetype)initWithChannelName:(NSString *)channel;

@end
