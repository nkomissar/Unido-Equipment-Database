Ext.define('EetdbAdmin.model.Entity', {
    extend: 'Ext.data.Model',
    
    requires:['EetdbAdmin.model.EntityProperty', 'EetdbAdmin.model.EntityTemplate', 'EetdbAdmin.model.Topic'], 
              
    proxy: {
        type: 'memory'
    },
    
    fields: [
         {name: 'id',  type: 'long'}
        ,{ //for comboboxes values
        	name: 'stringId',  
        	type: 'string',
        	persist: false,
        	convert: function(value, record) 
        	{
        		var id = record.get('id');
        		return id + "";
        	}
        }
        ,{name: 'name', type: 'string'}
        ,{name: 'version', type: 'long'}
    ]

    ,hasOne: 
    {
    	model: 'EetdbAdmin.model.EntityTemplate',
    	instanceName: 'EntityTemplate',
    	getterName: 'GetEntityTemplate',
    	setterName: 'SetEntityTemplate',
    	associationKey: 'entityTemplate', //used by reader.Json
    	name: 'entityTemplate' //used by writer.Json 
    	
    }
    
    ,hasMany: [
	    {
	    	model: 'EetdbAdmin.model.EntityProperty', 
	    	name: 'properties', 
	    	autoLoad: true,
	    	associationKey: 'properties',
	    	instanceName: 'properties'
	    },{
	    	model: 'EetdbAdmin.model.Entity', 
	    	name: 'childEntities', 
	    	autoLoad: true,
	    	associationKey: 'childEntities',
	    	instanceName: 'childEntities'
	    },{
	    	model: 'EetdbAdmin.model.Topic', 
	    	name: 'parentTopics', 
	    	autoLoad: true,
	    	associationKey: 'parentTopics',
	    	instanceName: 'parentTopics'
	    }
	]
    
});