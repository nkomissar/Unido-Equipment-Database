Ext.define('EetdbAdmin.model.EntityProperty', {
    extend: 'Ext.data.Model',
    
    proxy: {
        type: 'memory'
    },
    
    fields: [
         {name: 'id',  type: 'long'}
        ,{name: 'value', type: 'string'}
        ,{name: 'version', type: 'long'}
    ],
    
    hasOne: 
    {
    	model: 'EetdbAdmin.model.EntityTemplateProperty',
    	instanceName: 'TemplateProperty',
    	getterName: 'GetTemplateProperty',
    	setterName: 'SetTemplateProperty',
    	associationKey: 'templateProperty', //used by reader.Json
    	name: 'templateProperty' //used by writer.Json 
    	
    }
});