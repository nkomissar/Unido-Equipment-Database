
Ext.define('EetdbAdmin.store.EntitySearchResult', {
    extend: 'Ext.data.Store',

    model: 'EetdbAdmin.model.Entity',
    
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
		
	    loadUrl.setParameter('action', 'doEntitySearch');
	    
	    if (typeof options !== 'undefined' 
	    	&& typeof options.params !== 'undefined'
	    	&& typeof options.params.query !== 'undefined') {
	    	
	    	loadUrl.setParameter('query', options.params.query);
	    
	    } else {
	    	
	    	loadUrl.setParameter('query', 1);
	    	
	    }
	    
	    this.proxy.url = loadUrl.toString();
	    
		this.callParent(arguments);
		
	}

});