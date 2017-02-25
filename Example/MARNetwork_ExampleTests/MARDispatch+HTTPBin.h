//
//  MARDispatch+HTTPBin.h
//  MARNetwork
//
//  Created by Maru on 2017/2/22.
//  Copyright © 2017年 Maru-zhang. All rights reserved.
//

#import <MARNetwork/MARNetwork.h>

@interface MARDispatch (HTTPBin)

- (MARDispatch *(^)(id))getRequest;
- (MARDispatch *(^)(id))postRequest;
- (MARDispatch *(^)(id))deleteRequest;
- (MARDispatch *(^)(id))putRequest;

/// first params is url, second is xxx etc...
- (MARPackageBlock)user;

@end
