//
//  MARDispatch.m
//  Pods
//
//  Created by Maru on 2017/2/17.
//
//

#import "MARDispatch.h"
#import "MAREntity.h"

@interface MARDispatch ()
@property (nonatomic, strong) NSMutableArray *tasksPool;
@end
@implementation MARDispatch

+ (instancetype)defaultCenter {
    static MARDispatch *dispatch;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch = [[MARDispatch alloc] init];
    });
    return dispatch;
}

- (MAREntity *)mainChannel {
    MAREntity *entity = [[MAREntity alloc] initWithChannelName:MARMainChannelKey];
    return entity;
}

- (MAREntity *(^)(NSString *))channel {
    return ^id(NSString *name) {
        MAREntity *entity = [[MAREntity alloc] initWithChannelName:name];
        return entity;
    };
}

#pragma mark - Property

- (NSMutableArray *)tasksPool {
    if (!_tasksPool) {
        _tasksPool = [NSMutableArray array];
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
