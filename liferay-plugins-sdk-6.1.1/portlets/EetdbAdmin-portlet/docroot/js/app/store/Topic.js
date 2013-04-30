
Ext.define('EetdbAdmin.store.Topic', {
    extend: 'Ext.data.Store',

    requires: ['EetdbAdmin.model.Topic'],
    
    model: 'EetdbAdmin.model.Topic',
    
    proxy: {
    	type: 'ajax',
    	actionMethods: {
            create: 'POST', read: 'GET', update: 'POST', destroy: 'POST'
        },
    	reader: 
    	{
    		type: 'json',
    		root: 'topic'
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
		
        loadUrl.setParameter('action', 'doTopicLoad');
        
        if (typeof options !== 'undefined' 
        	&& typeof options.params !== 'undefined'
        	&& typeof options.params.topicId !== 'undefined') {
        	
        	loadUrl.setParameter('topicId', options.params.topicId);
        
        } else {
        	
        	loadUrl.setParameter('topicId', 1);
        	
        }
        
        this.proxy.url = loadUrl.toString();
        
		this.callParent(arguments);
		
	}
	
	,sync: function (options)
	{
		
		var pUrl = portletUrl.createActionURL();
		pUrl.setPortletId(portletId);
		pUrl.setWindowState(exclusiveWindowState);
		
		pUrl.setParameter('action', 'doTopicPost');
        
        var postUrl = pUrl.toString();
        
        pUrl.setParameter('action', 'doTopicDestroy');
        
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
