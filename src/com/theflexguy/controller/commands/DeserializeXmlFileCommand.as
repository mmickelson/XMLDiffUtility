package com.theflexguy.controller.commands
{
	import com.theflexguy.controller.events.DocumentEvent;
	import com.theflexguy.xmlmodel.XmlDocument;
	import com.theflexguy.xmlmodel.XmlDocuments;
	
	import org.robotlegs.mvcs.Command;
	
	public class DeserializeXmlFileCommand extends Command
	{
		[Inject]
		public var docEvent:DocumentEvent;
		
		[Inject]
		public var documents:XmlDocuments;
		
		public function DeserializeXmlFileCommand()
		{
			super();
		}
		
		override public function execute():void {
			documents.addItem( new XmlDocument( docEvent.xml ) );
			trace("DeserializeXmlFileCommand.execute> finished creating documents");
			dispatch(new DocumentEvent(DocumentEvent.XML_FILE_DESERIALIZED, docEvent.xmlFile, docEvent.xml));
		}
		
	}
}