
var myDiv = Ext.get('landingBody');

Ext.define('EetdbAdmin.view.Viewport', {
    extend: 'Ext.container.Container',

    requires: [
        'EetdbAdmin.view.Viewer',
        //'EetdbAdmin.view.feed.List',
        'EetdbAdmin.view.entity.List',
        'Ext.layout.container.Fit'
    ],

    layout: 'fit',
    
    renderTo: myDiv,

    items: [{
        region: 'center',
        xtype: 'viewer'
    }, {
        region: 'west',
        width: 225,
        xtype: 'entitylist'
    }]
});

