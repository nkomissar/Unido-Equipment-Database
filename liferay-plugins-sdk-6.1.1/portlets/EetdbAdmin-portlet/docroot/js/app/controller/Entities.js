Ext.define('EetdbAdmin.controller.Entities', {
    extend: 'Ext.app.Controller',

    stores: ['EntitySearchResult'],
    models: ['Entity'],
    views: ['entity.List'],
    
    refs: [
        {ref: 'entityList', selector: 'entitylist'},
        {ref: 'entityData', selector: 'entitylist dataview'},
        {ref: 'searchQuery', selector: 'entitylist dataview textbox'},
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
    
    // At this point things haven't rendered yet since init gets called on controllers before the launch function
    // is executed on the Application
    init: function() {
    	
        this.control({
            'entitylist dataview': {
                selectionchange: this.loadEntity
            },
            'entitylist button[action=search]': {
                click: this.doSearch
            }
        });
    },
    
    onLaunch: function() {
   	
        var dataview = this.getEntityData(),
            store = this.getEntitySearchResultStore();
        
        dataview.bindStore(store);
        //dataview.getSelectionModel().select(store.getAt(0));
    },
    

    loadEntity: function(selModel, selected) {

    },
    
    doSearch: function()
    {
    	var queryBox = this.getSearchQuery(),
    	 store = this.getEntitySearchResultStore();
    	
    	store.load()
    	
    	
    	
    }
});