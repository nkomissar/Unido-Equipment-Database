Ext.define('EetdbAdmin.controller.Topics', {
    extend: 'Ext.app.Controller',

    stores: ['TopicSearchResult', 'Topic'],
    models: ['Topic'],
    views: ['topic.List', 'topic.Item', 'entity.ListWindow'],
    
    refs: [
        {ref: 'topicList', selector: 'topiclist'},
        {ref: 'topicData', selector: 'topiclist dataview'},
        {ref: 'searchQuery', selector: 'topiclist toolbar searchfield'},
        {ref: 'topicItem', selector: 'topicitem'},
        {ref: 'topicForm', selector: 'topicitem form'},
        {ref: 'linkedEntities', selector: 'topicitem form dataview[name=linkedEntities]'},
        {ref: 'entitySearchData', selector: 'entitylistwindow[entityListWindowInstance=entitySearchForTopic] dataview'},
        {ref: 'entitySearchQuery', selector: 'entitylistwindow[entityListWindowInstance=entitySearchForTopic] toolbar searchfield'},
        {
            ref: 'entityListWindow', 
            selector: 'entitylistwindow[entityListWindowInstance=entitySearchForTopic]', 
            autoCreate: true,
            xtype: 'entitylistwindow',
            entityListWindowInstance: 'entitySearchForTopic'
            	
        }
    ],
    
    // At this point things haven't rendered yet since init gets called on controllers before the launch function
    // is executed on the Application
    init: function() {
    	
        this.control({
            'topiclist dataview': {
                selectionchange: this.loadTopic
            },
            'topiclist toolbar searchfield': {
            	triggerclick: this.doSearch
            }
            ,'topicitem button[action=create]': {
                click: this.submitTopic
            }
            ,'topicitem button[action=addchildentity]': {
                click: this.showAddChildEntity
            }
            ,'topicitem button[action=removechildentity]': {
                click: this.unlinkSelectedEntities
            }
            //should go to subcontroller
            ,'entitylistwindow[entityListWindowInstance=entitySearchForTopic] toolbar searchfield': {
            	triggerclick: this.doEntitySearch
            }
            ,'entitylistwindow[entityListWindowInstance=entitySearchForTopic] button[action=add]': {
            	click: this.linkSelectedEntities
            }
        });
        
    	this.application.on(
    			{
    				addTopic: this.addTopic,
    				removeTopic: this.removeTopic,
    				scope: this
    			});
    },
    
    onLaunch: function() {
   	
        var dataview = this.getTopicData(),
            store = this.getTopicSearchResultStore();
        
        dataview.bindStore(store);
		
		var entitySearchStore = Ext.create(this.application.getModuleClassName('EntitySearchResult', 'store'));
		var entitySearchView = this.getEntityListWindow();
		var entitySearchDataView = entitySearchView.down('dataview');
 
		entitySearchView.entityListWindowInstance = 'entitySearchForTopic';
		
		entitySearchDataView.bindStore(entitySearchStore);
		
    },

    loadTopic: function(selModel, selected) 
    {
        var store = this.getTopicStore(),
        searchTopic = selected[0],
        itemForm = this.getTopicForm();
    
	    var eItem = this.getTopicItem();
	    
	    eItem.show();
	    
	    if (typeof searchTopic === 'undefined')
	    {
	    	this.application.fireEvent('topicUnselected');
	    	return;
	    }
	    
	    if (!searchTopic.phantom
	    		&& !searchTopic.dirty) 
	    {
	    	
	    	
	    	itemForm.setLoading({
	            msg: 'Loading topic...'
	        });
	
	    	store.load({
	            params: {
	            	action: 'doTopicLoad',
	                topicId: searchTopic.get('id')
	            },
	            callback: function(records, operation, success) {
	            	
	            	itemForm.setLoading(false);
	            	eItem.loadRecord(records[0]);
	            	
	            }
	        });
	    	
	    	return;
	    }
	    
        eItem.loadRecord(searchTopic);
        store.loadRecords([searchTopic]);
    	this.application.fireEvent('topicSelected');

    },
    
    doSearch: function()
    {
    	
    	var queryBox = this.getSearchQuery(),
    	 store = this.getTopicSearchResultStore();
    	
    	store.load(
    			{
    				params: 
    				{
    					query: queryBox.getValue()
    				}
    			});
    	
    },

    addTopic: function()
    {
    	
    	var searchDataview = this.getTopicData();
        var searchStore = this.getTopicSearchResultStore();
        
        searchStore.insert(0, Ext.create('EetdbAdmin.model.Topic', { id: 0, name: 'New Topic'} ));
        
        searchDataview.getSelectionModel().select(0);

    }
    
    ,removeTopic: function()
    {
    	
    	var searchDataview = this.getTopicData();
        var searchStore = this.getTopicSearchResultStore();
    	var store = this.getTopicStore();

        var recordInSearch = searchDataview.getSelectionModel().getSelection()[0];
    	var record = store.getAt(0);

        if (typeof recordInSearch === 'undefined'
        	|| typeof record === 'undefined'
        	|| recordInSearch.get('id') != record.get('id')) 
        {
        	return;
        }
        
        store.remove(record);
    	
    	if (record.phantom
    			|| recordInSearch.phantom)
    	{

        	searchStore.remove(recordInSearch);
    		
    		if (searchDataview.store.data.length === 0)
	    	{
	    		return;
	    	}

	    	var newIndex = recordInSearch.removedFrom > 0 ? recordInSearch.removedFrom - 1 : 0;	
	    	
	    	searchDataview.getSelectionModel().select(newIndex);

	    	return;
    	}
        
    	searchDataview.setLoading({
            msg: 'Removing topic...'
        });
    	
    	store.sync({
    		success: function()
    		{
    			
    			searchDataview.setLoading(false);
    	    	searchStore.remove(recordInSearch);

    	    	if (searchDataview.store.data.length === 0)
    	    	{
    	    		return;
    	    	}

    	    	var newIndex = recordInSearch.removedFrom > 0 ? recordInSearch.removedFrom - 1 : 0;	
    	    	
    	    	searchDataview.getSelectionModel().select(newIndex);

    		
    		}
    		,failure: function (){
    			searchDataview.setLoading(false);
    		},
    		scope: this
    	});
    }
    
    ,submitTopic: function() {
    	
    	var itemForm = this.getTopicForm();
    	var itemView = this.getTopicItem();
    	var store = this.getTopicStore();
    	var values = itemView.getFieldValues();
    	//var templateStore = this.getEntityTemplateStore();

    	var searchDataview = this.getTopicData();
        var recordInSearch = searchDataview.getSelectionModel().getSelection()[0];

        itemForm.setLoading({
            msg: 'Saving topic...'
        });
        
        /*
        templateStore.load(
        {
	        params: {
	        	action: 'doEntityTemplateLoad',
	            entityTemplateId: values.entityTemplate['id']
	        },
	        callback: function(records, operation, success) {
	    	
	        	values.entityTemplate = records[0].data;
	        	*/
    	
    	store.loadRawData( { topic: [values] });
    	
    	var record = store.getAt(0);
    	
    	record.dirty = true;
    	//always re-read ID from server response
    	record.phantom = true;
    	
    	//record.set(values);
    	
    	store.sync({
    		success: function(){
    			
    			var newrec = store.getAt(0);
    			
    			recordInSearch.set(newrec);
    			recordInSearch.commit();
    			
    			itemView.loadRecord(newrec);
    			
    	    	itemForm.setLoading(false);
    	    	
    		}
    		,failure: function (){
    	    	itemForm.setLoading(false);
    		},
    		scope: this
    	});
	        /*}
        });*/

    }
    
    ,showAddChildEntity: function() {
    	this.getEntityListWindow().show();
    }

	,doEntitySearch: function()
    {
    	
    	var queryBox = this.getEntitySearchQuery();
		var entitySearchDataView = this.getEntitySearchData();
    	var store = entitySearchDataView.store;
    	
    	store.load(
    			{
    				params: 
    				{
    					query: queryBox.getValue()
    				}
    			});
    	
    }

    ,linkSelectedEntities: function(){
		
    	var entitySearchView = this.getEntityListWindow();
		var entitySearchDataView = entitySearchView.down('dataview');
		
		var linkedEntitiesDataView = this.getLinkedEntities();
		
		var selectedItems = entitySearchDataView.getSelectionModel().getSelection();
		
		linkedEntitiesDataView.store.clearFilter(true);
		
		Ext.each(selectedItems, function(item){
			
			linkedEntitiesDataView.store
				.loadRawData(
							{
								id: item.get('entityId'), 
								name: item.get('entityName')
							}, 
							true
							);
		
		});
		
	
		entitySearchView.hide();

    }
    
    ,unlinkSelectedEntities: function(){
    
		var linkedEntitiesDataView = this.getLinkedEntities();
		
		var selectedItems = linkedEntitiesDataView.getSelectionModel().getSelection();

		linkedEntitiesDataView.store
				.remove(selectedItems);
		

    }
});