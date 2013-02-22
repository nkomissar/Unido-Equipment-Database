Ext.define('EetdbAdmin.controller.EntityTemplates', {
    extend: 'Ext.app.Controller',

    stores: ['EntityTemplates'],
    models: ['EntityTemplate'],
    views: ['entitytemplate.List', 'entitytemplate.Preview'],
    
    refs: [
        {ref: 'entityTemplateList', selector: 'entitytemplatelist'},
        {ref: 'entityTemplateData', selector: 'entitytemplatelist dataview'},
        {ref: 'entityTemplatePreview', selector: 'entitytemplatepreview'},
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
            'entitytemplatelist dataview': {
                selectionchange: this.loadEntityTemplate
            }/*,
            'feedlist button[action=add]': {
                click: this.addFeed
            },
            'feedlist button[action=remove]': {
                click: this.removeFeed
            },
            'feedwindow button[action=create]': {
                click: this.createFeed
            }*/
        });
    },
    
    onLaunch: function() {
    	
    	debugger;
    	
        var dataview = this.getEntityTemplateData();
        var store = this.getEntityTemplatesStore();
        
        dataview.bindStore(store);
        dataview.getSelectionModel().select(store.getAt(0));
    },
    
    /**
     * Loads the given feed into the viewer
     * @param {FV.model.feed} feed The feed to load
     */
    loadEntityTemplate: function(selModel, selected) {
    	
    	debugger;
    	
        var /*grid = this.getArticleGrid(),*/
            store = this.getEntityTemplatesStore(),
            entityTemplate = selected[0];

        if (entityTemplate) {
            this.getEntityTemplatePreview().setTitle(entityTemplate.get('name'));
            //grid.enable();
            store.load({
                params: {
                    entityTemplateId: entityTemplate.get('id')
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
    },
    
    /**
     * @private
     * Creates a new feed in the store based on a given url. First validates that the feed is well formed
     * using FV.lib.FeedValidator.
     * @param {String} name The name of the Feed to create
     * @param {String} url The url of the Feed to create
     */
    createFeed: function() {
        var win   = this.getFeedWindow(),
            form  = this.getFeedForm(),
            combo = this.getFeedCombo(),
            store = this.getFeedsStore(),
            feed  = this.getFeedModel().create({
                name: combo.getDisplayValue(),
                url: combo.getValue()
            });

        form.setLoading({
            msg: 'Validating feed...'
        });
        
        FV.lib.FeedValidator.validate(feed, {
            success: function() {
                store.add(feed);
                form.setLoading(false);
                win.hide();
            },
            failure: function() {
                form.setLoading(false);
                form.down('[name=feed]').markInvalid('The URL specified is not a valid RSS2 feed.');
            }
        });
    }
});