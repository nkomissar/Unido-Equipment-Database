Ext.define('EetdbAdmin.model.EntityTemplateProperty', {
    extend: 'Ext.data.Model',
    
    proxy: {
        type: 'memory'
    },
    
    fields: [
        {name: 'id',  type: 'string'}
        ,{name: 'name', type: 'string'}
        ,{name: 'unitofmeasure', type: 'string'}
        ,{name: 'displayingrid', type: 'boolean'}
        ,{name: 'mandatory', type: 'boolean'}
    ]
});