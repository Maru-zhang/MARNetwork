//
//  MAREntity.m
//  Pods
//
//  Created by Maru on 2017/3/2.
//
//


#import "MAREntity.h"
#import "MARKernel.h"
#import "MARDispatch.h"

@interface MAREntity ()
@property (nonatomic, copy, readwrite, nonnull) NSString *url;
@property (nonatomic, copy, readwrite, nonnull) NSString *channelName;
@property (nonatomic, strong, readwrite, nullable) id params;
@property (nonatomic, strong, readwrite, nullable) NSDictionary<NSString *, NSString *> *headers;
@property (nonatomic, assign, readwrite) MARHTTPMethodType type;
@property (nonatomic, strong, readwrite, nullable) NSURLSessionTask *task;
@end

@implementation MAREntity

#pragma mark - Initialize

- (instancetype)initWithChannelName:(NSString *)channel {
    if (self = [super init]) {
        _channelName = channel;
    }
    return self;
}

#pragma mark - Operator

- (MAREntity *(^)(NSDictionary *))header {
    return ^id(NSDictionary *header) {
        _headers = header;
        return self;
    };
}

- (MAREntity *)get {
    _type = MARHTTPMethodTypeGET;
    return self;
}

- (MAREntity *)post {
    _type = MARHTTPMethodTypePOST;
    return self;
}

- (MAREntity *)dele {
    _type = MARHTTPMethodTypeDELETE;
    return self;
}

- (MAREntity *)put {
    _type = MARHTTPMethodTypePUT;
    return self;
}

- (RACSignal *)start {
    
    NSAssert(_url != nil, @"request url could not be nil !");
    NSAssert(_channelName != nil, @"channel name could not be nil");
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        AFHTTPSessionManager *manager = [[MARKernel shareInstance] managerFromChannel:_channelName];
        
        NSString *domain = [[MARKernel shareInstance] domainFromChannel:_channelName];
        
        // add request headers.
        [_headers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
            [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
        
        // handle url to make sure not begin with `/`
        NSString *validURL;
        if ([_url hasPrefix:@"/"]) { validURL = [_url substringFromIndex:0]; }
        else { validURL = _url; };
        
        self.task = [manager taskWithURL:validURL method:_type parameters:_params success:^(NSURLSessionDataTask *task, id  _Nullable responseObject) {
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
            [subscriber sendError:error];
        }];
        
        @weakify(self);
        return [RACDisposable disposableWithBlock:^{
            @strongify(self);
            [self stop];
            self.task = nil;
        }];
    }];
}

- (void)stop {
    [self.task cancel];
}

@end
