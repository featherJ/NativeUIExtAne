//
//  RuntimeUtil.h
//  NativeUIExt
//
//  Created by featherJ on 2020/2/10.
//  Copyright © 2020 featherJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface RuntimeUtil : NSObject
+ (void)methodSwizzle:(Class)classA classB:(Class)classB selA:(SEL)selA selB:(SEL)selB;
@end

NS_ASSUME_NONNULL_END
