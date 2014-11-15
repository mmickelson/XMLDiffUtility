package com.theflexguy.view.navigation
{
	import flash.events.MouseEvent;
	
	import spark.components.Button;
	import spark.components.ButtonBar;
	
	public class DocumentButtonBar extends ButtonBar
	{
		[SkinPart]
		public var newButton:Button;
		
		
		public function DocumentButtonBar()
		{
			super();
		}
		
		override protected function partAdded(partName:String, instance:Object):void {
			if( instance === newButton ) {
				newButton.addEventListener(MouseEvent.CLICK, onNewButtonClick);
			}
		}
		
		protected function onNewButtonClick(event:MouseEvent):void {
			// show open file window and import xml
		}
	}
}