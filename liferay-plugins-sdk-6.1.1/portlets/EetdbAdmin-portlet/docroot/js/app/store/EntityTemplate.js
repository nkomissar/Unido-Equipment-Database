
//entityTemplateControllerURL.setParameter('action', 'doEntityTemplateLoad');
//entityTemplateControllerURL.setParameter('entityTemplateId', '2');

Ext.define('EetdbAdmin.store.EntityTemplate', {
    extend: 'Ext.data.Store',

    requires: ['EetdbAdmin.model.EntityTemplate'],
    
    model: 'EetdbAdmin.model.EntityTemplate',
    
    proxy: {
    	type: 'ajax',
    	url: entityTemplateControllerURL.toString(),
    	reader: 
    	{
    		type: 'json',
    		root: 'template'
    	}
	},

	//autoLoad: true,
	
	load: function (options){
		
		debugger;
		
		var loadUrl = portletUrl.createRenderURL();
		loadUrl.setPortletId(portletId);
		loadUrl.setWindowState(exclusiveWindowState);
		
        loadUrl.setParameter('action', 'doEntityTemplateLoad');
        
        if (typeof options !== 'undefined' 
        	&& typeof options.params !== 'undefined'
        	&& typeof options.params.entityTemplateId !== 'undefined') {
        	
        	loadUrl.setParameter('entityTemplateId', options.params.entityTemplateId);
        
        } else {
        	
        	loadUrl.setParameter('entityTemplateId', 1);
        	
        }
        
        this.proxy.url = loadUrl.toString();
        
		this.callParent(arguments);
		
	}
	
	

});
