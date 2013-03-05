Ext.define('EetdbAdmin.view.GroupTabs', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.mygrouptabs',
    
    requires: ['EetdbAdmin.view.entitytemplate.List', 'Ext.ux.GroupTabPanel'],
    
    items: [{
            xtype: 'grouptabpanel',
            activeGroup: 0,
            activeTab: 'searchTemplateTab',
            collapsible: true,
            
            items: [{
                    //id: 'templatesGroup',
                    mainItem: 0,
                    activeTab: 'searchTemplateTab',
                    items: [{
                            title: 'Templates'
                        }, {
                            title: 'Search',
                            activeTab: true,
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

        var tabs = this.down('grouptabpanel treepanel');

        this.on('afterlayout', function() {
            
            var store = tabs.getStore();
            var searchNode = store.getNodeById('searchTemplateTab');
            
            tabs.getSelectionModel().select(searchNode);
            
        });
        
        
        
        this.callParent(arguments);
    }
});
