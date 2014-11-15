package com.theflexguy.controller.events
{
	import flash.events.Event;
	
	public class InteractionEvent extends Event
	{
		public static const ELEMENT_CHANGE:String = "elementChange";
		
		public var element:XML;
		public var fileNum:int;
		
		public function InteractionEvent(type:String, fileNum:int, element:XML)
		{
			super(type, false, false);
			this.element = element;
			this.fileNum = fileNum;
		}
	}
}