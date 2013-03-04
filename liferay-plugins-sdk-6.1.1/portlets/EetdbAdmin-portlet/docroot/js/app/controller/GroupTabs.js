Ext.define('EetdbAdmin.controller.GroupTabs', {
    extend: 'Ext.app.Controller',

    views: ['GroupTabs'],
    
    refs: [
        {ref: 'myGroupTabs', selector: 'mygrouptabs'}
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
            ,'mygrouptabs *[action=addtemplate]': {
                beforeactivate: this.addTemplate
            }
        });
    	
    },
    
    onLaunch: function() {

    	debugger;
    },
    
    addTemplate: function(a, b, c) 
    {
    	
    	this.application.fireEvent('addTemplate');
    	
    	return false;
    	
    }
    
});