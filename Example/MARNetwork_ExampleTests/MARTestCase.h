//
//  MARTestCase.h
//  MARNetwork
//
//  Created by Maru on 2017/2/22.
//  Copyright © 2017年 Maru-zhang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <MARNetwork/MARNetwork.h>

@interface MARTestCase : XCTestCase

@property (nonatomic, assign) NSTimeInterval networkTimeout;

- (void)waitForExpectationsWithCommonTimeout;
- (void)waitForExpectationsWithCommonTimeoutUsingHandler:(XCWaitCompletionHandler)handler;

@end
