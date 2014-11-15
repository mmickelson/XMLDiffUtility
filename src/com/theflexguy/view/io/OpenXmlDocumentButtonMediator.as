package com.theflexguy.view.io
{
	import com.theflexguy.controller.events.DocumentEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class OpenXmlDocumentButtonMediator extends Mediator
	{
		public function OpenXmlDocumentButtonMediator()
		{
			super();
		}
		
		override public function onRegister():void {
			(viewComponent as OpenXmlDocumentButton).addEventListener(DocumentEvent.XML_FILE_LOADED, onXmlFileLoaded);
		}
		
		protected function onXmlFileLoaded(event:DocumentEvent):void
		{
			dispatch(new DocumentEvent(DocumentEvent.XML_FILE_LOADED, event.xmlFile, event.xml, event.fileNum));
		}
	}
}