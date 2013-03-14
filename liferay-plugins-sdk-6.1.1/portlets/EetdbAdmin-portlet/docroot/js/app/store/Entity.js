
Ext.define('EetdbAdmin.store.Entity', {
    extend: 'Ext.data.Store',

    requires: ['EetdbAdmin.model.Entity'],
    
    model: 'EetdbAdmin.model.Entity',
    
    proxy: {
    	type: 'ajax',
    	actionMethods: {
            create: 'POST', read: 'GET', update: 'POST', destroy: 'POST'
        },
    	url: entityTemplateControllerURL.toString(),
    	reader: 
    	{
    		type: 'json',
    		root: 'entity'
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
		
        loadUrl.setParameter('action', 'doEntityLoad');
        
        if (typeof options !== 'undefined' 
        	&& typeof options.params !== 'undefined'
        	&& typeof options.params.entityTemplateId !== 'undefined') {
        	
        	loadUrl.setParameter('entityTemplateId', options.params.entityId);
        
        } else {
        	
        	loadUrl.setParameter('entityId', 1);
        	
        }
        
        this.proxy.url = loadUrl.toString();
        
		this.callParent(arguments);
		
	}
	
	,sync: function (options)
	{
		
		var pUrl = portletUrl.createActionURL();
		pUrl.setPortletId(portletId);
		pUrl.setWindowState(exclusiveWindowState);
		
		pUrl.setParameter('action', 'doEntityPost');
        
        var postUrl = pUrl.toString();
        
        pUrl.setParameter('action', 'doEntityDestroy');
        
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
