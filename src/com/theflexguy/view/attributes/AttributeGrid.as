package com.theflexguy.view.attributes
{
	import mx.collections.ArrayList;
	
	import spark.components.DataGrid;
	import spark.components.gridClasses.GridColumn;
	
	public class AttributeGrid extends DataGrid
	{
		public function AttributeGrid()
		{
			super();
			columns = new ArrayList();
			columns.addItem(new GridColumn("name"));
			columns.addItem(new GridColumn("value1"));
			columns.addItem(new GridColumn("value2"));
			
		}
	}
}