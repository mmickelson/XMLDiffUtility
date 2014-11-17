package com.theflexguy.view.xmlstructure
{
	import com.theflexguy.controller.events.DocumentEvent;
	import com.theflexguy.controller.events.InteractionEvent;
	import com.theflexguy.xmlmodel.XmlDocuments;
	
	import flash.events.Event;
	
	import mx.controls.Tree;
	import mx.events.ListEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class XmlTreeListMediator extends Mediator
	{
		[Inject]
		public var documents:XmlDocuments;
		
		public function XmlTreeListMediator()
		{
			super();
		}
		
		override public function onRegister():void {
			addContextListener(DocumentEvent.XML_FILE_LOADED, onXmlFileLoaded);
			view.addEventListener(ListEvent.CHANGE, treeChanged);
		}
		
		public function treeChanged(evt:Event):void {
			dispatch(new InteractionEvent(InteractionEvent.ELEMENT_CHANGE, view.fileNum, Tree(evt.target).selectedItem as XML));
		}
		
		protected function onXmlFileLoaded(event:DocumentEvent):void {
			if( event.fileNum == view.fileNum ) {
				view.dataProvider = event.xml;
			}
		}
		
		private function get view():XmlTreeList {
			return viewComponent as XmlTreeList;
		}
	}
}