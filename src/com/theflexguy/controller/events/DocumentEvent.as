package com.theflexguy.controller.events
{
	import flash.events.Event;
	import flash.filesystem.File;
	
	public class DocumentEvent extends Event
	{
		public static const XML_FILE_LOADED:String = "com.theflexguy.controller.events.DocumentEvent.XML_FILE_LOADED";
		public static const LOAD_XML_FILE:String = "com.theflexguy.controller.events.DocumentEvent.LOAD_XML_FILE";
		public static const XML_FILE_DESERIALIZED:String = "com.theflexguy.controller.events.DocumentEvent.XML_FILE_DESERIALIZED";
		
		
		public var xmlFile:File;
		public var xml:XML;
		public var fileNum:int;
		

		public function DocumentEvent(type:String, xmlFile:File, xml:XML, fileNum:int = 0) {
			this.xmlFile = xmlFile;
			this.xml = xml;
			this.fileNum = fileNum;
			super(type, false, false);
		}
	}
}