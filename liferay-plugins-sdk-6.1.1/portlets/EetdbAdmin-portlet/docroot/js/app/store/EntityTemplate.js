Ext.data.Model.override({
    
    /**
     * @Override
     * Copies association data after calling super.copyFrom
     */
    copyFrom: function(sourceRecord) {
        this.callParent(arguments);
        var associations = this.associations.items,
            i, association, mine, theirs, instanceName;
        
        for (i=0; i<associations.length; i++) {
            association = associations[i];
            instanceName = association.instanceName;
            theirs = sourceRecord[instanceName];
            if (theirs) {
                mine = this[instanceName];
                if (mine) {
                    mine.copyFrom(theirs);
                }
                else {
                    this[instanceName] = theirs;
                }
            }
        }
    }
    
});


Ext.data.writer.Json.override({
    getRecordData: function(record) {
    	
        var /*me = this, i, association, childStore, */data = {};

        data = this.callParent(arguments);

        /* Iterate over all the hasMany associations */
        /*for (i = 0; i < record.associations.length; i++) 
        {

        	association = record.associations.get(i);
        	
            if (association.type == 'hasMany')  {
            
            	data[association.name] = [];
                childStore = eval('record.'+association.name+'()');

                //Iterate over all the children in the current association
                childStore.each(function(childRecord) {
					data[association.name].push(childRecord.getData());
                }, me);
            }
        }*/
        
        Ext.apply(data,record.getAssociatedData());
                
        return data;
        
    }
});

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
