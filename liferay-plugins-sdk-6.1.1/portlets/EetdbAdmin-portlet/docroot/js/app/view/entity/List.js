
Ext.define('EetdbAdmin.view.entity.List', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.entitylist',

    requires: ['Ext.toolbar.Toolbar'],

    title: 'Entities',
    autoScroll: false,
    border: false,

    initComponent: function() {
        Ext.apply(this, {
        	
        	layout: 'fit',
        	
            items: [{
            	xtype: 'dataview',
            	overflowY: 'auto',
            	layout: 'fit',
            	trackOver: true,
            	store: this.store,
            	cls: 'entity-list',
            	itemSelector: '.entity-list-item',
            	overItemCls: 'entity-list-item-hover',
            	tpl: '<tpl for="."><div class="entity-list-item">{entityName}</div></tpl>',
            	listeners: {
            		selectionchange: {
            			fn: function(selModel, selected, eOpts){
            				var me = this;
            				
            				me.fireEvent('selectionchange', selModel, selected);
            			}
            			,scope: this
            		}
            	}
            }]

            ,dockedItems: [{
                xtype: 'toolbar',
                items: [
					'->',
					{
					    xtype: 'searchfield',
					    emptyText: 'enter search term'
					}
					]
            }]
        });

        this.callParent(arguments);
    }

	,doSearch: function(e) {
		var me = this;
		if (!me.hideTrigger) {
			me.fireEvent("dosearch", me, e);
		}
	}
	
	,clearSearchQuery: function(e) {
		var me = this;
		if (!me.hideTrigger) {
			me.fireEvent("dosearch", me, e);
		}
	}
	
});
