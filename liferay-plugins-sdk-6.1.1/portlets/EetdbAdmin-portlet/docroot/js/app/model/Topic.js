Ext.define('EetdbAdmin.model.Topic', {
    extend: 'Ext.data.Model',
    
    requires:['EetdbAdmin.model.Entity'], 
              
    proxy: {
        type: 'memory'
    },
    
    fields: [
         {name: 'id',  type: 'long'}
        ,{name: 'name', type: 'string'}
        ,{name: 'description', type: 'string'}
        ,{name: 'version', type: 'long'}
    ]
    
    ,hasMany: [
	    {
	    	model: 'EetdbAdmin.model.Topic', 
	    	name: 'childTopics', 
	    	autoLoad: true,
	    	associationKey: 'childTopics',
	    	instanceName: 'childTopics'
	    },{
	    	model: 'EetdbAdmin.model.Entity', 
	    	name: 'entitiesOfTopic', 
	    	autoLoad: true,
	    	associationKey: 'entitiesOfTopic',
	    	instanceName: 'entitiesOfTopic'
	    }
	]
    
});