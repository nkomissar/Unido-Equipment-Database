
var myDiv = Ext.get('landingBody');

Ext.define('EetdbAdmin.view.Viewport', {
    extend: 'Ext.container.Container',

    requires: [
        'EetdbAdmin.view.Viewer',
        //'EetdbAdmin.view.feed.List',
        'EetdbAdmin.view.entity.List',
        'EetdbAdmin.view.entitytemplate.List',
        'Ext.layout.container.Fit'
    ],

    layout: 'fit',
    
    renderTo: myDiv,

    items: [{
        region: 'center',
        xtype: 'viewer'
    }, {
    	xtype: 'panel',
        region: 'west',
        title: 'Entities & Templates',
        collapsible: true,
        animCollapse: true,
        split: true,
        margins: '5 0 5 5',
        layout: {
        	type: 'accordion',
        	animate: true
        },
        items: [{
            xtype: 'entitylist'
        }, {
        	xtype: 'entitytemplatelist'
        }]
    }]
});

