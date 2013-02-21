
var myDiv = Ext.get('landingBody');

Ext.define('EetdbAdmin.view.Viewport', {
    extend: 'Ext.panel.Panel',
    
    requires: [
        'EetdbAdmin.view.Viewer', 
        //'EetdbAdmin.view.feed.List',
        'EetdbAdmin.view.entity.List', 
        'EetdbAdmin.view.entitytemplate.List', 
        'Ext.layout.container.Fit', 
        'Ext.layout.container.Border',
        'Ext.ux.GroupTabPanel'
    ],
    
    layout: 'fit',
    height: 300,
    
    renderTo: myDiv,
    
    items: [{
            xtype: 'panel',
            layout: {
            	type: 'border',
            	padding: 5
            },
            defaults: {
                split: true
            },
            items: [{
            	xtype: 'panel',
            	//title: 'Collapsible',
                region: 'west',
                split: true,
                collapsible: true,
                //animCollapse: true,
                //margins: '5 0 5 5',
                width: 300,
            	layout: 'fit',
            	items: [{
            		xtype: 'grouptabpanel',
                    activeGroup: 0,
                    items: [{
                    	mainItem: 0,
                    	items: [{
                    		title: 'Templates'
                    	},{
                    		title: 'Search',
                    		items: [{
                    			xtype: 'entitytemplatelist'
                    		}]
                    	},{
                    		title: 'Add Template'
                    	}]
                    },{
                    	expanded: false,
                    	items: [{
                    		title: 'Entities'
                    	}, {
                    		title: 'Search',
                    		items: [{
                    			xtype: 'entitylist'
                    		}]
                    	}, {
                    		title: 'Add Entity'
                    	}]
                    },{
                    	expanded: false,
                    	items: [{
                    		title: 'Topics'
                    	}, {
                    		title: 'Search'
                    	}, {
                    		title: 'Add Topic'
                    	}]
                    }]
            	}]
                    
                    
                    /*items: [{
                            xtype: 'entitylist'
                        }, {
                            xtype: 'entitytemplatelist'
                        }]*/
                }, {
                    
                    region: 'center',
                    xtype: 'viewer'
                
                }]
        
        }]
});

