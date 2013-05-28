Ext.define('EetdbAdmin.model.EntityTemplateProperty', {
    extend: 'Ext.data.Model',
    
    constructor: function(object) {
        
    	var me = this;
    	
    	me.callParent(arguments);
    	
    	if(!Ext.isObject(object))
    	{
    		//contructor not beign called from Store.add()->Store.createModel()
    		return;
    	}
    	
    	var associations = me.associations.items, 
        i = 0, 
        length = associations.length, 
        association, associationData, proxy, reader;
        
        for (; i < length; i++) {
            association = associations[i];
            associationData = object[association.associationKey || association.name];
            
            if (associationData) {
                reader = association.getReader();
                if (!reader) {
                    proxy = association.associatedModel.proxy;
                    // if the associated model has a Reader already, use that, otherwise attempt to create a sensible one
                    if (proxy) {
                        reader = proxy.getReader();
                    } else {
                        reader = new Ext.data.reader.Json({
                            model: association.associatedName
                        });
                    }
                }
                association.read(me, reader, associationData);
            }
        }    	
    	
    },
    
    proxy: {
        type: 'memory'
    },
    
    fields: [
         {name: 'id',  type: 'long'}
        ,{name: 'name', type: 'string'}
        ,{name: 'code', type: 'string'}
        ,{name: 'unitOfMeasure', type: 'string'}
        ,{name: 'displayInGrid', type: 'boolean'}
        ,{name: 'searchable', type: 'boolean'}
        ,{name: 'mandatory', type: 'boolean'}
        ,{name: 'version', type: 'long'}
    ],
    
    hasOne: 
    {
    	model: 'EetdbAdmin.model.ValueType',
    	instanceName: 'ValueType',
    	getterName: 'GetValueType',
    	setterName: 'SetValueType',
    	associationKey: 'valueType', //used by reader.Json
    	name: 'valueType' //used by writer.Json 
    	
    }
     
});