Ext.define('EetdbAdmin.model.EntityTemplateProperty', {
    extend: 'Ext.data.Model',
    
    proxy: {
        type: 'memory'
    },
    
    fields: [
        {name: 'id',  type: 'string'}
        ,{name: 'name', type: 'string'}
        ,{name: 'unitOfMeasure', type: 'string'}
        ,{name: 'displayInGrid', type: 'boolean'}
        ,{name: 'mandatory', type: 'boolean'}
    ]
});