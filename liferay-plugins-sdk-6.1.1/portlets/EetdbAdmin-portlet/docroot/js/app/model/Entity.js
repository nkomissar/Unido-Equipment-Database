Ext.define('EetdbAdmin.model.Entity', {
    extend: 'Ext.data.Model',
    
    requires:['EetdbAdmin.model.EntityProperty', 'EetdbAdmin.model.EntityTemplate'], 
              
    proxy: {
        type: 'memory'
    },
    
    fields: [
         {name: 'id',  type: 'long'}
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
	    }
	]
    
	,set: function(fieldName, newValue)
	{

		var me = this, 
         	single = (typeof fieldName == 'string');
		 
		 this.callParent(arguments);

		 if (single)
		 {
			 return;
		 }

		 me.dirty = true;
		 me.properties().removeAll();
		 
		 if (typeof fieldName['properties'] == 'undefined')
		 {
			 return;
		 }
			 
		 me.properties().add(fieldName['properties']);

		 if (typeof fieldName['entityTemplate'] == 'undefined')
		 {
			 return;
		 }

		 me['EntityTemplate'] = fieldName['entityTemplate'];
		 
	}
    
    
});