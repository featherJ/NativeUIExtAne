

#include <stdlib.h>
#include "NativeUIExt.h"
#include "NativeCursor.h"
#include "FREObjectUtil.h"


NativeCursor* nativeCursor = NULL;
NativeCursor* getNativeCursor(){
	if(nativeCursor == NULL){
		nativeCursor = [[NativeCursor alloc] init];
	}
	return nativeCursor;
}

FREObject isNativeCursorSupport(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]){
	NativeCursor *curNativeCursor = getNativeCursor();
	FREObject isSupport;
	FRENewObjectFromBool(curNativeCursor.isSupport, &isSupport);
	return isSupport;
}

FREObject registerCursor(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]){
	NSString *name = [FREObjectUtil stringFromFREObject:argv[0]];
	NSData *data = [FREObjectUtil dataFromFREObject:argv[1]];
	NSData *data2x = [FREObjectUtil dataFromFREObject:argv[2]];
	NSImage *image = [[NSImage alloc] initWithData:data];
	NSImage *image2x = [[NSImage alloc] initWithData:data2x];
	double hotX = [FREObjectUtil doubleFromFREObject:argv[3]];
	double hotY = [FREObjectUtil doubleFromFREObject:argv[3]];
	NSPoint hotPos = NSMakePoint(hotX, hotY);
	NativeCursor *curNativeCursor = getNativeCursor();
	[curNativeCursor registerCursor:name image:image image2x:image2x hotSpot:hotPos];
	return NULL;
}

FREObject unregisterCursor(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]){
	NSString *name = [FREObjectUtil stringFromFREObject:argv[0]];
	NativeCursor *curNativeCursor = getNativeCursor();
	[curNativeCursor unregisterCursor:name];
	return NULL;
}

FREObject setNativeCursor(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]){
	NSString *cursorType = [FREObjectUtil stringFromFREObject:argv[0]];
	NativeCursor *curNativeCursor = getNativeCursor();
	[curNativeCursor setCursor:cursorType];
	return NULL;
}


void reg(FRENamedFunction *store, int slot, const char *name, FREFunction fn) {
	store[slot].name = (const uint8_t*)name;
	store[slot].functionData = NULL;
	store[slot].function = fn;
}
void contextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctions, const FRENamedFunction** functions){
	*numFunctions = 4;
	FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctions));
	*functions = func;
	
	reg(func, 0, "isNativeCursorSupport", isNativeCursorSupport);
	reg(func, 1, "setNativeCursor", setNativeCursor);
	reg(func, 2, "registerCursor", registerCursor);
	reg(func, 3, "unregisterCursor", unregisterCursor);
}
void contextFinalizer(FREContext ctx){
	return;
}
void NativeUIExtInitializer(void** extData, FREContextInitializer* ctxInitializer, FREContextFinalizer* ctxFinalizer){
	
	*ctxInitializer = &contextInitializer;
	*ctxFinalizer = &contextFinalizer;
	*extData = NULL;
}
void NativeUIExtFinalizer(void* extData){
	FREContext nullCTX;
	nullCTX = 0;
	
	contextFinalizer(nullCTX);
	return;
}
