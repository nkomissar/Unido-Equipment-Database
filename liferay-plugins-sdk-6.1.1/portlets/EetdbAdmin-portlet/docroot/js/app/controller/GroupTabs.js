Ext.define('EetdbAdmin.controller.GroupTabs', {
    extend: 'Ext.app.Controller',

    views: ['GroupTabs'],
    
    refs: [
        {ref: 'myGroupTabs', selector: 'mygrouptabs grouptabpanel'}
        ,{ref: 'myView', selector: 'mygrouptabs'}
    ],
    
    init: function() {
    	
    	this.control({
            'mygrouptabs *[action=addtemplate]': {
                beforeactivate: this.addTemplate
            }
	        ,'mygrouptabs *[action=removetemplate]': {
	        	beforeactivate: this.removeTemplate
	        }
	        ,'*': {
	        	removetemplateselected: this.removeTemplate
	        }
        });
    	
    	this.application.on(
    			{
    				templateSelected: function() { this.activateTemplateControls(true); },
    				templateUnselected: function() { this.activateTemplateControls(false); },
    				scope: this
    			});
    	
    },
    
    /*listeners: {
    	removetemplateselect: this.removeTemplate
    },*/
    /*onLaunch: function() {

    	
    	
    },*/
    
    addTemplate: function(groupPanel, newTab, oldTab) 
    {
    	
    	this.application.fireEvent('addTemplate');
    	
    	return false;
    	
    }
    
    ,removeTemplate: function(groupPanel, newTab, oldTab) 
    {
    	
    	this.application.fireEvent('removeTemplate');
    	
    	this.getMyView().selectTemplateSearch();
    	
    	return false;
    	
    }
    
    ,activateTemplateControls: function(activate)
    {
    	
    	this.getMyView().activateTemplateControls(activate);
    	
    }
});