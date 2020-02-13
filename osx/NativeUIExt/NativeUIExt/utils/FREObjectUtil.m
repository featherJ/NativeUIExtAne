//
//  FREObjectUtil.m
//  NativeUIExt
//
//  Created by featherJ on 2020/2/10.
//  Copyright © 2020 featherJ. All rights reserved.
//

#import "FREObjectUtil.h"

@implementation FREObjectUtil
+(NSData *)dataFromFREObject:(FREObject*)target {
	FREByteArray byteArray;
	FREAcquireByteArray( target, &byteArray );
	NSData *data = [NSData dataWithBytes:(void *)byteArray.bytes length:(NSUInteger)byteArray.length];
	FREReleaseByteArray( target );
	return data;
}

+(NSString *)stringFromFREObject:(FREObject*)target {
	uint32_t stringLen;
	const uint8_t *stringUint8_t;
	FREGetObjectAsUTF8(target, &stringLen, &stringUint8_t);
	NSString *str = [NSString stringWithFormat:@"%s", stringUint8_t];
	return str;
}

+(double)doubleFromFREObject:(FREObject*)target {
	double value;
	FREGetObjectAsDouble(target, &value);
	return value;
}

+(FREObject)stringToFREObject:(NSString *)value{
	const char *str = [value UTF8String];
	FREObject object;
	FRENewObjectFromUTF8((uint32_t)strlen(str)+1, (const uint8_t*)str, &object);
	return object;
}

@end
