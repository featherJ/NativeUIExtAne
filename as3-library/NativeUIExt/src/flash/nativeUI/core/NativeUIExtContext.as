package flash.nativeUI.core
{
	import flash.external.ExtensionContext;

	[ExcludeClass]
	public class NativeUIExtContext
	{
		private static var instance:NativeUIExtContext = null;
		
		public static function get context():ExtensionContext{
			if(!instance){
				instance = new NativeUIExtContext();
			}
			return instance.context;
		}
		
		public var context:ExtensionContext = null;
		public function NativeUIExtContext(){
			this.context = ExtensionContext.createExtensionContext("com.featherJ.NativeUIExt", null);
		}
	}
}