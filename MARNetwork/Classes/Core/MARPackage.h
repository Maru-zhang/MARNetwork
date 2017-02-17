//
//  MARPackage.h
//  Pods
//
//  Created by Maru on 2017/2/17.
//
//

#import <Foundation/Foundation.h>
@class MARRequestConfig;

typedef enum : NSUInteger {
    MARHTTPMethodTypeGET     = 0,
    MARHTTPMethodTypePOST    = 1,
    MARHTTPMethodTypePUT     = 2,
    MARHTTPMethodTypeDELETE  = 3,
    MARHTTPMethodTypeHEAD    = 4,
} MARHTTPMethodType;

typedef void(^MARRequestConfigBlock)(MARRequestConfig *config);

@interface MARPackage : NSObject

@property (nonatomic, copy) NSString *path;
@property (nonatomic, strong) id parameters;
@property (nonatomic, assign) MARHTTPMethodType method;
@property (nonatomic, strong) MARRequestConfig *config;

+ (MARPackage *)packageWithPath:(NSString *)path
                         method:(MARHTTPMethodType)method
                     parameters:(id)parameters
                      configure:(MARRequestConfigBlock)configure;

@end

@interface MARRequestConfig : NSObject

+ (MARRequestConfig *)defaultConfig;

@property (nonatomic, strong) NSDictionary *headers;

@end
