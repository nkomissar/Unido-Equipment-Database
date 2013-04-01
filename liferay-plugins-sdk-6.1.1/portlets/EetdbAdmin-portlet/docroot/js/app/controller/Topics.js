Ext.define('EetdbAdmin.controller.Topics', {
    extend: 'Ext.app.Controller',

    stores: ['TopicSearchResult', 'Topic'],
    models: ['Topic'],
    views: ['topic.List', 'topic.Item', 'entity.ListWindow', 'topic.ListWindow'],
    
    refs: [
        {ref: 'topicList', 			selector: 'topiclist[topicListInstance=mainTopicSearch]'},
        {ref: 'topicData', 			selector: 'topiclist[topicListInstance=mainTopicSearch] dataview'},
        {ref: 'searchQuery', 		selector: 'topiclist[topicListInstance=mainTopicSearch] toolbar searchfield'},
        {ref: 'topicItem', 			selector: 'topicitem'},
        {ref: 'topicForm', 			selector: 'topicitem form'},
        {ref: 'linkedEntities', 	selector: 'topicitem form dataview[name=linkedEntities]'},
        {ref: 'entitySearchData', 	selector: 'entitylistwindow[entityListWindowInstance=entitySearchForTopic] dataview'},
        {ref: 'entitySearchQuery', 	selector: 'entitylistwindow[entityListWindowInstance=entitySearchForTopic] toolbar searchfield'},
        {ref: 'linkedTopics', 		selector: 'topicitem form dataview[name=linkedTopics]'},
        {ref: 'topicSearchData', 	selector: 'topiclistwindow[topicListInstance=topicSearchForTopic] dataview'},
        {ref: 'topicSearchQuery', 	selector: 'topiclistwindow[topicListInstance=topicSearchForTopic] toolbar searchfield'},
        {
            ref: 'entityListWindow', 
            selector: 'entitylistwindow[entityListWindowInstance=entitySearchForTopic]', 
            autoCreate: true,
            xtype: 'entitylistwindow',
            entityListWindowInstance: 'entitySearchForTopic'
            	
        },
        {
            ref: 'topicListWindow', 
            selector: 'topiclistwindow[topicListInstance=topicSearchForTopic]', 
            autoCreate: true,
            xtype: 'topiclistwindow',
            topicListInstance: 'topicSearchForTopic'
            	
        }
    ],
    
    // At this point things haven't rendered yet since init gets called on controllers before the launch function
    // is executed on the Application
    init: function() {
    	
        this.control({
            'topiclist[topicListInstance=mainTopicSearch] dataview': {
                selectionchange: this.loadTopic
            },
            'topiclist[topicListInstance=mainTopicSearch] toolbar searchfield': {
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
            ,'topicitem button[action=addchildtopic]': {
                click: this.showAddChildTopic
            }
            ,'topicitem button[action=removechildtopic]': {
                click: this.unlinkSelectedTopics
            }            
            //should go to subcontroller
            ,'entitylistwindow[entityListWindowInstance=entitySearchForTopic] toolbar searchfield': {
            	triggerclick: this.doEntitySearch
            }
            ,'entitylistwindow[entityListWindowInstance=entitySearchForTopic] button[action=add]': {
            	click: this.linkSelectedEntities
            }
            ,'topiclistwindow[topicListWindowInstance=topicSearchForTopic] toolbar searchfield': {
            	triggerclick: this.doTopicSearch
            }
            ,'topiclistwindow[topicListWindowInstance=topicSearchForTopic] button[action=add]': {
            	click: this.linkSelectedTopics
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

		var topicSearchStore = Ext.create(this.application.getModuleClassName('TopicSearchResult', 'store'));
		var topicSearchView = this.getTopicListWindow();
		var topicSearchDataView = topicSearchView.down('dataview');
 
		topicSearchView.topicListWindowInstance = 'topicSearchForTopic';
		
		topicSearchDataView.bindStore(topicSearchStore);
		
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

    ,showAddChildTopic: function() {
    	this.getTopicListWindow().show();
    }

	,doTopicSearch: function()
    {
    	
    	var queryBox = this.getTopicSearchQuery();
		var topicSearchDataView = this.getTopicSearchData();
    	var store = topicSearchDataView.store;
    	
    	store.load(
    			{
    				params: 
    				{
    					query: queryBox.getValue()
    				}
    			});
    	
    }

    ,linkSelectedTopics: function(){
		
    	var topicSearchView = this.getTopicListWindow();
		var topicSearchDataView = topicSearchView.down('dataview');
		
		var linkedTopicsDataView = this.getLinkedTopics();
		
		var selectedItems = topicSearchDataView.getSelectionModel().getSelection();
		
		linkedTopicsDataView.store.clearFilter(true);
		
		Ext.each(selectedItems, function(item){
			
			linkedTopicsDataView.store
				.loadRawData( item.data, true);
		
		});
		
	
		topicSearchView.hide();

    }
    
    ,unlinkSelectedTopics: function(){
    
		var linkedTopicsDataView = this.getLinkedTopics();
		
		var selectedItems = linkedTopicsDataView.getSelectionModel().getSelection();

		linkedTopicsDataView.store
				.remove(selectedItems);
		

    }
});