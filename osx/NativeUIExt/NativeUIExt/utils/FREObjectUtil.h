//
//  FREObjectUtil.h
//  NativeUIExt
//
//  Created by featherJ on 2020/2/10.
//  Copyright © 2020 featherJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#include "FlashRuntimeExtensions.h"


NS_ASSUME_NONNULL_BEGIN

@interface FREObjectUtil : NSObject
+(NSData *)dataFromFREObject:(FREObject*)target;
+(NSString *)stringFromFREObject:(FREObject*)target;
+(FREObject)stringToFREObject:(NSString *)value;
+(double)doubleFromFREObject:(FREObject*)target;
@end

NS_ASSUME_NONNULL_END
