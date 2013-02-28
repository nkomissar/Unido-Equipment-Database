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
        //{ref: 'feedShow', selector: 'feedshow'},
        //{ref: 'feedForm', selector: 'feedwindow form'},
        //{ref: 'feedCombo', selector: 'feedwindow combobox'},
        //{ref: 'articleGrid', selector: 'articlegrid'},
        {
            ref: 'feedWindow', 
            selector: 'feedwindow', 
            autoCreate: true,
            xtype: 'feedwindow'
        }
    ],
    
    init: function() {
    	
    	this.control({
            'entitytemplatelist dataview': {
                selectionchange: this.loadEntityTemplate
            }/*,
            'feedlist button[action=add]': {
                click: this.addFeed
            },
            'feedlist button[action=remove]': {
                click: this.removeFeed
            }*/
            ,'entitytemplateitem button[action=create]': {
                click: this.submitEntityTemplate
            }
        });
    },
    
    onLaunch: function() {
    	
        var searchDataview = this.getEntityTemplateData();
        var searchStore = this.getEntityTemplateSearchResultStore();
        
        searchDataview.bindStore(searchStore);
        searchDataview.getSelectionModel().select(searchStore.getAt(0));
    },
    
    /**
     * Loads the given template into the viewer
     */
    loadEntityTemplate: function(selModel, selected) {
    	
        var store = this.getEntityTemplateStore(),
            entityTemplate = selected[0];
        
        var etItem = this.getEntityTemplateItem();
        
        if (entityTemplate) {
        	
            store.load({
                params: {
                	action: 'doEntityTemplateLoad',
                    entityTemplateId: entityTemplate.get('id')
                },
                callback: function(records, operation, success) {
                	
                	etItem.loadRecord(records[0]);
                	
                }
            });
            
        }
    },
    
    /**
     * Shows the add feed dialog window
     */
    addFeed: function() {
        this.getFeedWindow().show();
    },
    
    /**
     * Removes the given feed from the Feeds store
     * @param {FV.model.Feed} feed The feed to remove
     */
    removeFeed: function() {
        this.getFeedsStore().remove(this.getFeedData().getSelectionModel().getSelection()[0]);
    }
    
    ,submitEntityTemplate: function() {
    	
    	var itemForm = this.getEntityTemplateForm();
    	var itemView = this.getEntityTemplateItem();
    	var store = this.getEntityTemplateStore();
    	var values = itemView.getFieldValues();
    	
    	debugger;
    	
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