Ext.define('EetdbAdmin.store.Entities', {
    extend: 'Ext.data.Store',

    model: 'EetdbAdmin.model.Entity',
    
    proxy: {
    	type: 'ajax',
    	url: doEntityLoadURL,
    	model: 'Entity',
    	reader: 'json'
	},

	autoLoad: true
    /*data: [
        {id: '1', name: 'Sement1',   type: 'SementType1'},
        {id: '2', name: 'Sement2',   type: 'SementType2'},
        {id: '3', name: 'Sement3',   type: 'SementType3'}
    ]*/
});