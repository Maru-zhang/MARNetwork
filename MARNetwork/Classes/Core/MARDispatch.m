//
//  MARDispatch.m
//  Pods
//
//  Created by Maru on 2017/2/17.
//
//

#import "MARDispatch.h"

@implementation MARDispatch

+ (RACSignal *_Nonnull)deliverWithPackage:(MARPackage *_Nonnull)package channel:(NSString *_Nullable)channel {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        AFHTTPSessionManager *manager = [[MARKernel shareInstance] managerFromChannel:channel];
        
        NSString *domain = [[MARKernel shareInstance] domainFromChannel:channel];
        
        // handle url to make sure not begin with `/`
        NSString *validURL;
        if ([package.path hasPrefix:@"/"]) { validURL = [package.path substringFromIndex:0]; }
        else { validURL = package.path; };
        
        [manager taskWithURL:validURL method:package.method parameters:package.parameters success:^(NSURLSessionDataTask *task, id  _Nullable responseObject) {
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
            [subscriber sendError:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

@end

@implementation AFHTTPSessionManager (MARExtension)

- (void)taskWithURL:(NSString * _Nonnull)url
             method:(MARHTTPMethodType)method
         parameters:(nullable id)parameters
            success:(nullable void (^)(NSURLSessionDataTask *_Nullable task, id _Nullable responseObject))success
            failure:(nullable void (^)(NSURLSessionDataTask *_Nullable task, NSError *_Nullable error))failure {
    switch (method) {
        case 0: {
            [self GET:url parameters:parameters progress:nil success:success failure:failure];
            break;
        }
        case 1: {
            [self POST:url parameters:parameters progress:nil success:success failure:failure];
            break;
        }
        case 2: {
            [self PUT:url parameters:parameters success:success failure:failure];
            break;
        }
        case 3: {
            [self DELETE:url parameters:parameters success:success failure:failure];
            break;
        }
        case 4: {
            [self HEAD:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task) {
                success(task,nil);
            } failure:failure];
            break;
        }
    }
}

@end
