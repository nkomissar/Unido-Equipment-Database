Ext.define('EetdbAdmin.controller.EntityTemplates', {
    extend: 'Ext.app.Controller',

    stores: ['EntityTemplateSearchResult', 'EntityTemplate', 'ValueType'],
    models: ['EntityTemplate', 'EntityTemplateProperty'/*, 'ValueType'*/],
    views: ['entitytemplate.List', 'entitytemplate.Item'],
    
    refs: [
        {ref: 'entityTemplateList', selector: 'entitytemplatelist'},
        {ref: 'entityTemplateData', selector: 'entitytemplatelist dataview'},
        {ref: 'entityTemplateItem', selector: 'entitytemplateitem'},
        {ref: 'entityTemplateForm', selector: 'entitytemplateitem form'},
    ],
    
    init: function() {
    	
    	this.control({
            'entitytemplatelist dataview': {
                selectionchange: this.loadEntityTemplate
            }
            ,'entitytemplateitem button[action=create]': {
                click: this.submitEntityTemplate
            }

        });
    	
    	this.application.on(
    			{
    				addTemplate: this.addTemplate,
    				removeTemplate: this.removeTemplate,
    				scope: this
    			});
       
    	
    },
    
    onLaunch: function() {

    	var searchDataview = this.getEntityTemplateData();
        var searchStore = this.getEntityTemplateSearchResultStore();
        
        searchDataview.bindStore(searchStore);
        //debugger;
        //searchDataview.getSelectionModel().select(0);
    },
    
    /**
     * Loads the given template into the viewer
     */
    loadEntityTemplate: function(selModel, selected) {
    	
   	
        var store = this.getEntityTemplateStore(),
            entityTemplate = selected[0],
            itemForm = this.getEntityTemplateForm();
        
        var etItem = this.getEntityTemplateItem();
        
        etItem.show();
        
        if (typeof entityTemplate === 'undefined')
        {
        	this.application.fireEvent('templateUnselected');
        	return;
        }
        
        if (!entityTemplate.phantom
        		&& !entityTemplate.dirty) 
        {
        	
        	
        	itemForm.setLoading({
                msg: 'Loading template...'
            });

        	store.load({
                params: {
                	action: 'doEntityTemplateLoad',
                    entityTemplateId: entityTemplate.get('id')
                },
                callback: function(records, operation, success) {
                	
                	itemForm.setLoading(false);
                	etItem.loadRecord(records[0]);
                	
                }
            });
        	
        	return;
        } 
        
        etItem.loadRecord(entityTemplate);
        store.loadRecords([entityTemplate]);
    	this.application.fireEvent('templateSelected');
        
        
    },
    
    addTemplate: function()
    {
    	
    	var searchDataview = this.getEntityTemplateData();
        var searchStore = this.getEntityTemplateSearchResultStore();
        
        searchStore.insert(0, Ext.create('EetdbAdmin.model.EntityTemplate', { id: 0, name: 'New Template'} ));
        
        searchDataview.getSelectionModel().select(0);

    }
    
    ,removeTemplate: function()
    {
    	
    	var searchDataview = this.getEntityTemplateData();
        var searchStore = this.getEntityTemplateSearchResultStore();
    	var store = this.getEntityTemplateStore();

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
            msg: 'Removing template...'
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
    
    ,submitEntityTemplate: function() {
    	
    	var itemForm = this.getEntityTemplateForm();
    	var itemView = this.getEntityTemplateItem();
    	var store = this.getEntityTemplateStore();
    	var values = itemView.getFieldValues();

    	var searchDataview = this.getEntityTemplateData();
        var recordInSearch = searchDataview.getSelectionModel().getSelection()[0];

    	
    	
    	if (store.count() == 0){
    		store.add(Ext.create('EetdbAdmin.model.EntityTemplate'));
    	}
    	
    	store.loadRawData( { template: [values] });
    	
    	var record = store.getAt(0);
    	
    	record.dirty = true;
    	//always re-read ID from server response
    	record.phantom = true;

    	itemForm.setLoading({
            msg: 'Saving template...'
        });
    	
    	store.sync({
    		success: function(){
    			
    			var newrec = store.getAt(0);
    			
    			recordInSearch.set(newrec.data);
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