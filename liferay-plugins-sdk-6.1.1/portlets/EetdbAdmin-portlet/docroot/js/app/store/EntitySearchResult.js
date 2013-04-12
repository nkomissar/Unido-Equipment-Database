
Ext.define('EetdbAdmin.store.EntitySearchResult', {
    extend: 'Ext.data.Store',

    model: 'EetdbAdmin.model.EntitySearchResult',
    
    proxy: {
    	type: 'ajax',
    	reader: 
    	{
    		type: 'json',
    		root: 'entities'
    	}
	}

	,load: function (options)
	{
		
		var loadUrl = portletUrl.createRenderURL();
		loadUrl.setPortletId(portletId);
		loadUrl.setWindowState(exclusiveWindowState);
		
	    if (typeof options !== 'undefined' 
	    	&& typeof options.params !== 'undefined')
	    {
	    	if(typeof options.params.query !== 'undefined')
    		{
	    	    loadUrl.setParameter('action', 'doEntitySearch');
		    	loadUrl.setParameter('query', options.params.query);
    		}
	    	
	    	if(typeof options.params.templateCode !== 'undefined')
    		{
	    	    loadUrl.setParameter('action', 'doEntityLoadByTemplateCode');
		    	loadUrl.setParameter('templateCode', options.params.templateCode);
    		}
	    
	    } else {
	    	
    	    return;
	    	
	    }
	    
	    this.proxy.url = loadUrl.toString();
	    
		this.callParent(arguments);
		
	}

});