Ext.define('EetdbAdmin.controller.Entities', {
    extend: 'Ext.app.Controller',

    stores: ['EntitySearchResult', 'Entity'],
    models: ['Entity', 'EntityProperty'],
    views: ['entity.List', 'entity.Item'],
    
    refs: [
        {ref: 'entityList', selector: 'entitylist'},
        {ref: 'entityData', selector: 'entitylist dataview'},
        {ref: 'searchQuery', selector: 'entitylist toolbar searchfield'},
        {ref: 'entityItem', selector: 'entityitem'},
        {ref: 'entityForm', selector: 'entityitem form'}
    ],
    
    // At this point things haven't rendered yet since init gets called on controllers before the launch function
    // is executed on the Application
    init: function() {
    	
        this.control({
            'entitylist dataview': {
                selectionchange: this.loadEntity
            },
            'entitylist toolbar searchfield': {
            	triggerclick: this.doSearch
            }
        });
    },
    
    onLaunch: function() {
   	
        var dataview = this.getEntityData(),
            store = this.getEntitySearchResultStore();
        
        dataview.bindStore(store);
        //dataview.getSelectionModel().select(store.getAt(0));
    },
    

    loadEntity: function(selModel, selected) 
    {
        var store = this.getEntityStore(),
        entity = selected[0],
        itemForm = this.getEntityForm();
    
	    var eItem = this.getEntityItem();
	    
	    if (typeof entity === 'undefined')
	    {
	    	this.application.fireEvent('entityUnselected');
	    	return;
	    }
	    
	    if (!entity.phantom
	    		&& !entity.dirty) 
	    {
	    	
	    	
	    	itemForm.setLoading({
	            msg: 'Loading entity...'
	        });
	
	    	store.load({
	            params: {
	            	action: 'doEntityLoad',
	                entityId: entity.get('id')
	            },
	            callback: function(records, operation, success) {
	            	
	            	itemForm.setLoading(false);
	            	eItem.loadRecord(records[0]);
	            	
	            }
	        });
	    	
	    	return;
	    }
	    
        eItem.loadRecord(entity);
        store.loadRecords([entity]);
    	this.application.fireEvent('entitySelected');

    },
    
    doSearch: function()
    {
    	
    	var queryBox = this.getSearchQuery(),
    	 store = this.getEntitySearchResultStore();
    	
    	store.load(
    			{
    				params: 
    				{
    					query: queryBox.getValue()
    				}
    			});
    	
    }
});