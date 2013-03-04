Ext.define('EetdbAdmin.controller.GroupTabs', {
    extend: 'Ext.app.Controller',

    views: ['GroupTabs'],
    
    refs: [
        {ref: 'myGroupTabs', selector: 'mygrouptabs grouptabpanel'}
    ],
    
    init: function() {
    	
    	this.control({
            'mygrouptabs *[action=addtemplate]': {
                beforeactivate: this.addTemplate
            }
        });
    	
    },
    
    /*onLaunch: function() {

    	
    	
    },*/
    
    addTemplate: function(a, b, c) 
    {
    	
    	this.application.fireEvent('addTemplate');
    	
    	return false;
    	
    }
    
});