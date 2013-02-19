Ext.define('EetdbAdmin.store.Entities', {
    extend: 'Ext.data.Store',

    model: 'EetdbAdmin.model.Entity',
    
    proxy: {
    	type: 'ajax',
    	url: doEntityLoadURL,
    	reader: 
    	{
    		type: 'json',
    		root: 'data'
    	}
	},

	autoLoad: true

});