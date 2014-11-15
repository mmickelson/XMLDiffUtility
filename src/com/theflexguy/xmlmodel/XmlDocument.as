package com.theflexguy.xmlmodel
{
	import com.theflexguy.view.xmlstructure.XmlElement;
	
	import flash.filesystem.File;
	
	import mx.collections.ArrayCollection;
	
	public class XmlDocument
	{
		public var xmlfile:File;
		public var elements:ArrayCollection = new ArrayCollection();
		public var rootElement:XmlElement;
		
		public function XmlDocument(rootElementXml:XML)
		{
			super();
			this.rootElement = new XmlElement(rootElementXml);
		}
		
	}
}