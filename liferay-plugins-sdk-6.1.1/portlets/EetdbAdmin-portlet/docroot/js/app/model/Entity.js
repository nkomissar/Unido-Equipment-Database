Ext.define('EetdbAdmin.model.Entity', {
    extend: 'Ext.data.Model',
    
    proxy: {
        type: 'memory'
    },
    
    fields: [
        {name: 'id',  type: 'string'}
        ,{name: 'name', type: 'string'}
        ,{name: 'entityType', type: 'string'}
    ]
});