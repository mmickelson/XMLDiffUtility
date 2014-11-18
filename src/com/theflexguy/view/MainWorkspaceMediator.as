package com.theflexguy.view
{
	import com.theflexguy.controller.events.DocumentEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MainWorkspaceMediator extends Mediator
	{
		public function MainWorkspaceMediator()
		{
			super();
		}
		
		override public function onRegister():void {
			addContextListener(DocumentEvent.XML_FILE_LOADED, onXmlLoaded);
		}
		
		protected function onXmlLoaded(event:DocumentEvent):void {
			trace("MainWorkspaceMediator.onXmlLoaded> " + event.xmlFile.name);
		}
	}
}