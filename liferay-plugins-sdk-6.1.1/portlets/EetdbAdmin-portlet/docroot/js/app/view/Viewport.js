
var myDiv = Ext.get('landingBody');

Ext.define('EetdbAdmin.view.Viewport', {
    extend: 'Ext.panel.Panel',
    
    requires: [
        'EetdbAdmin.view.Viewer', 
        'EetdbAdmin.view.GroupTabs', 
        'EetdbAdmin.view.entity.List', 
        'EetdbAdmin.view.topic.List', 
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
            	xtype: 'mygrouptabs',
            	//xtype: 'panel',
            	//title: 'Collapsible',
                region: 'west',
                split: true,
                collapsible: true,
                //animCollapse: true,
                //margins: '5 0 5 5',
                width: 500,
            	layout: 'fit'
                }, {
                    
                    region: 'center',
                    xtype: 'viewer'
                
                }]
        
        }]
});

