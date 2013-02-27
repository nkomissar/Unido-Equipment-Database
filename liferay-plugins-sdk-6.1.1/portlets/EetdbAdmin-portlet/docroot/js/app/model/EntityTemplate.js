
entityTemplateControllerURL.setParameter('action', 'doEntityTemplateList');


Ext.define('EetdbAdmin.model.EntityTemplate', {
    extend: 'Ext.data.Model',
    
    requires:['EetdbAdmin.model.EntityTemplateProperty'],
          
    proxy: {
        type: 'memory'
    },
    
    /*proxy: {
    	type: 'ajax',
    	url: entityTemplateControllerURL.toString(),
    	reader: 
    	{
    		type: 'json',
    		root: 'data'
    	}
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
});