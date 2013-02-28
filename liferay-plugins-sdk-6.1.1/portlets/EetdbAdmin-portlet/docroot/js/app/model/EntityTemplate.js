
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
    ]
    
    ,hasMany: 
    {
    	model: 'EetdbAdmin.model.EntityTemplateProperty', 
    	name: 'properties', 
    	autoLoad: true,
    	associationKey: 'properties'
    }
   
	/*,statics: {
		load1: function( id, config) {

			debugger;
			
			var loadUrl = portletUrl.createRenderURL();
			loadUrl.setPortletId(portletId);
			loadUrl.setWindowState(exclusiveWindowState);
			
	        loadUrl.setParameter('action', 'doEntityTemplateLoad');
	        loadUrl.setParameter('entityTemplateId', id);
	        
	        this.proxy.url = loadUrl.toString();

			this.callParent(arguments);
		}
	}*/
	,set: function(fieldName, newValue)
	{
		 var me = this, 
         	single = (typeof fieldName == 'string');
		 
		 debugger;
		 
		 this.callParent(arguments);

		 if (!single
				 && typeof fieldName['properties'] !== 'undefined') {
			 me.properties().removeAll();
			 me.properties().add(fieldName['properties']);
			 me.dirty = true;
		 }	
	}

});