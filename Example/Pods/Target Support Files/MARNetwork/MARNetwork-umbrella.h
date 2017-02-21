#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MARChannel.h"
#import "MARDispatch.h"
#import "MARKernel.h"
#import "MARNetwork.h"
#import "MARPackage.h"

FOUNDATION_EXPORT double MARNetworkVersionNumber;
FOUNDATION_EXPORT const unsigned char MARNetworkVersionString[];

