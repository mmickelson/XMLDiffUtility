package com.theflexguy.view.attributes
{
	import com.theflexguy.controller.events.InteractionEvent;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class AttributeGridMediator extends Mediator
	{
		[Bindable]
		public var attributeData:ArrayCollection = new ArrayCollection();
		
		private var _element1:XML;
		private var _element2:XML;
		
		public function AttributeGridMediator()
		{
			super();
		}
		
		override public function onRegister():void {
			addContextListener(InteractionEvent.ELEMENT_CHANGE, onElementChange, InteractionEvent);
			(viewComponent as AttributeGrid).dataProvider = attributeData;
			trace("AttributeGridMediator.onRegister> ");
		}
		
		protected function onElementChange(event:InteractionEvent):void {
			trace("AttributeGridMediator.onElementChange> ");
			if(event.fileNum == 1) {
				_element1 = event.element;
			} else {
				_element2 = event.element;
			}
			var names:Array = [];
			var att:XML;
			if(_element1) {
				for each (att in _element1.@*) {
					names.push(String(att.name()));				
				}
			}
			if(_element2) {
				for each (att in _element2.@*) {
					if(names.indexOf(String(att.name())) == -1) {
						names.push(String(att.name()));
					}
				}
			}
			names.sort();
			
			attributeData.removeAll();
			for each(var name:String in names) {
				var obj:Object = new Object();
				obj.name = name;
				obj.value1 = _element1 && _element1.hasOwnProperty("@"+name) ? String(_element1.attribute(name)) : null;
				obj.value2 = _element2 && _element2.hasOwnProperty("@"+name) ? String(_element2.attribute(name)) : null;
				attributeData.addItem(obj);
			}
			attributeData.refresh();
			
		}
	}
}