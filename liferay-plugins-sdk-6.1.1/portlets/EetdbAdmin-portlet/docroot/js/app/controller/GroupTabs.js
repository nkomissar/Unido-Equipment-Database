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
	        	removetemplateselected: this.removeTemplate,
	        	removeentityselected: this.removeEntity,
	        	removetopicselected: this.removeTopic,
	        }
            ,'mygrouptabs *[action=addentity]': {
                beforeactivate: this.addEntity
            }
	        ,'mygrouptabs *[action=removeentity]': {
	        	beforeactivate: this.removeEntity
	        }
            ,'mygrouptabs *[action=addtopic]': {
                beforeactivate: this.addTopic
            }
	        ,'mygrouptabs *[action=removetopic]': {
	        	beforeactivate: this.removeTopic
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
    
    ,addEntity: function(groupPanel, newTab, oldTab) 
    {
    	
    	this.application.fireEvent('addEntity');
    	
    	return false;
    	
    }
    
    ,removeEntity: function(groupPanel, newTab, oldTab) 
    {
    	
    	this.application.fireEvent('removeEntity');
    	
    	this.getMyView().selectEntitySearch();
    	
    	return false;
    	
    }

    ,addTopic: function(groupPanel, newTab, oldTab) 
    {
    	
    	this.application.fireEvent('addTopic');
    	
    	return false;
    	
    }
    
    ,removeTopic: function(groupPanel, newTab, oldTab) 
    {
    	
    	this.application.fireEvent('removeTopic');
    	
    	this.getMyView().selectTopicSearch();
    	
    	return false;
    	
    }

});