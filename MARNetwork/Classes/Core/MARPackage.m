//
//  MARPackage.m
//  Pods
//
//  Created by Maru on 2017/2/17.
//
//

#import "MARPackage.h"

@implementation MARPackage

+ (MARPackage *)packageWithPath:(NSString *)path method:(MARHTTPMethodType)method parameters:(id)parameters configure:(__autoreleasing MARRequestConfigBlock)configure {
    MARPackage *packeg = [[MARPackage alloc] init];
    packeg.path = path;
    packeg.method = method;
    packeg.parameters = parameters;
    packeg.config = [MARRequestConfig defaultConfig];
    if (configure) { configure(packeg.config); }
    return packeg;
}

@end

@implementation MARRequestConfig

+ (MARRequestConfig *)defaultConfig {
    return [[MARRequestConfig alloc] init];
}

@end
