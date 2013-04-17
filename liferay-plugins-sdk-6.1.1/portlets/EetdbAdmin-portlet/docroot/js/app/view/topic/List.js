
Ext.define('EetdbAdmin.view.topic.List', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.topiclist',

    requires: ['Ext.toolbar.Toolbar'],

    title: 'Topics',
    border: false,
    layout: 'fit',

    initComponent: function() {
        Ext.apply(this, {

        	items: [{
            	xtype: 'dataview',
            	trackOver: true,
            	store: this.store,
            	overflowY: 'auto',
            	cls: 'topic-list',
            	itemSelector: '.topic-list-item',
            	overItemCls: 'topic-list-item-hover',
            	tpl: '<tpl for="."><div class="topic-list-item">{name}</div></tpl>',
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
