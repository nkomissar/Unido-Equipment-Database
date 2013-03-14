Ext.define('EetdbAdmin.model.ValueType', {
    extend: 'Ext.data.Model',
    
    proxy: {
        type: 'memory'
    },
    
    fields: [
         {name: 'id', type: 'long'}
        ,{name: 'version', type: 'long'}
        ,{name: 'type', type: 'string'}
        ,{name: 'format', type: 'string'}
    ]
});