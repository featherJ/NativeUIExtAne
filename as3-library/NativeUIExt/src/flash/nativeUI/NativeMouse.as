package flash.nativeUI
{
	import flash.display.BitmapData;
	import flash.display.PNGEncoderOptions;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.nativeUI.core.NativeUIExtContext;
	import flash.ui.Mouse;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * The methods of the NativeMouse class are used to hide and show the mouse pointer, or to set the pointer to a specific style. 
	 * The NativeMouse class is a top-level class whose properties and methods you can access without using a constructor. 
	 * The pointer is visible by default, but you can hide it and implement a custom pointer. 
	 * 
	 * @author featherJ
	 */	
	public class NativeMouse
	{
		private static var cursorSystemMap:Dictionary = new Dictionary();
		cursorSystemMap[NativeMouseCursor.DEFAULT_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.ARROW_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.IBEAM_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.POINTING_HAND_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.CLOSED_HAND_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.OPEN_HAND_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.RESIZE_LEFT_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.RESIZE_RIGHT_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.RESIZE_LEFT_RIGHT_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.RESIZE_UP_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.RESIZE_DOWN_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.RESIZE_UP_DOWN_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.CROSSHAIR_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.DISAPPEARING_ITEM_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.OPERATION_NOT_ALLOWED_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.DRAG_LINK_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.DRAG_COPY_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.CONTEXTUAL_MENU_CURSOR] = true;
		cursorSystemMap[NativeMouseCursor.IBEAM_CURSOR_FOR_VERTICAL_LAYOUT_CURSOR] = true;
		private static var cursorCustomMap:Dictionary = new Dictionary();
		
		/**
		 * Indicates whether the current configuration supports native cursors. 
		 */		
		public static function get isSupport():Boolean{
			var value:Boolean = NativeUIExtContext.context.call("isNativeCursorSupport") as Boolean;
			return value;
		}
		
		private static var _cursor:String = 'default';
		/**
		 * The name of the native cursor. 
		 */
		public static function get cursor():String{
			return _cursor;
		}
		public static function set cursor(value:String):void{
			if(!isSupport){
				return;
			}
			if(!(value in cursorSystemMap) && !(value in cursorCustomMap)){
				throw new Error("Parameter cursor must be one of the accepted values.",2008);
			}
			_cursor = value;
			NativeUIExtContext.context.call("setNativeCursor",cursor);
		}
		
		/**
		 * Registers a native cursor under the given name, with the given data.
		 * @param name name 
		 * @param image image
		 * @param image2x retina image
		 * @param hotPos The hot spot of the cursor in pixels.
		 * 
		 */		
		public static function registerCursor(name:String,image:BitmapData,image2x:BitmapData,hotPos:Point):void{
			if(!image){
				throw new Error("Parameter image must be non-null.",2007);
				return;
			}
			if(image2x){
				if(image2x.width/2 != image.width){
					throw new Error("The value specified for argument 'image2x.width' is invalid. It must be twice to 'image.width'.",1508);
					return;
				}else if(image2x.height/2 != image.height){
					throw new Error("The value specified for argument 'image2x.height' is invalid. It must be twice to 'image.height'.",1508);
					return;
				}
			}
			if(name in cursorSystemMap || name in cursorCustomMap){
				throw new Error(name+' already exists.');
				return;
			}
			var option:PNGEncoderOptions = new PNGEncoderOptions();
			option.fastCompression = true;
			var bytes:ByteArray = image.encode(new Rectangle(0,0,image.width,image.height),option);
			var bytes2x:ByteArray = null;
			if(image2x){
				bytes2x = image2x.encode(new Rectangle(0,0,image2x.width,image2x.height),option);
			}else{
				bytes2x = bytes;
			}
			cursorCustomMap[name] = true;
			NativeUIExtContext.context.call("registerCursor",name,bytes,bytes2x,hotPos.x,hotPos.y);
		}
		
		/**
		 * Unregisters the native cursor with the given name.
		 * @param name name
		 * 
		 */		
		public static function unregisterCursor(name:String):void{
			delete cursorCustomMap[name];
			NativeUIExtContext.context.call("unregisterCursor",name);
		}
		
		/**
		 * Hides the pointer. The pointer is visible by default.
		 * 
		 */		
		public static function hide():void{
			Mouse.hide();
		}
		/**
		 * Displays the pointer. The pointer is visible by default. 
		 * 
		 */		
		public static function show():void{
			Mouse.show();
		}
	}
}