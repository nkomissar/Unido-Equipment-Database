
entityTemplateControllerURL.setParameter('action', 'doEntityTemplateList');


Ext.define('EetdbAdmin.model.EntityTemplate', {
    extend: 'Ext.data.Model',
    
    requires:['EetdbAdmin.model.EntityTemplateProperty'],
          
    proxy: {
        type: 'memory'
    },
    
    /*proxy: {
    	type: 'ajax',
    	actionMethods: {
            create: 'POST', read: 'GET', update: 'POST', destroy: 'POST'
        },
    	url: entityTemplateControllerURL.toString(),
    	reader: 
    	{
    		type: 'json',
    		root: 'template'
    	},
    	writer:
    	{
    		type: 'json',
    		root: 'data'
    	},
	},*/
    
    fields: [
        {name: 'id',  type: 'int'}
        ,{name: 'name', type: 'string'}
        ,{name:'lastUpdatedDate', type: 'long'}
    ]
    
    ,hasMany: 
    {
    	model: 'EetdbAdmin.model.EntityTemplateProperty', 
    	name: 'properties', 
    	autoLoad: true,
    	associationKey: 'properties'
    }
   
	,set: function(fieldName, newValue)
	{

		var me = this, 
         	single = (typeof fieldName == 'string');
		 
		 this.callParent(arguments);

		 if (!single
				 && typeof fieldName['properties'] !== 'undefined') {
			 me.properties().removeAll();
			 me.properties().add(fieldName['properties']);
			 me.dirty = true;
		 }
		 
	}

});