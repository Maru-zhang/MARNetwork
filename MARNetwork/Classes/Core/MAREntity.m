//
//  MAREntity.m
//  Pods
//
//  Created by Maru on 2017/3/2.
//
//


#import "MAREntity.h"
#import "MARKernel.h"

@interface MAREntity ()
@property (nonatomic, copy, readwrite) NSString *url;
@property (nonatomic, copy, readwrite) NSString *channelName;
@property (nonatomic, strong, readwrite) id params;
@property (nonatomic, strong, readwrite) NSSet *httpHeader;
@property (nonatomic, assign, readwrite) MARHTTPMethodType type;
@end

@implementation MAREntity

#pragma mark - Initialize

- (instancetype)initWithChannelName:(NSString *)channel {
    if (self = [super init]) {
        _channelName = channel;
    }
    return self;
}

@end
