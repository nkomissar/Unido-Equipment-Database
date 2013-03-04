Ext.define('EetdbAdmin.view.GroupTabs', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.mygrouptabs',
    
    requires: ['EetdbAdmin.view.entitytemplate.List', 'Ext.ux.GroupTabPanel'],
    
    items: [{
            xtype: 'grouptabpanel',
            activeGroup: 0,
            activeItem: 1,
            activeTab: 1,
            collapsible: true,
            
            items: [{
                    mainItem: 0,
                    activeItem: 1,
                    activeTab: 1,
                    items: [{
                            title: 'Templates'
                        }, {
                            title: 'Search',
                            id: 'searchTemplateTab',
                            items: [{
                                    xtype: 'entitytemplatelist'
                                }]
                        }, {
                            title: 'Add Template',
                            action: 'addtemplate'
                        }, {
                            title: 'Remove Template',
                            disabled: true
                        }]
                }, {
                    expanded: false,
                    items: [{
                            title: 'Entities'
                        }, {
                            title: 'Search',
                            items: [{
                                    xtype: 'entitylist',
                                    layout: 'fit'
                                }]
                        }, {
                            title: 'Add Entity'
                        }, {
                            title: 'Remove Entity'
                        }]
                }, {
                    expanded: false,
                    items: [{
                            title: 'Topics'
                        }, {
                            title: 'Search'
                        }, {
                            title: 'Add Topic'
                        }, {
                            title: 'Remove Topic'
                        }]
                }],
        
        
        
        }],
    
    
    initComponent: function() {
    	      
    	      this.on('afterlayout', function(){
    	    	  var tab = Ext.getCmp('searchTemplateTab');
    	    	  var tabGroup = tab.ownerCt;
    	    	  var groupingPanel = tabGroup.ownerCt;

    	    	  groupingPanel.setActiveGroup(tabGroup);
    	    	  groupingPanel.setActiveTab(tab);
    	    });
    	      
    	     this.callParent(arguments);
    }
});
