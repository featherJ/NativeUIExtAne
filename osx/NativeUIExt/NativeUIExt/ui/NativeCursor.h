//
//  NativeCursor.h
//  NativeUIExt
//
//  Created by featherJ on 2020/2/10.
//  Copyright © 2020 featherJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const DEFAULT_CURSOR = @"default";
static NSString *const ARROW_CURSOR = @"arror";
static NSString *const IBEAM_CURSOR = @"IBeam";
static NSString *const POINTING_HAND_CURSOR = @"pointingHand";
static NSString *const CLOSED_HAND_CURSOR = @"closedHand";
static NSString *const OPEN_HAND_CURSOR = @"openHand";
static NSString *const RESIZE_LEFT_CURSOR = @"resizeLeft";
static NSString *const RESIZE_RIGHT_CURSOR = @"resizeRight";
static NSString *const RESIZE_LEFT_RIGHT_CURSOR = @"resizeLeftRight";
static NSString *const RESIZE_UP_CURSOR = @"resizeUp";
static NSString *const RESIZE_DOWN_CURSOR = @"resizeDown";
static NSString *const RESIZE_UP_DOWN_CURSOR = @"resizeUpDown";
static NSString *const CROSSHAIR_CURSOR = @"crosshair";
static NSString *const DISAPPEARING_ITEM_CURSOR = @"disappearingItem";
static NSString *const OPERATION_NOT_ALLOWED_CURSOR = @"operationNotAllowed"; //10_5;
static NSString *const DRAG_LINK_CURSOR = @"dragLink"; //10_6;
static NSString *const DRAG_COPY_CURSOR = @"dragCopy"; //10_6;
static NSString *const CONTEXTUAL_MENU_CURSOR = @"contextualMenu"; //10_6;
static NSString *const IBEAM_CURSOR_FOR_VERTICAL_LAYOUT_CURSOR = @"IBeamCursorForVerticalLayout"; //10_7;

@interface NativeCursor : NSObject
@property bool isSupport;
@property NSString *debugStr;
- (void)setCursor:(NSString *)cursorType;
- (void)registerCursor:(NSString *)name image:(NSImage*)image image2x:(NSImage*)image2x hotSpot:(NSPoint)hotSpot;
- (void)unregisterCursor:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
