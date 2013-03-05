Ext.define('EetdbAdmin.controller.EntityTemplates', {
    extend: 'Ext.app.Controller',

    stores: ['EntityTemplateSearchResult', 'EntityTemplate'],
    models: ['EntityTemplate', 'EntityTemplateProperty'],
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
            ,'entitytemplatelist panel[action=addtemplate]': {
                beforeactivate: this.addTemplate
            }
        });
    	
    	this.application.on(
    			{
    				addTemplate: this.addTemplate,
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
        
        if (typeof entityTemplate === 'undefined')
        {
        	return;
        }
        
        if (entityTemplate.get('id') > 0
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
        
        
    },
    
    addTemplate: function()
    {
    	
    	var searchDataview = this.getEntityTemplateData();
        var searchStore = this.getEntityTemplateSearchResultStore();
        
        var record = searchStore.insert(0, Ext.create('EetdbAdmin.model.EntityTemplate', { name: 'New Template'} ));
        
        searchDataview.getSelectionModel().select(0);

    }
    
    ,submitEntityTemplate: function() {
    	
    	var itemForm = this.getEntityTemplateForm();
    	var itemView = this.getEntityTemplateItem();
    	var store = this.getEntityTemplateStore();
    	var values = itemView.getFieldValues();
    	
    	if (store.count() == 0){
    		store.add(Ext.create('EetdbAdmin.model.EntityTemplate'));
    	}
    	
    	var record = store.getAt(0);
    	
    	record.set(values);

    	itemForm.setLoading({
            msg: 'Saving template...'
        });
    	
    	store.sync({
    		success: function(){
    	    	itemForm.setLoading(false);
    		}
    		,failure: function (){
    	    	itemForm.setLoading(false);
    		},
    		scope: this
    	});
    	
    }
});