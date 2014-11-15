package com.theflexguy.view.xmlstructure
{
	import mx.controls.Tree;
	
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
	}
}