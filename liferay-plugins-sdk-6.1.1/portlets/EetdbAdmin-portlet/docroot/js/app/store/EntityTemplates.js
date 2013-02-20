
Ext.define('EetdbAdmin.store.EntityTemplates', {
    extend: 'Ext.data.Store',

    model: 'EetdbAdmin.model.EntityTemplate',
    
    proxy: {
    	type: 'ajax',
    	url: doEntityTemplateListURL,
    	reader: 
    	{
    		type: 'json',
    		root: 'data'
    	}
	},

	autoLoad: true

});