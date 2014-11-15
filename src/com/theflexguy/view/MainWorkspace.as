package com.theflexguy.view
{
	import mx.collections.ArrayCollection;
	import mx.controls.MenuBar;
	
	import spark.components.SkinnableContainer;
	
	public class MainWorkspace extends SkinnableContainer
	{
		private var _menuBar:MenuBar;
		
		private var _documentPanes:ArrayCollection;
		
		public function MainWorkspace()
		{
			super();
		}
	}
}