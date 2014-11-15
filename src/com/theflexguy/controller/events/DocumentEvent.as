package com.theflexguy.controller.events
{
	import flash.events.Event;
	import flash.filesystem.File;
	
	public class DocumentEvent extends Event
	{
		public static const XML_FILE_LOADED:String = "com.theflexguy.controller.events.DocumentEvent.XML_FILE_LOADED";
		public static const LOAD_XML_FILE:String = "com.theflexguy.controller.events.DocumentEvent.LOAD_XML_FILE";
		public static const XML_FILE_DESERIALIZED:String = "com.theflexguy.controller.events.DocumentEvent.XML_FILE_DESERIALIZED";
		
		
		private var _xmlFile:File;
		private var _xml:XML;
		public var fileNum:int;
		

		public function DocumentEvent(type:String, xmlFile:File, xml:XML, fileNum:int = 0) {
			_xmlFile = xmlFile;
			_xml = xml;
			this.fileNum = fileNum;
			super(type, false, false);
		}
		
		public function get xmlFile():File
		{
			return _xmlFile;
		}

		public function set xmlFile(value:File):void
		{
			_xmlFile = value;
		}

		public function get xml():XML
		{
			return _xml;
		}

		public function set xml(value:XML):void
		{
			_xml = value;
		}


	}
}