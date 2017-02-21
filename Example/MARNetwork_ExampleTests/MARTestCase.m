//
//  MARTestCase.m
//  MARNetwork
//
//  Created by Maru on 2017/2/22.
//  Copyright © 2017年 Maru-zhang. All rights reserved.
//

#import "MARTestCase.h"

@implementation MARTestCase

- (void)setUp {
    [super setUp];
    
    self.networkTimeout = 20;
    
    [[MARKernel shareInstance] registerMainChannelWithBaseURL:@"https://httpbin.org/" managerCallBack:^(AFHTTPSessionManager *manager) {
        
    } configCallBack:^(NSURLSessionConfiguration *configureation) {
        
    }];
}

- (void)tearDown {
    [super tearDown];
}

- (void)waitForExpectationsWithCommonTimeout {
    [self waitForExpectationsWithCommonTimeoutUsingHandler:nil];
}

- (void)waitForExpectationsWithCommonTimeoutUsingHandler:(XCWaitCompletionHandler)handler {
    [self waitForExpectationsWithTimeout:self.networkTimeout handler:handler];
}


@end
