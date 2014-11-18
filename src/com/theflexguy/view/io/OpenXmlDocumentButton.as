package com.theflexguy.view.io
{
	
	import com.theflexguy.controller.events.DocumentEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	
	import spark.components.Button;
	import spark.components.supportClasses.SkinnableComponent;
	
	
	
	public class OpenXmlDocumentButton extends SkinnableComponent
	{
		[SkinPart]
		public var openButton:Button;
		
		public var fileNum:int;
		
		[Bindable]
		public var fileName:String = "";
		
		public var userFile:FileReference;
		
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
			userFile = new FileReference();
			var txtFilter:FileFilter = new FileFilter("XML", "*.xml");
			try 
			{
				userFile.browse([txtFilter]);
				userFile.addEventListener(Event.SELECT, fileSelected);
			}
			catch (error:Error)
			{
				trace("Failed:", error.message);
			}
		}
		
		protected function fileSelected(event:Event):void 
		{
			userFile.removeEventListener(Event.SELECT, fileSelected);
			userFile.addEventListener(Event.COMPLETE, loadCompleteHandler);
			userFile.load();
		}
			
		protected function loadCompleteHandler(event:Event):void {
			var xml:XML = XML(userFile.data);
			fileName = userFile.name;
			dispatchEvent(new DocumentEvent(DocumentEvent.XML_FILE_LOADED, userFile, xml, fileNum));
		}
	}
}