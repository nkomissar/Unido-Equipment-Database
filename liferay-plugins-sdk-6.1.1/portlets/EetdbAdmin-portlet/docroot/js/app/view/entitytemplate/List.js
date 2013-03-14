Ext.define('EetdbAdmin.view.entitytemplate.List', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.entitytemplatelist',

    requires: ['Ext.toolbar.Toolbar'],

    title: 'Templates',
    autoScroll: true,
    border: false,

    initComponent: function() {
        Ext.apply(this, {
        	
            items: [{
                	xtype: 'dataview',
                	trackOver: true,
                	store: this.store,
                	cls: 'entitytemplate-list',
                	itemSelector: '.entitytemplate-list-item',
                	overItemCls: 'entitytemplate-list-item-hover',
                	tpl: '<tpl for="."><div class="entitytemplate-list-item">{name}</div></tpl>',
                }]

        });

        this.callParent(arguments);
    }
});
