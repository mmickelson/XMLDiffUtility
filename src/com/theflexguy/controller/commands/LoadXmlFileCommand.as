package com.theflexguy.controller.commands
{
	import com.theflexguy.controller.events.DocumentEvent;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadXmlFileCommand extends Command
	{
		[Inject]
		public var event:DocumentEvent;
		
		public function LoadXmlFileCommand()
		{
			super();
		}
		
		override public function execute():void {
			var file:File = new File(event.xmlFilePath);
			
			var fs:FileStream = new FileStream();
			fs.open(file, FileMode.READ);
			var xml:XML = XML(fs.readUTFBytes(file.size));
			fs.close();
			
			var docEvent:DocumentEvent = new DocumentEvent();
			docEvent.xml = xml;
			docEvent.xmlFile = file;
			docEvent.xmlFilePath = event.xmlFilePath;
			dispatch(docEvent);
		}
	}
}