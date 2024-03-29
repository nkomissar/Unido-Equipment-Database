
Ext.define('EetdbAdmin.store.EntityTemplate', {
    extend: 'Ext.data.Store',

    requires: ['EetdbAdmin.model.EntityTemplate'],
               
    model: 'EetdbAdmin.model.EntityTemplate',
    
    proxy: {
    	type: 'ajax',
    	actionMethods: {
            create: 'POST', read: 'GET', update: 'POST', destroy: 'POST'
        },
    	url: entityTemplateControllerURL.toString(),
    	reader: 
    	{
    		type: 'json',
    		root: 'template'
    	}
        ,writer:
    	{
    		type: 'json'
       		//,root: 'template'
    	}
	},

	load: function (options)
	{
		
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
	
	,sync: function (options)
	{
		
		var pUrl = portletUrl.createActionURL();
		pUrl.setPortletId(portletId);
		pUrl.setWindowState(exclusiveWindowState);
		
		pUrl.setParameter('action', 'doEntityTemplatePost');
        
        var postUrl = pUrl.toString();
        
        pUrl.setParameter('action', 'doEntityTemplateDestroy');
        
        var destroyUrl = pUrl.toString();
        
        Ext.apply(this.proxy.api, {
            create  : postUrl,
            read    : undefined,
            update  : postUrl,
            destroy : destroyUrl
        });
        
		this.callParent(arguments);
		
	}
	
	
	
	

});
