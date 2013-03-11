Ext.define('EetdbAdmin.view.entity.List', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.entitylist',

    requires: ['Ext.toolbar.Toolbar'],

    title: 'Entities',
    autoScroll: true,
    border: false,

    initComponent: function() {
        Ext.apply(this, {
        	
        	layout: 'fit',
        	
            items: [{
            	xtype: 'dataview',
            	layout: 'fit',
            	trackOver: true,
            	store: this.store,
            	cls: 'entity-list',
            	itemSelector: '.entity-list-item',
            	overItemCls: 'entity-list-item-hover',
            	tpl: '<tpl for="."><div class="entity-list-item">{name}</div></tpl>'
            	/*,listeners: {
            		selectionchange: this.onSelectionChange,
            		scope: this
            	}*/
            }]

            ,dockedItems: [{
                xtype: 'toolbar',
                items: [{
                	xtype: 'textfield',
                    text: 'Add Entity',
                    emptyText: 'enter search term'
                }, {
                    text: 'Search',
                    action: 'search'
                }]
            }]
        });

        this.callParent(arguments);
    }

});
