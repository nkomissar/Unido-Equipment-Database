Ext.define('EetdbAdmin.model.EntitySearchResult', 
{
    extend: 'Ext.data.Model',
    
    proxy: {
        type: 'memory'
    },
    
    idProperty: 'entityId',
    
    fields: [
         {name: 'entityId',  type: 'int'}
        ,{name: 'entityName', type: 'string'}
        ,{name: 'entityDescription', type: 'string'}
    ]
    
});