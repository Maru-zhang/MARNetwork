//
//  MARDispatch+HTTPBin.m
//  MARNetwork
//
//  Created by Maru on 2017/2/22.
//  Copyright © 2017年 Maru-zhang. All rights reserved.
//

#import "MARDispatch+HTTPBin.h"

@implementation MARDispatch (HTTPBin)

- (MARDispatch *(^)(id))getRequest {
    return ^id (id params) {
        [self setValue:@"get" forKey:@"url"];
        [self setValue:params forKey:@"params"];
        return self;
    };
}

- (MARDispatch *(^)(id))postRequest {
    return ^id (id params) {
        [self setValue:@"post" forKey:@"url"];
        [self setValue:params forKey:@"params"];
        return self;
    };
}

- (MARDispatch *(^)(id))deleteRequest {
    return ^id (id params) {
        [self setValue:@"delete" forKey:@"url"];
        [self setValue:params forKey:@"params"];
        return self;
    };
}

- (MARDispatch *(^)(id))putRequest {
    return ^id (id params) {
        [self setValue:@"put" forKey:@"url"];
        [self setValue:params forKey:@"params"];
        return self;
    };
}

@end
