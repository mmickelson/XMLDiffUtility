package com.theflexguy
{
	import com.theflexguy.view.MainWorkspace;
	import com.theflexguy.view.MainWorkspaceMediator;
	import com.theflexguy.view.attributes.AttributeGrid;
	import com.theflexguy.view.attributes.AttributeGridMediator;
	import com.theflexguy.view.io.OpenXmlDocumentButton;
	import com.theflexguy.view.io.OpenXmlDocumentButtonMediator;
	import com.theflexguy.view.xmlstructure.XmlTreeList;
	import com.theflexguy.view.xmlstructure.XmlTreeListMediator;
	import com.theflexguy.xmlmodel.XmlDocuments;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	
	public class ApplicationContext extends Context
	{
		public function ApplicationContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void {
			trace("ApplicationContext.startup> ");
			// injections
			injector.mapSingleton(XmlDocuments);
			
			// mediators
			mediatorMap.mapView(MainWorkspace, MainWorkspaceMediator);
			mediatorMap.mapView(OpenXmlDocumentButton, OpenXmlDocumentButtonMediator);
			mediatorMap.mapView(XmlTreeList, XmlTreeListMediator);
			mediatorMap.mapView(AttributeGrid, AttributeGridMediator);
		}
	}
}