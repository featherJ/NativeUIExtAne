//
//
//  Created by featherJ on 2020/2/9.
//  Copyright © 2020 featherJ. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define EXPORT __attribute__((visibility("default")))

#ifndef MacOSFullScreen_H_
#define MacOSFullScreen_H_
#include "FlashRuntimeExtensions.h" // should be included via the framework, but it's not picking up

EXPORT
void NativeUIExtInitializer(void** extData, FREContextInitializer* ctxInitializer, FREContextFinalizer* ctxFinalizer);

EXPORT
void NativeUIExtFinalizer(void* extData);

#endif /* HelloANE_H_ */
