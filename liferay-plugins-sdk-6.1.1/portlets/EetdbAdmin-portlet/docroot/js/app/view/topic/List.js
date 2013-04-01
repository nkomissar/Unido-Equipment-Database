
Ext.define('EetdbAdmin.view.topic.List', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.topiclist',

    requires: ['Ext.toolbar.Toolbar'],

    title: 'Topics',
    autoScroll: false,
    border: false,

    initComponent: function() {
        Ext.apply(this, {
        	
        	layout: 'fit',
        	
            items: [{
            	xtype: 'dataview',
            	layout: 'fit',
            	trackOver: true,
            	store: this.store,
            	cls: 'topic-list',
            	itemSelector: '.topic-list-item',
            	overItemCls: 'topic-list-item-hover',
            	tpl: '<tpl for="."><div class="topic-list-item">{name}</div></tpl>'

            }]

            ,dockedItems: [{
                xtype: 'toolbar',
                items: [
					'->',
					{
					    xtype: 'searchfield',
					    emptyText: 'enter search term',
					    value: 'cement'
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
