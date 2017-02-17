//
//  MARDispatch+Module1.m
//  MARNetwork
//
//  Created by Maru on 2017/2/17.
//  Copyright © 2017年 Maru-zhang. All rights reserved.
//

#import "MARDispatch+Module1.h"

#define MAR_Channel_1 @"right"

@implementation MARDispatch (Module1)

+ (RACSignal *)fetchBusiness1:(id)params {
    MARPackage *package = [MARPackage packageWithPath:@"apiv3/util/test" method:MARHTTPMethodTypeGET parameters:params configure:^(MARRequestConfig *config) {
        
    }];
    return [self deliverWithPackage:package channel:MAR_Channel_1];
}

+ (RACSignal *)fetchBusiness2:(id)params {
    MARPackage *package = [MARPackage packageWithPath:@"/util/test" method:MARHTTPMethodTypeGET parameters:params configure:^(MARRequestConfig *config) {
        
    }];
    return [self deliverWithPackage:package channel:MAR_Channel_1];
}

+ (RACSignal *)fetchBusiness3:(id)params {
    MARPackage *package = [MARPackage packageWithPath:@"/util/test" method:MARHTTPMethodTypeGET parameters:params configure:^(MARRequestConfig *config) {
        
    }];
    return [self deliverWithPackage:package channel:MAR_Channel_1];
}

+ (RACSignal *)fetchBusiness4:(id)params {
    MARPackage *package = [MARPackage packageWithPath:@"/util/test" method:MARHTTPMethodTypeGET parameters:params configure:^(MARRequestConfig *config) {
        
    }];
    return [self deliverWithPackage:package channel:MAR_Channel_1];
}

+ (RACSignal *)fetchBusiness5:(id)params {
    MARPackage *package = [MARPackage packageWithPath:@"/util/test" method:MARHTTPMethodTypeGET parameters:params configure:^(MARRequestConfig *config) {
        
    }];
    return [self deliverWithPackage:package channel:MAR_Channel_1];
}

+ (RACSignal *)fetchBusiness6:(id)params {
    MARPackage *package = [MARPackage packageWithPath:@"/util/test" method:MARHTTPMethodTypeGET parameters:params configure:^(MARRequestConfig *config) {
        
    }];
    return [self deliverWithPackage:package channel:MAR_Channel_1];
}

@end
