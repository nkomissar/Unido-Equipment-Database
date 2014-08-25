
entityTemplateControllerURL.setParameter('action', 'doEntityTemplateList');


Ext.define('EetdbAdmin.model.EntityTemplate', {
    extend: 'Ext.data.Model',
    
    requires:['EetdbAdmin.model.EntityTemplateProperty'],  
    
    proxy: {
        type: 'memory'
    },
    
    fields: [
         {name: 'id',  type: 'long'}
        ,{name: 'name', type: 'string'}
        ,{name: 'code', type: 'string'}
        ,{name: 'isReference', type: 'boolean'}
        ,{name: 'version', type: 'long'}
    ]
    
    ,hasMany: 
    {
    	model: 'EetdbAdmin.model.EntityTemplateProperty', 
    	name: 'properties', 
    	autoLoad: true,
    	associationKey: 'properties',
    	instanceName: 'properties'
    }
   
	/*,set: function(fieldName, newValue)
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
		 
	}*/

});