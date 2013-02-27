
entityTemplateControllerURL.setParameter('action', 'doEntityTemplateList');

Ext.define('EetdbAdmin.store.EntityTemplateSearchResult', {
    extend: 'Ext.data.Store',

    requires: ['EetdbAdmin.model.EntityTemplate'],
    
    model: 'EetdbAdmin.model.EntityTemplate',
    
    proxy: {
    	type: 'ajax',
    	url: entityTemplateControllerURL.toString(),
    	reader: 
    	{
    		type: 'json',
    		root: 'templates'
    	}
	},

	autoLoad: true

});