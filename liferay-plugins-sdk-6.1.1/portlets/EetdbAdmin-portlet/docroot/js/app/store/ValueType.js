
Ext.define('EetdbAdmin.store.ValueType', {
    extend: 'Ext.data.Store',
    
    model: 'EetdbAdmin.model.ValueType',
    
    autoLoad: true,
    
    proxy: {
    	type: 'ajax',
    	actionMethods: {
            create: 'POST', read: 'GET', update: 'POST', destroy: 'POST'
        },
    	reader: 
    	{
    		type: 'json',
    		root: 'data'
    	}
	},

	load: function (options)
	{
		
		var loadUrl = portletUrl.createRenderURL();
		loadUrl.setPortletId(portletId);
		loadUrl.setWindowState(exclusiveWindowState);
		
        loadUrl.setParameter('action', 'doValueTypeList');
        
        this.proxy.url = loadUrl.toString();
        
		this.callParent(arguments);
		
	}
	
	,sync: function (options)
	{
		//never save value type
		return;		
	}

});
