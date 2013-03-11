Ext.define('EetdbAdmin.model.Entity', {
    extend: 'Ext.data.Model',
    
    proxy: {
        type: 'memory'
    },
    
    fields: [
         {name: 'id',  type: 'long'}
        ,{name: 'typeId', type: 'long'}
        ,{name: 'name', type: 'string'}
        ,{name: 'entityType', type: 'string'}
        ,{name: 'lastUpdatedDate', type: 'long'}
    ]
    
    ,hasMany: [
	    {
	    	model: 'EetdbAdmin.model.EntityProperty', 
	    	name: 'properties', 
	    	autoLoad: true,
	    	associationKey: 'properties',
	    	instanceName: 'properties'
	    },{
	    	model: 'EetdbAdmin.model.Entity', 
	    	name: 'childEntities', 
	    	autoLoad: true,
	    	associationKey: 'childEntities',
	    	instanceName: 'childEntities'
	    }
	]
    
    
});