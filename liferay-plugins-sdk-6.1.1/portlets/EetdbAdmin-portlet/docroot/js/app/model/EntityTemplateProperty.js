Ext.define('EetdbAdmin.model.EntityTemplateProperty', {
    extend: 'Ext.data.Model',
    
    proxy: {
        type: 'memory'
    },
    
    fields: [
         {name: 'id',  type: 'long'}
        ,{name: 'name', type: 'string'}
        ,{name: 'code', type: 'string'}
        ,{name: 'unitOfMeasure', type: 'string'}
        ,{name: 'displayInGrid', type: 'boolean'}
        ,{name: 'mandatory', type: 'boolean'}
        ,{name: 'lastUpdatedDate', type: 'long'}
    ],
    
    hasOne: 
    {
    	model: 'EetdbAdmin.model.ValueType',
    	instanceName: 'ValueType',
    	getterName: 'GetValueType',
    	setterName: 'SetValueType',
    	associationKey: 'valueType',
    	
    }
     
});