Ext.define('EetdbAdmin.model.EntityProperty', {
    extend: 'Ext.data.Model',
    
    proxy: {
        type: 'memory'
    },
    
    fields: [
         {name: 'id',  type: 'long'}
        ,{name: 'name', type: 'string'}
        ,{name: 'propertyTypeId', type: 'long'}
        ,{name: 'displayInGrid', type: 'boolean'}
        ,{name: 'mandatory', type: 'boolean'}
        ,{name: 'value', type: 'string'}
        ,{name: 'format', type: 'string'}
        ,{name: 'unitOfMeasure', type: 'string'}
        ,{name: 'type', type: 'string'}
        ,{name: 'lastUpdatedDate', type: 'long'}
    ]
});