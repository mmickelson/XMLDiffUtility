package com.theflexguy.view.xmlstructure
{
	import mx.collections.ArrayCollection;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class XmlElement extends SkinnableComponent
	{
		private var _parentElement:XmlElement;
		private var _elementName:String;
		private var _attributes:ArrayCollection = new ArrayCollection();
		private var _elements:ArrayCollection = new ArrayCollection();
		private var _value:String;
		
		public function XmlElement(nodeXml:XML, parentElement:XmlElement = null)
		{
			super();
			_parentElement = parentElement;
			_elementName = nodeXml.name();
			_value = nodeXml.text();
			trace("\n" + _elementName + ": " + _value);
			for each (var att:XML in nodeXml.@*) {
				trace("\t" + String(att.name()) + " = " + att.valueOf());
				attributes.addItem( new XmlAttribute( String(att.name()), String(att.valueOf()) ) );
			}
			for each( var element:XML in nodeXml.elements() ) {
				elements.addItem( new XmlElement(element, this) );
			}
		}
		

		public function get elementName():String
		{
			return _elementName;
		}

		public function set elementName(value:String):void
		{
			_elementName = value;
		}

		public function get attributes():ArrayCollection
		{
			return _attributes;
		}

		public function set attributes(value:ArrayCollection):void
		{
			_attributes = value;
		}

		public function get elements():ArrayCollection
		{
			return _elements;
		}

		public function set elements(value:ArrayCollection):void
		{
			_elements = value;
		}

		public function get value():String
		{
			return _value;
		}

		public function set value(value:String):void
		{
			_value = value;
		}


	}
}