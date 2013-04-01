Ext.define('EetdbAdmin.view.GroupTabs', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.mygrouptabs',
    
    requires: ['EetdbAdmin.view.entitytemplate.List', 'Ext.ux.GroupTabPanel'],
    
    items: [{
            xtype: 'grouptabpanel',
            activeGroup: 0,
            collapsible: true,
            
            items: [{
                    action: 'templatesGroup',
                    mainItem: 0,
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
                            id: 'addTemplateTab',
                            action: 'addtemplate'
                        }, {
                            title: 'Remove Template',
                            id: 'removeTemplateTab',
                            action: 'removetemplate'
                        }]
                }, {
                    expanded: false,
                    items: [{
                            title: 'Entities'
                        }, {
                            title: 'Search',
                            items: [{
                                    xtype: 'entitylist',
                                    layout: 'fit',
                                    entityListInstance: 'mainEntitySearch'
                                }]
                        }, {
                            title: 'Add Entity',
                            	id: 'addEntityTab',
                                action: 'addentity'
                        }, {
                            title: 'Remove Entity',
                            id: 'removeEntityTab',
                            action: 'removeentity'
                        }]
                }, {
                    expanded: false,
                    items: [{
                            title: 'Topics'
	                    }, {
	                        title: 'Search',
	                        items: [{
	                                xtype: 'topiclist',
	                                layout: 'fit',
                                    topicListInstance: 'mainTopicSearch'
	                            }]
	                    }, {
	                        title: 'Add Topic',
	                        	id: 'addTopicTab',
	                            action: 'addtopic'
	                    }, {
	                        title: 'Remove Topic',
	                        id: 'removeTopicTab',
	                        action: 'removetopic'
	                    }]
                }]
        
        }],
    
    
    initComponent: function() {
    	
    	var me = this;
    	
    	me.on('afterlayout', function() {
        	
    		me.selectTemplateSearch();
    		me.activateTemplateControls(false);

    		var tabs = me.down('grouptabpanel treepanel');
            tabs.on('select', 
            	function(selModel, node, idx) 
            	{
            	
	            	if (!node.data.leaf)
	            	{
	            		
	            		tabs.getSelectionModel().select(node.firstChild);
	            		
	            		return false;
	            		
	            	}
	            	
	            	return true;
            	
            	});
            
            tabs.on('beforeselect', 
                	function(selModel, node, idx) 
                	{
                	
    	            	if (node.get('id') == 'removeTemplateTab')
    	            	{
    	            		me.fireEvent('removetemplateselected');
    	            		return false;
    	            	}

    	            	if (node.get('id') == 'removeEntityTab')
    	            	{
    	            		me.fireEvent('removeentityselected');
    	            		return false;
    	            	}

    	            	if (node.get('id') == 'removeTopicTab')
    	            	{
    	            		me.fireEvent('removetopicselected');
    	            		return false;
    	            	}
    	            	
    	            	return true;
                	
                	});
                            
                        
        });
        
        me.addEvents(
                /**
                 * @event removetemplateselected
                 * Fires when 'Remove Template' tab selected.
                 */
                'removetemplateselected',
                'removeentityselected',
                'removetopicselected'
        		);
        
        this.callParent(arguments);
    }

	,selectTemplateSearch: function()
	{
    	var tabs = this.down('grouptabpanel treepanel');
        var store = tabs.getStore();
        var searchNode = store.getNodeById('searchTemplateTab');
                    
        tabs.getSelectionModel().select(searchNode);
	}
	
	,activateTemplateControls: function(activate)
	{
    	var tabs = this.down('grouptabpanel treepanel');
        var store = tabs.getStore();
        var addNode = store.getNodeById('addTemplateTab');
        var removeNode = store.getNodeById('removeTemplateTab');
        
        addNode.enabled = activate;
        removeNode.enadled = activate;
	}
	
	,selectEntitySearch: function()
	{
    	var tabs = this.down('grouptabpanel treepanel');
        var store = tabs.getStore();
        var searchNode = store.getNodeById('searchEntityTab');
                    
        tabs.getSelectionModel().select(searchNode);
	}

	,selectTopicSearch: function()
	{
    	var tabs = this.down('grouptabpanel treepanel');
        var store = tabs.getStore();
        var searchNode = store.getNodeById('searchTopicTab');
                    
        tabs.getSelectionModel().select(searchNode);
	}
	
});
