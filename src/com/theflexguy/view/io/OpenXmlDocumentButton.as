package com.theflexguy.view.io
{
	
	import com.theflexguy.controller.events.DocumentEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.FileFilter;
	
	import spark.components.Button;
	import spark.components.supportClasses.SkinnableComponent;
	
	
	
	public class OpenXmlDocumentButton extends SkinnableComponent
	{
		[SkinPart]
		public var openButton:Button;
		
		public var fileNum:int;
		
		private var _fileToOpen:File;
		
		public function OpenXmlDocumentButton()
		{
			super();
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		} 
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
			if(instance === openButton) {
				openButton.addEventListener(MouseEvent.CLICK, openButtonClickHandler);
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
		}
		
		protected function openButtonClickHandler(event:MouseEvent):void {
			_fileToOpen = new File();
			var txtFilter:FileFilter = new FileFilter("XML", "*.xml");
			trace("OpenXmlDocumentButton.openButtonClickHandler> ");
			try 
			{
				trace("OpenXmlDocumentButton.openButtonClickHandler> opening dialog");
				_fileToOpen.browseForOpen("Open", [txtFilter]);
				_fileToOpen.addEventListener(Event.SELECT, fileSelected);
			}
			catch (error:Error)
			{
				trace("Failed:", error.message);
			}
		}
		
		protected function fileSelected(event:Event):void 
		{
			trace("OpenXmlDocumentButton.fileSelected> ");
			var fs:FileStream = new FileStream();
			fs.open(event.target as File, FileMode.READ);
			var xml:XML = XML(fs.readUTFBytes(fs.bytesAvailable));
			fs.close();
			trace("OpenXmlDocumentButton.fileSelected> " + xml.toXMLString());
			dispatchEvent(new DocumentEvent(DocumentEvent.XML_FILE_LOADED, _fileToOpen, xml, fileNum));
		}
	}
}