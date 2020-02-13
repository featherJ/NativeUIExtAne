package
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.nativeUI.NativeMouse;
	import flash.nativeUI.NativeMouseCursor;
	
	/**
	 *  
	 * @author featherJ
	 * 
	 */	
	public class Main extends Sprite
	{
		public function Main()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			if(!NativeMouse.isSupport){
				return;
			}
			
			//register custom retina cursor
			var shape1:Shape = new Shape();
			shape1.graphics.beginFill(0xff0000);
			shape1.graphics.drawCircle(16,16,16);
			shape1.graphics.endFill();
			var image1:BitmapData = new BitmapData(32,32,true,0);
			image1.draw(shape1);
			var shape2:Shape = new Shape();
			shape2.graphics.beginFill(0xff0000);
			shape2.graphics.drawCircle(32,32,32);
			shape2.graphics.endFill();
			var image2:BitmapData = new BitmapData(64,64,true,0);
			image2.draw(shape2);
			NativeMouse.registerCursor('custom-cursor',image1,image2,new Point(16,16));
			NativeMouse.cursor = 'custom-cursor';
			
			this.stage.addEventListener(MouseEvent.MOUSE_DOWN,stageMouseDown_handler);
			this.stage.addEventListener(MouseEvent.MOUSE_UP,stageMouseUp_handler);
		}
		
		private function stageMouseDown_handler(event:MouseEvent):void{
			//use system cursor
			NativeMouse.cursor = NativeMouseCursor.CLOSED_HAND_CURSOR;
		}
		
		private function stageMouseUp_handler(event:MouseEvent):void{
			//use system cursor
			NativeMouse.cursor = NativeMouseCursor.OPEN_HAND_CURSOR;
		}
	}
}