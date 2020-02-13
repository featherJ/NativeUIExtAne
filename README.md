# System UI AIR Native Extension (ANE)

AIR Native Extension allow you to use system ui. (For now, only support use and custom system cursor in Mac OS (10.8 or higher)).

## How to use it?


Add `NativeUIExt.ane` as a dependency to your project.

### 1. Use custom retina cursor
```as3
NativeMouse.registerCursor('custom-cursor',image1,image2,new Point(16,16));
NativeMouse.cursor = 'custom-cursor';
```

### 2. Use system cursor
```as3
NativeMouse.cursor = NativeMouseCursor.CLOSED_HAND_CURSOR;
```
Support below cursors:
```as3
/**
 * default 
 */		
public static const DEFAULT_CURSOR:String = "default";
/**
 * The arrow cursor. (mac)
 */		
public static const ARROW_CURSOR:String = "arror";
/**
 * The I-beam cursor for indicating insertion points. (mac)
 */		
public static const IBEAM_CURSOR:String = "IBeam";
/**
 * The pointing-hand cursor. (mac)
 */		
public static const POINTING_HAND_CURSOR:String = "pointingHand";
/**
 * The closed-hand cursor. (mac) 
 */		
public static const CLOSED_HAND_CURSOR:String = "closedHand";
/**
 * The open-hand cursor. (mac)
 */		
public static const OPEN_HAND_CURSOR:String = "openHand";
/**
 * The resize-left cursor. (mac)
 */  
public static const RESIZE_LEFT_CURSOR:String = "resizeLeft";
/**
 * The resize-right cursor. (mac)
 */  
public static const RESIZE_RIGHT_CURSOR:String = "resizeRight";
/**
 * The resize-left-and-right cursor. (mac)
 */  
public static const RESIZE_LEFT_RIGHT_CURSOR:String = "resizeLeftRight";
/**
 * The resize-up cursor. (mac)
 */  
public static const RESIZE_UP_CURSOR:String = "resizeUp";
/**
 * The resize-down cursor. (mac)
 */  
public static const RESIZE_DOWN_CURSOR:String = "resizeDown";
/**
 * The resize-up-and-down cursor. (mac) 
 */  
public static const RESIZE_UP_DOWN_CURSOR:String = "resizeUpDown";
/**
 * The cross-hair cursor. (mac)
 */  
public static const CROSSHAIR_CURSOR:String = "crosshair";
/**
 * The disappearing item cursor. (mac) 
 */  
public static const DISAPPEARING_ITEM_CURSOR:String = "disappearingItem";
/**
 * The not allowed cursor. (mac 10.5)
 */  
public static const OPERATION_NOT_ALLOWED_CURSOR:String = "operationNotAllowed"; //10_5;
/**
 * The drag link cursor. (mac 10.6)
 */  
public static const DRAG_LINK_CURSOR:String = "dragLink"; //10_6;
/**
 * The drag copy cursor. (mac 10.6)
 */  
public static const DRAG_COPY_CURSOR:String = "dragCopy"; //10_6;
/**
 * The contextual menu cursor. (mac 10.6)
 */  
public static const CONTEXTUAL_MENU_CURSOR:String = "contextualMenu"; //10_6;
/**
 * The I-Beam text cursor for vertical layout. (mac 10.7)
 */		
public static const IBEAM_CURSOR_FOR_VERTICAL_LAYOUT_CURSOR:String = "IBeamCursorForVerticalLayout"; //10_7;
```

## todo
* Custom NativeWindow (fullscreen, etc.)
* Windows Support.