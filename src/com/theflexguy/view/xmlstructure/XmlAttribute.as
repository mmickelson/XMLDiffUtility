package com.theflexguy.view.xmlstructure
{
	import spark.components.supportClasses.SkinnableComponent;
	
	public class XmlAttribute extends SkinnableComponent
	{
		public var label:String;
		public var value:String;
		
		public function XmlAttribute(label:String, value:String)
		{
			super();
			this.label = label;
			this.value = value;
		}
	}
}