//
//  MARDispatch+Module1.m
//  MARNetwork
//
//  Created by Maru on 2017/2/17.
//  Copyright © 2017年 Maru-zhang. All rights reserved.
//

#import "MARDispatch+Module1.h"

@implementation MARDispatch (Module1)

+ (RACSignal *)fetchBusiness1:(id)params {
    MARPackage *package = [MARPackage packageWithPath:@"/util/test" method:MARHTTPMethodTypeGET parameters:params configure:^(MARRequestConfig *config) {
        
    }];
    return [self deliverWithPackage:package channel:@"right"];
}

@end
