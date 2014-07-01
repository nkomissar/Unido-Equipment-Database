Ext.define('EetdbAdmin.view.GroupTabs', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.mygrouptabs',
    
    requires: ['EetdbAdmin.view.entitytemplate.List', 'Ext.ux.GroupTabPanel'],
    
    items: [{
            xtype: 'grouptabpanel',
            activeGroup: 0,
            collapsible: true,
            
            items: [
                {
                    action: 'templatesGroup',
                    mainItem: 0,
                    items: [{
                            title: 'Templates'
            				,locales : {
            					title : 'titles.templates'
                            }

                        }, {
                            title: 'Search',
                            id: 'searchTemplateTab',
                            layout: 'fit',
                            items: [{
                                    xtype: 'entitytemplatelist'
                                }]
	        				,locales : {
	        					title : 'titles.search'
	                        }
                        }, {
                            title: 'Add Template',
                            id: 'addTemplateTab',
                            action: 'addtemplate'
	        				,locales : {
	        					title : 'titles.addtemplate'
	                        }
                        }, {
                            title: 'Remove Template',
                            id: 'removeTemplateTab',
                            action: 'removetemplate'
	        				,locales : {
	        					title : 'titles.removetemplate'
	                        }
                        }]
                }, {
                    expanded: false,
                    items: [{
                            title: 'Entities'
	        				,locales : {
	        					title : 'titles.entities'
	                        }
                        }, {
                            title: 'Search',
                            layout: 'fit',
                            id: 'searchEntityTab',
                            items: [{
                                    xtype: 'entitylist',
                                    entityListInstance: 'mainEntitySearch'
                                }]
	        				,locales : {
	        					title : 'titles.search'
	                        }
                        }, {
                            title: 'Add Entity',
                            id: 'addEntityTab',
                            action: 'addentity'
	        				,locales : {
	        					title : 'titles.addentity'
	                        }
                        }, {
                            title: 'Remove Entity',
                            id: 'removeEntityTab',
                            action: 'removeentity'
	        				,locales : {
	        					title : 'titles.removeentity'
	                        }
                        }]
                }, {
                    expanded: false,
                    items: [{
                            title: 'Topics'
	        				,locales : {
	        					title : 'titles.topics'
	                        }
                        }, {
                            title: 'Search',
                            layout: 'fit',
                            id: 'searchTopicTab',
                            items: [{
                                    xtype: 'topiclist',
                                    topicListInstance: 'mainTopicSearch'
                                }]
	        				,locales : {
	        					title : 'titles.search'
	                        }
                        }, {
                            title: 'Add Topic',
                            id: 'addTopicTab',
                            action: 'addtopic'
	        				,locales : {
	        					title : 'titles.addtopic'
	                        }
                        }, {
                            title: 'Remove Topic',
                            id: 'removeTopicTab',
                            action: 'removetopic'
	        				,locales : {
	        					title : 'titles.removetopic'
	                        }
                        }]
                }, {
                    items: [{
                            title: 'Bulk Upload'
	        				,locales : {
	        					title : 'titles.bulkupload'
	                        }
                        }
                        , {
                            title: 'Queue',
                            layout: 'fit',
                            id: 'uploadQueueTab',
                            items: [{
                                    xtype: 'uploadQueue'
                                }]
		    				,locales : {
		    					title : 'titles.uploadqueue'
		                    }
                        }
                        , {
                            title: 'Upload Catalog',
                            id: 'uploadCatalogTab',
                            action: 'uploadcatalog'
	        				,locales : {
	        					title : 'titles.uploadcatalog'
	                        }
                        }]
                }]
        
        }],
    
    
    initComponent: function() {
        
        var me = this;
        
        me.on('afterlayout', function() {

            me.selectTemplateSearch();
            me.activateTemplateControls(false);
            //me.selectUploadQueue();
            
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

                if (node.get('id') == 'addEntityTab') 
                {
                    me.fireEvent('addentityselected');
                    return false;
                }
                
                if (node.get('id') == 'removeTopicTab') 
                {
                    me.fireEvent('removetopicselected');
                    return false;
                }

                if (node.get('id') == 'addTopicTab') 
                {
                    me.fireEvent('addtopicselected');
                    return false;
                }
                
                if (node.get('id') == 'uploadCatalogTab') 
                {
                    me.fireEvent('uploadcatalogselected');
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
        'removetopicselected', 
        'uploadcatalogselected'
        );
        
        this.callParent(arguments);
    }
    
    ,selectTab: function(nodeId) 
    {
        var tabs = this.down('grouptabpanel treepanel');
        var store = tabs.getStore();
        var searchNode = store.getNodeById(nodeId);
        
        tabs.getSelectionModel().select(searchNode);
    }
    
    ,selectTemplateSearch: function() 
    {
        this.selectTab('searchTemplateTab');
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
        this.selectTab('searchEntityTab');
    }
    
    ,selectTopicSearch: function() 
    {
        this.selectTab('searchTopicTab');
    }
    
    ,selectUploadQueue: function() 
    {
        this.selectTab('uploadQueueTab');
    }

});
