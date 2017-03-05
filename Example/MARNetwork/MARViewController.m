//
//  MARViewController.m
//  MARNetwork
//
//  Created by Maru-zhang on 02/16/2017.
//  Copyright (c) 2017 Maru-zhang. All rights reserved.
//

#import "MARViewController.h"
#import <MARNetwork/MARNetwork.h>
#import "MAREntity+Demo.h"

@interface MARViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation MARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User Action

- (IBAction)request_1:(id)sender {
    
    MAREntity *entity = MARDispatchCenter.mainChannel;

    RACSignal *signal = entity.get.getRequest(nil).start;

    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"请求成功:%@",x);
    }];

    [signal subscribeError:^(NSError * _Nullable error) {
        NSLog(@"请求失败:%@",error);
    }];

    [signal subscribeCompleted:^{
        NSLog(@"请求完成");
    }];
    
}


@end
