
Ext.define('EetdbAdmin.store.UploadQueue', {
    extend: 'Ext.data.Store',

    model: 'EetdbAdmin.model.UploadItem',
    
    proxy: {
    	type: 'ajax',
    	reader: 
    	{
    		type: 'json',
    		root: 'uploadQueue'
    	}
	}

	,autoLoad: true

	,load: function (options)
	{

		var loadUrl = portletUrl.createRenderURL();
		loadUrl.setPortletId(portletId);
		loadUrl.setWindowState(exclusiveWindowState);
		
	    loadUrl.setParameter('action', 'getUploadQueue');
	    
	    this.proxy.url = loadUrl.toString();
	    
		this.callParent(arguments);
		
	}

});