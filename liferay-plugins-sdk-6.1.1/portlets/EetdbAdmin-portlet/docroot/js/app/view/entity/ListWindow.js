Ext.define('EetdbAdmin.view.entity.ListWindow', {
    extend: 'Ext.window.Window',

    alias: 'widget.entitylistwindow',

    requires: ['Ext.form.Panel', 'EetdbAdmin.view.entity.List' ],
    
    //defaultFocus: '#feed',

    width: 500,
    title: 'Select Entities',
    //iconCls: 'feed-add',
    layout: 'fit',
    modal: true,
    plain: true,

    initComponent: function() {
        Ext.apply(this, {
            buttons: [{
                text: 'Add feed',
                action: 'create'
            }, {
                text: 'Cancel',
                scope: this,
                handler: this.close
            }],

            items: [{
                xtype: 'entitylist',
                bodyPadding: '12 10 10',
                border: false,
            }]
        });

        this.callParent(arguments);
    }
});
