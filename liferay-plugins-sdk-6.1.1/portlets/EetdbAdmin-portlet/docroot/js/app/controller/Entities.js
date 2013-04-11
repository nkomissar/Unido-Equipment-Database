Ext.define('EetdbAdmin.controller.Entities', {
    extend: 'Ext.app.Controller',

    stores: ['EntitySearchResult', 'Entity', 'EntityTemplate'],
    models: ['Entity', 'EntityProperty', 'EntityTemplate', 'EntitySearchResult'],
    views: ['entity.List', 'entity.Item'],
    
    refs: [
        {ref: 'entityList', selector: 'entitylist[entityListInstance=mainEntitySearch]'},
        {ref: 'entityData', selector: 'entitylist[entityListInstance=mainEntitySearch] dataview'},
        {ref: 'searchQuery', selector: 'entitylist[entityListInstance=mainEntitySearch] toolbar searchfield'},
        {ref: 'entityItem', selector: 'entityitem'},
        {ref: 'entityForm', selector: 'entityitem form'},
        {ref: 'linkedEntities', 	selector: 'entityitem form dataview[name=linkedEntities]'},
        {ref: 'entitySearchData', 	selector: 'entitylistwindow[entityListWindowInstance=entitySearchForEntity] dataview'},
        {ref: 'entitySearchQuery', 	selector: 'entitylistwindow[entityListWindowInstance=entitySearchForEntity] toolbar searchfield'},
        {
            ref: 'entityListWindow', 
            selector: 'entitylistwindow[entityListWindowInstance=entitySearchForEntity]', 
            autoCreate: true,
            xtype: 'entitylistwindow',
            entityListWindowInstance: 'entitySearchForEntity'
            	
        }
        
    ],
    
    // At this point things haven't rendered yet since init gets called on controllers before the launch function
    // is executed on the Application
    init: function() {
    	
        this.control({
            'entitylist[entityListInstance=mainEntitySearch] dataview': {
                selectionchange: this.loadEntity
            },
            'entitylist[entityListInstance=mainEntitySearch] toolbar searchfield': {
            	triggerclick: this.doSearch
            }
            ,'entityitem button[action=create]': {
                click: this.submitEntity
            }
            ,'entityitem form combobox': {
                select: this.applyTemplate
            }
            ,'entityitem button[action=addchildentity]': {
                click: this.showAddChildEntity
            }
            ,'entityitem button[action=removechildentity]': {
                click: this.unlinkSelectedEntities
            }
            //should go to subcontroller
            ,'entitylistwindow[entityListWindowInstance=entitySearchForEntity] toolbar searchfield': {
            	triggerclick: this.doChildEntitySearch
            }
            ,'entitylistwindow[entityListWindowInstance=entitySearchForEntity] button[action=add]': {
            	click: this.linkSelectedEntities
            }
        });
        
    	this.application.on( 
    			{
    				addEntity: this.addEntity,
    				removeEntity: this.removeEntity,
    				scope: this
    			});
    },
    
    onLaunch: function() {
   	
        var dataview = this.getEntityData(),
            store = this.getEntitySearchResultStore();
        
        dataview.bindStore(store);
        //dataview.getSelectionModel().select(store.getAt(0));
        
		var entitySearchStore = Ext.create(this.application.getModuleClassName('EntitySearchResult', 'store'));
		var entitySearchView = this.getEntityListWindow();
		var entitySearchDataView = entitySearchView.down('dataview');
 
		entitySearchView.entityListWindowInstance = 'entitySearchForEntity';
		
		entitySearchDataView.bindStore(entitySearchStore);
        
    },

    loadEntity: function(selModel, selected) 
    {
        var store = this.getEntityStore(),
        searchEntity = selected[0],
        itemForm = this.getEntityForm();
	    var eItem = this.getEntityItem();
	    
	    eItem.show();
	    
	    if (typeof searchEntity === 'undefined')
	    {
	    	this.application.fireEvent('entityUnselected');
	    	return;
	    }
	    
	    if (!searchEntity.phantom
	    		&& !searchEntity.dirty) 
	    {
	    	
	    	
	    	itemForm.setLoading({
	            msg: 'Loading entity...'
	        });
	
	    	store.load({
	            params: {
	            	action: 'doEntityLoad',
	                entityId: searchEntity.get('entityId')
	            },
	            callback: function(records, operation, success) {
	            	
	            	itemForm.setLoading(false);
	            	eItem.loadRecord(records[0]);
	            	
	            }
	        });
	    	
	    	return;
	    }
	    
	    var entity = Ext.create('EetdbAdmin.model.Entity', 
	    		{ 
	    			id: searchEntity.get('entityId'),
	    			name: searchEntity.get('entityName'),
	    			description: searchEntity.get('entityDescription')
	    		});
	    
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
    	
    },

    addEntity: function()
    {
    	
    	var searchDataview = this.getEntityData();
        var searchStore = this.getEntitySearchResultStore();
        
        searchStore.insert(0, Ext.create('EetdbAdmin.model.EntitySearchResult', { entityId: 0, entityName: 'New Entity'} ));
        
        searchDataview.getSelectionModel().select(0);

    }
    
    ,removeEntity: function()
    {
    	
    	var searchDataview = this.getEntityData();
        var searchStore = this.getEntitySearchResultStore();
    	var store = this.getEntityStore();

        var recordInSearch = searchDataview.getSelectionModel().getSelection()[0];
    	var record = store.getAt(0);

        if (typeof recordInSearch === 'undefined'
        	|| typeof record === 'undefined'
        	|| recordInSearch.get('entityId') != record.get('id')) 
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
            msg: 'Removing entity...'
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
    
    ,submitEntity: function() {
    	
    	var itemForm = this.getEntityForm();
    	var itemView = this.getEntityItem();
    	var store = this.getEntityStore();
    	var values = itemView.getFieldValues();
    	var templateStore = this.getEntityTemplateStore();

    	var searchDataview = this.getEntityData();
        var recordInSearch = searchDataview.getSelectionModel().getSelection()[0];

        itemForm.setLoading({
            msg: 'Saving entity...'
        });
        
        templateStore.load(
        {
	        params: {
	        	action: 'doEntityTemplateLoad',
	            entityTemplateId: values.entityTemplate['id']
	        },
	        callback: function(records, operation, success) {
	    	
	        	values.entityTemplate = records[0].data;
	        	Ext.apply(values.entityTemplate, records[0].getAssociatedData());
	        	
		    	if (store.count() == 0){
		    		store.add(Ext.create('EetdbAdmin.model.Entity'));
		    	}
		    	
		    	store.loadRawData( { entity: [values] });
		    	
		    	var record = store.getAt(0);
		    	
		    	record.dirty = true;
		    	//always re-read ID from server response
		    	record.phantom = true;
		    	
		    	//record.set(values);
		    	
		    	store.sync({
		    		success: function(){
		    			
		    			var newrec = store.getAt(0);
		    			
		    			var dataInSearch = {
		    					entityId: newrec.get('id'),
		    					entityName: newrec.get('name'),
		    					entityDescription: 'dummy'
		    			};
		    			
		    			recordInSearch.set(dataInSearch);
		    			recordInSearch.commit();
		    			
		    			itemView.loadRecord(newrec);
		    			
		    	    	itemForm.setLoading(false);
		    	    	
		    		}
		    		,failure: function (batch, options){
		    	    	
		    			itemForm.setLoading(false);
		    			
		    			var operation = batch.operations[0];
		    	    	
		                Ext.MessageBox.show({
		                    title: 'EXCEPTION',
		                    msg: operation.getError(),
		                    icon: Ext.MessageBox.ERROR,
		                    buttons: Ext.Msg.OK
		                });
		    		},
		    		scope: this
		    	});
	        }
        });

    }
    
	,applyTemplate: function (combo, records, eOpts)
	{
		
		var me = this;
		var form = me.getEntityForm();

	    var eItem = this.getEntityItem();
		var existingData = eItem.getFieldValues();
		var template = records[0];
		var templateStore = this.getEntityTemplateStore();
		var newEntity = Ext.create('EetdbAdmin.model.Entity', 
									{
										name: existingData["name"]
									});
		var newPropsStore = newEntity.properties();
		
		form.setLoading("Loading template...");
		templateStore.load({
            params: {
                entityTemplateId: template.get('id')
            },
            callback: function(records, operation, success) {
            	
            	form.setLoading(false);
            	
            	var template = records[0];
        		var propertiesStore = template.properties();
        		
        		newEntity['EntityTemplate'] = template;
            	
        		propertiesStore.each(
        				function(templateProperty)
        				{
        					var property = Ext.create('EetdbAdmin.model.EntityProperty', {
        						templateProperty: templateProperty
        					});
        					
        					Ext.each(existingData['properties'],
        							function(existingProperty)
        							{
        								if (existingProperty.templateProperty["code"] == templateProperty.get("code"))
        								{
        									property.set("value", existingProperty["value"]);
        								}
        							});
       					
        					newPropsStore.add(property);
        					
        				});
        		
        		eItem.loadRecord(newEntity);
            	
            }
        });
		
		
	}

    ,showAddChildEntity: function() {
    	this.getEntityListWindow().show();
    }

	,doChildEntitySearch: function()
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