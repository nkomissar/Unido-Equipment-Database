Ext.define('EetdbAdmin.model.EntityProperty', {
    extend: 'Ext.data.Model',
    
    proxy: {
        type: 'memory'
    },
    
    fields: [
         {name: 'id',  type: 'long'}
        ,{name: 'value', type: 'string'}
        ,{name: 'version', type: 'long'}
    ],
    
    hasOne: 
    {
    	model: 'EetdbAdmin.model.EntityTemplateProperty',
    	instanceName: 'TemplateProperty',
    	getterName: 'GetTemplateProperty',
    	setterName: 'SetTemplateProperty',
    	associationKey: 'templateProperty', //used by reader.Json
    	name: 'templateProperty' //used by writer.Json 
    	
    },
    
    constructor: function(object) {
        
    	var me = this;
    	
    	me.callParent(arguments);
    	
    	if(!Ext.isObject(object))
    	{
    		//constructor not being called from Store.add()->Store.createModel()
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
    	
    }
    
});