
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
		
        
        if (typeof options !== 'undefined' 
        	&& typeof options.params !== 'undefined')
        {
        	if (typeof options.params.entityId !== 'undefined') 
        	{
        	
        		loadUrl.setParameter('action', 'doEntityLoad');
        		loadUrl.setParameter('entityId', options.params.entityId);
        	}

        	if(typeof options.params.templateCode !== 'undefined')
    		{
	    	    loadUrl.setParameter('action', 'doEntityLoadByTemplateCode');
		    	loadUrl.setParameter('templateCode', options.params.templateCode);
    		}
        
        } 
        else 
        {
        	
        	return;
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
