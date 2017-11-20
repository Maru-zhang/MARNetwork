//
//  MARNormalRequestTest.m
//  MARNetwork
//
//  Created by Maru on 2017/2/22.
//  Copyright © 2017年 Maru-zhang. All rights reserved.
//

#import "MARTestCase.h"
#import <MARNetwork/MARNetwork.h>
#import "MAREntity+Demo.h"

@interface MARNormalRequestTest : MARTestCase
@end

@implementation MARNormalRequestTest

- (void)testGET {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Request with GET method should succeed."];
    
    RACSignal *signal = MARDispatchCenter.mainChannel.get.getRequest(nil).start;
    
    [signal subscribeNext:^(id  _Nullable x) {
        XCTAssertNotNil(x);
        [expectation fulfill];
    }];
    
    [signal subscribeError:^(NSError * _Nullable error) {
        
    }];
    
    [self waitForExpectationsWithCommonTimeout];
}

- (void)testGETWithParameters {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Request with GET method should succeed."];
    RACSignal *signal = MARDispatchCenter.mainChannel
                                         .get
                                         .getRequest(RACTuplePack(@"maru-zhang")).start;

    [signal subscribeNext:^(id  _Nullable x) {
        XCTAssertTrue([x[@"args"][@"params"] isEqualToString:@"maru-zhang"]);
        [expectation fulfill];
    }];
    
    [signal subscribeError:^(NSError * _Nullable error) {
        XCTAssert(NO, @"request should not send error stream.");
    }];
    
    
    [self waitForExpectationsWithCommonTimeout];
}

//- (void)testPOSTWithForm {
//
//    XCTestExpectation *expectation = [self expectationWithDescription:@"Request with POST method should succeed."];
//
//    RACSignal *signal = MARDispatchCenter.mainChannel.post.postRequest(RACTuplePack(@"value")).start;
//
//    [signal subscribeNext:^(id  _Nullable x) {
//        XCTAssertTrue([x[@"form"][@"key"] isEqualToString:@"value"]);
//        [expectation fulfill];
//    }];
//
//    [signal subscribeError:^(NSError * _Nullable error) {
//        XCTAssert(NO, @"request should not send error stream.");
//    }];
//
//    [self waitForExpectationsWithCommonTimeout];
//}

@end
