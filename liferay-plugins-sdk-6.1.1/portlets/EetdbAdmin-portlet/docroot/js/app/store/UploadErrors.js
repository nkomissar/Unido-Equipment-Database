
Ext.define('EetdbAdmin.store.UploadErrors', {
    extend: 'Ext.data.Store',

    requires: ['EetdbAdmin.model.UploadError'],
    
    model: 'EetdbAdmin.model.UploadError',
    
    proxy: {
    	type: 'ajax',
    	actionMethods: {
            create: 'POST', read: 'GET', update: 'POST', destroy: 'POST'
        },
    	reader: 
    	{
    		type: 'json',
    		root: 'uploadErrors'
    	}
        ,writer:
    	{
    		type: 'json'
    	}
	},

	load: function (options)
	{
		
		var loadUrl = portletUrl.createRenderURL();
		loadUrl.setPortletId(portletId);
		loadUrl.setWindowState(exclusiveWindowState);
		
        loadUrl.setParameter('action', 'getUploadItemErrors');
        
        if (typeof options !== 'undefined' 
        	&& typeof options.params !== 'undefined'
        	&& typeof options.params.uploadItemId !== 'undefined') {
        	
        	loadUrl.setParameter('uploadItemId', options.params.uploadItemId);
        
        } else {
        	
        	loadUrl.setParameter('uploadItemId', 1);
        	
        }
        
        this.proxy.url = loadUrl.toString();
        
		this.callParent(arguments);
		
	}

});
