//
//  NativeCursor.m
//  NativeUIExt
//
//  Created by featherJ on 2020/2/10.
//  Copyright © 2020 featherJ. All rights reserved.
//

#import "NativeCursor.h"
#import "RuntimeUtil.h"


@interface NativeCursor ()
@property NSWindow *mainWindow;
@property NSMutableDictionary<NSString*,NSCursor*>* customCursorMap;
@end

static NSCursor *nativeCurrentCursor = NULL;
@implementation NativeCursor

- (instancetype)init{
	if(self  == [super init]){
		self.isSupport = false;
		self.customCursorMap = [[NSMutableDictionary alloc] init];
		nativeCurrentCursor = NULL;
		NSWindow *mainWindow = [NSApp mainWindow];
		if(mainWindow == NULL){
			if([NSApp windows].count > 0){
				mainWindow = [NSApp windows][0];
			}
		}
		if(mainWindow != NULL && mainWindow.contentView != NULL){
			[self initWithMainWindow:mainWindow];
		}
	}
	return self;
}

- (void)initWithMainWindow:(NSWindow *)mainWindow{
	self.isSupport = true;
	self.mainWindow = mainWindow;
	NSView *mainContentView = [mainWindow contentView];
	
	[RuntimeUtil methodSwizzle:[mainContentView class] classB:[self class] selA:sel_registerName("getNSCursor") selB:@selector(override_getNSCursor)];
}

-(void)registerCursor:(NSString *)name image:(NSImage*)image image2x:(NSImage*)image2x hotSpot:(NSPoint)hotSpot{
	[image addRepresentations: [image2x representations]];
	NSSize baseSize = [image size];
	[image2x setSize:NSMakeSize(baseSize.width, baseSize.height)];
	NSCursor* cursor = [[NSCursor alloc] initWithImage:image hotSpot:hotSpot];
	[self.customCursorMap setValue:cursor forKey:name];
}

-(void)unregisterCursor:(NSString *)name{
	[self.customCursorMap removeObjectForKey:name];
}

- (void)setCursor:(NSString *)cursorType{
	if(!self.isSupport){
		return;
	}
	
	nativeCurrentCursor = NULL;
	if([cursorType isEqualToString:ARROW_CURSOR]){
		nativeCurrentCursor = [NSCursor arrowCursor];
	}else if([cursorType isEqualToString:IBEAM_CURSOR]){
		nativeCurrentCursor = [NSCursor IBeamCursor];
	}else if([cursorType isEqualToString:POINTING_HAND_CURSOR]){
		nativeCurrentCursor = [NSCursor pointingHandCursor];
	}else if([cursorType isEqualToString:CLOSED_HAND_CURSOR]){
		nativeCurrentCursor = [NSCursor closedHandCursor];
	}else if([cursorType isEqualToString:OPEN_HAND_CURSOR]){
		nativeCurrentCursor = [NSCursor openHandCursor];
	}else if([cursorType isEqualToString:RESIZE_LEFT_CURSOR]){
		nativeCurrentCursor = [NSCursor resizeLeftCursor];
	}else if([cursorType isEqualToString:RESIZE_RIGHT_CURSOR]){
		nativeCurrentCursor = [NSCursor resizeRightCursor];
	}else if([cursorType isEqualToString:RESIZE_LEFT_RIGHT_CURSOR]){
		nativeCurrentCursor = [NSCursor resizeLeftRightCursor];
	}else if([cursorType isEqualToString:RESIZE_UP_CURSOR]){
		nativeCurrentCursor = [NSCursor resizeUpCursor];
	}else if([cursorType isEqualToString:RESIZE_DOWN_CURSOR]){
		nativeCurrentCursor = [NSCursor resizeDownCursor];
	}else if([cursorType isEqualToString:RESIZE_UP_DOWN_CURSOR]){
		nativeCurrentCursor = [NSCursor resizeUpDownCursor];
	}else if([cursorType isEqualToString:CROSSHAIR_CURSOR]){
		nativeCurrentCursor = [NSCursor crosshairCursor];
	}else if([cursorType isEqualToString:DISAPPEARING_ITEM_CURSOR]){
		nativeCurrentCursor = [NSCursor disappearingItemCursor];
	}else if([cursorType isEqualToString:OPERATION_NOT_ALLOWED_CURSOR]){
		nativeCurrentCursor = [NSCursor operationNotAllowedCursor];
	}else if([cursorType isEqualToString:DRAG_LINK_CURSOR]){
		nativeCurrentCursor = [NSCursor dragLinkCursor];
	}else if([cursorType isEqualToString:DRAG_COPY_CURSOR]){
		nativeCurrentCursor = [NSCursor dragCopyCursor];
	}else if([cursorType isEqualToString:CONTEXTUAL_MENU_CURSOR]){
		nativeCurrentCursor = [NSCursor contextualMenuCursor];
	}else if([cursorType isEqualToString:IBEAM_CURSOR_FOR_VERTICAL_LAYOUT_CURSOR]){
		nativeCurrentCursor = [NSCursor IBeamCursorForVerticalLayout];
	}
	if(nativeCurrentCursor == NULL){
		nativeCurrentCursor = [self.customCursorMap objectForKey:cursorType];
	}
	if(nativeCurrentCursor != NULL){
		[nativeCurrentCursor set];
	}else{
		[self.mainWindow invalidateCursorRectsForView:self.mainWindow.contentView];
	}
}

- (NSCursor *)override_getNSCursor{
	if(nativeCurrentCursor == NULL){
		return [self override_getNSCursor];
	}
	return nativeCurrentCursor;
}
@end
