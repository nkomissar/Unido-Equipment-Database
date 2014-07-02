
Ext.define('EetdbAdmin.view.entity.List', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.entitylist',

    requires: ['Ext.toolbar.Toolbar'
               ,'Ext.ux.form.field.SearchField'],

    title: 'Entities',
    border: false,
    layout: 'fit',
	locales : {
		title : 'titles.entities'
    },    

    initComponent: function() {
        Ext.apply(this, {
        	
            items: [{
            	xtype: 'dataview',
            	overflowY: 'auto',
            	autoHeight:true,            	
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
					    ,locales: {
					    	emptyText: 'fields.labels.entersearchterm'
					    }
					    //,value: 'дрыг'
					}]
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
