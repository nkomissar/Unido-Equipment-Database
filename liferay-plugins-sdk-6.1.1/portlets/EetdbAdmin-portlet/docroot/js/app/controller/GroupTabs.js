Ext.define('EetdbAdmin.controller.GroupTabs', {
    extend: 'Ext.app.Controller',
    
    views: ['GroupTabs'],
    
    refs: [
        {ref: 'myGroupTabs',selector: 'mygrouptabs grouptabpanel'}
        , {ref: 'myView',selector: 'mygrouptabs'}
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
                addentityselected: this.addEntity,
                removetopicselected: this.removeTopic,
                addtopicselected: this.addTopic,
                uploadcatalogselected: this.uploadCatalog
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
        //,'mygrouptabs *[action=uploadcatalog]': {
        //	beforeactivate: this.uploadCatalog
        //}
        });
        
        this.application.on(
        {
            templateSelected: function() {
                this.activateTemplateControls(true);
            },
            templateUnselected: function() {
                this.activateTemplateControls(false);
            },
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

        this.getMyView().selectEntitySearch();
       
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

        this.getMyView().selectTopicSearch();

        return false;
    
    }
    
    ,removeTopic: function(groupPanel, newTab, oldTab) 
    {
        
        this.application.fireEvent('removeTopic');
        
        this.getMyView().selectTopicSearch();
        
        return false;
    
    }
    
    ,uploadCatalog: function(groupPanel, newTab, oldTab) 
    {
        
        this.application.fireEvent('uploadCatalog');
        
        this.getMyView().selectUploadQueue();
        
        return false;
    
    }

});
