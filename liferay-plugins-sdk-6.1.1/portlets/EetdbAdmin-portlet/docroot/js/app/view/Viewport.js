
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
    height: 400,
    
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
                width: 500,
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
                    	},{
                    		title: 'Remove Template',
                    		disabled: true
                    	}]
                    },{
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
                    },{
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

