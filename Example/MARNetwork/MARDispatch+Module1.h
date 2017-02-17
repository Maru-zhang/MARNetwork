//
//  MARDispatch+Module1.h
//  MARNetwork
//
//  Created by Maru on 2017/2/17.
//  Copyright © 2017年 Maru-zhang. All rights reserved.
//

#import <MARNetwork/MARNetwork.h>

@interface MARDispatch (Module1)

+ (RACSignal *)fetchBusiness1:(id)params;
+ (RACSignal *)fetchBusiness2:(id)params;
+ (RACSignal *)fetchBusiness3:(id)params;
+ (RACSignal *)fetchBusiness4:(id)params;
+ (RACSignal *)fetchBusiness5:(id)params;
+ (RACSignal *)fetchBusiness6:(id)params;

@end
