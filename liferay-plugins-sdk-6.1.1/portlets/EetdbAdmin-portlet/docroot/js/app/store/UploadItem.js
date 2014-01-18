
Ext.define('EetdbAdmin.store.UploadItem', {
    extend: 'Ext.data.Store',

    requires: ['EetdbAdmin.model.UploadItem'],
    
    model: 'EetdbAdmin.model.UploadItem',
    
    proxy: {
    	type: 'ajax',
    	actionMethods: {
            create: 'POST', read: 'GET', update: 'POST', destroy: 'POST'
        },
    	reader: 
    	{
    		type: 'json',
    		root: 'uploadItem'
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
		
        loadUrl.setParameter('action', 'getUploadItemDetails');
        
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
