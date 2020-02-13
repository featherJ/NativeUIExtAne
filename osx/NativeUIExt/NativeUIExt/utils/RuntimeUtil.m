//
//  RuntimeUtil.m
//  NativeUIExt
//
//  Created by featherJ on 2020/2/10.
//  Copyright © 2020 featherJ. All rights reserved.
//

#import "RuntimeUtil.h"

@implementation RuntimeUtil
+ (void)methodSwizzle:(Class)classA classB:(Class)classB selA:(SEL)selA selB:(SEL)selB {
	Method methodA = class_getInstanceMethod(classA, selA);
	Method methodB = class_getInstanceMethod(classB, selB);
	class_addMethod(classA, selB, method_getImplementation(methodA),method_getTypeEncoding(methodA));
	method_exchangeImplementations(methodA,methodB);
}
@end
