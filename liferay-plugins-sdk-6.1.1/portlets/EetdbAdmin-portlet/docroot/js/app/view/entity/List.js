Ext.define('EetdbAdmin.view.entity.List', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.entitylist',

    requires: ['Ext.toolbar.Toolbar'],

    title: 'Entities',
    //collapsible: true,
    //animCollapse: true,

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
            	tpl: '<tpl for="."><div class="entity-list-item">{name}</div></tpl>',
            	listeners: {
            		selectionchange: this.onSelectionChange,
            		scope: this
            	}
            }]

            /*,dockedItems: [{
                xtype: 'toolbar',
                items: [{
                    iconCls: 'entity-add',
                    text: 'Add Entity',
                    action: 'add'
                }, {
                    iconCls: 'entity-remove',
                    text: 'Remove Entity',
                    disabled: true,
                    action: 'remove'
                }]
            }]*/
        });

        this.callParent(arguments);
    },

    onSelectionChange: function(selmodel, selection) {
        var selected = selection[0],
            button = this.down('button[action=remove]');
        if (selected) {
            button.enable();
        }
        else {
            button.disable();
        }
    }
});
