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
                	/*listeners: {
                		selectionchange: this.onSelectionChange,
                		scope: this
                	}*/
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
        var selected = selection[0]
        	//,button = this.down('button[action=remove]')
        	;
        if (selected) {
            //button.enable();
        }
        else {
            //button.disable();
        }
    }
});
