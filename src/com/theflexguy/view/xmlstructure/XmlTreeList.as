package com.theflexguy.view.xmlstructure
{
	import flash.display.DisplayObject;
	
	import mx.controls.Tree;
	
	import spark.components.Group;
	
	public class XmlTreeList extends Tree
	{
		public var fileNum:int;
		
		public function XmlTreeList()
		{
			super();
			this.labelFunction = nodeName;
		}
		
		protected function nodeName(item:Object):String {
			if(item is XML) {
				return String( (item as XML).localName() );
			} else {
				return "-undefined";
			}
		}
//		
//		override protected function measure():void {
//			super.measure();
//			this.height += 100;
//		}
		
	}
}