//
//  MARDispatch.m
//  Pods
//
//  Created by Maru on 2017/2/17.
//
//

#import "MARDispatch.h"

@interface MARDispatch ()
@property (nonatomic, strong) NSMutableArray *tasksPool;
@end
@implementation MARDispatch

- (MARDispatch *)mainChannel {
    _channelName = MARMainChannelKey;
    return self;
}

- (MARDispatch *(^)(NSString *))channel {
    return ^id(NSString *name) {
        _channelName = name;
        return self;
    };
}

- (MARDispatch *(^)(NSDictionary *))header {
    return ^id(NSDictionary *header) {
        _httpHeader = header;
        return self;
    };
}

- (MARDispatch *)get {
    _type = MARHTTPMethodTypeGET;
    return self;
}

- (MARDispatch *)post {
    _type = MARHTTPMethodTypePOST;
    return self;
}

- (MARDispatch *)dele {
    _type = MARHTTPMethodTypeDELETE;
    return self;
}

- (MARDispatch *)put {
    _type = MARHTTPMethodTypePUT;
    return self;
}

- (RACSignal *)start {
    
    NSAssert(_url != nil, @"request url could not be nil !");
    NSAssert(_channelName != nil, @"channel name could not be nil");
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        AFHTTPSessionManager *manager = [[MARKernel shareInstance] managerFromChannel:_channelName];
        
        NSString *domain = [[MARKernel shareInstance] domainFromChannel:_channelName];
        
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
        
        return [RACDisposable disposableWithBlock:^{
            [self.task cancel];
        }];
    }];
}

- (RACSignal *)upload {
    
}

- (void)stop {
    if (self.task) { [self.task cancel]; }
}

+ (RACSignal *_Nonnull)deliverWithPackage:(MARPackage *_Nonnull)package channel:(NSString *_Nullable)channel {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        AFHTTPSessionManager *manager = [[MARKernel shareInstance] managerFromChannel:channel];
        
        NSString *domain = [[MARKernel shareInstance] domainFromChannel:channel];
        
        // handle url to make sure not begin with `/`
        NSString *validURL;
        if ([package.path hasPrefix:@"/"]) { validURL = [package.path substringFromIndex:0]; }
        else { validURL = package.path; };
        
        NSURLSessionDataTask *task = [manager taskWithURL:validURL method:package.method parameters:package.parameters success:^(NSURLSessionDataTask *task, id  _Nullable responseObject) {
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
            [subscriber sendError:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

#pragma mark - Property

- (NSMutableArray *)tasksPool {
    if (!_tasksPool) {
        @synchronized (self) {
            _tasksPool = [NSMutableArray array];
        }
    }
    return _tasksPool;
}

@end

@implementation AFHTTPSessionManager (MARExtension)

- (NSURLSessionDataTask *)taskWithURL:(NSString * _Nonnull)url
             method:(MARHTTPMethodType)method
         parameters:(nullable id)parameters
            success:(nullable void (^)(NSURLSessionDataTask *_Nullable task, id _Nullable responseObject))success
            failure:(nullable void (^)(NSURLSessionDataTask *_Nullable task, NSError *_Nullable error))failure {
    switch (method) {
        case 0: {
            return [self GET:url parameters:parameters progress:nil success:success failure:failure];
        }
        case 1: {
            return [self POST:url parameters:parameters progress:nil success:success failure:failure];
        }
        case 2: {
            return [self PUT:url parameters:parameters success:success failure:failure];
        }
        case 3: {
            return [self DELETE:url parameters:parameters success:success failure:failure];
        }
        case 4: {
            return [self HEAD:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task) {
                success(task,nil);
            } failure:failure];
        }
    }
}

@end
