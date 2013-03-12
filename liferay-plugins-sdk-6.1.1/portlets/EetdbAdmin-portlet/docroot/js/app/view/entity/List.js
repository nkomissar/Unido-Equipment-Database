Ext.define("EetdbAdmin.component.SearchField", {
	extend : "Ext.form.field.Trigger",
	alias : "widget.searchfield",

	requires: ['Ext.form.TriggerField'],
	
	enableKeyEvents : true,
	
	trigger1Cls: Ext.baseCSSPrefix + 'form-clear-trigger',
    trigger2Cls: Ext.baseCSSPrefix + 'form-search-trigger',

	listeners : {
		keyup : function(f, e) {
			if (f.hideTrigger) {
				return;
			}
			var key = e.getKey();
			if (key == e.ENTER || (key == e.SPACE && !f.editable)) {
				f.fireEvent("triggerclick", f, e);
			}
		}
	},


	afterRender : function() {
		var me = this, body = me.bodyEl;
		me.callParent();
		me.mon(body, "dblclick", me.onDblClick, me);
	},

	onTrigger1Click : function(e) {
		this.setValue('');
	},

	onTrigger2Click : function(e) {
		var me = this;
		if (!me.hideTrigger) {
			me.fireEvent("triggerclick", me, e);
		}
	},


	onDblClick : function(e) {
		var me = this;
		if (!me.hideTrigger) {
			me.fireEvent("triggerclick", me, e);
		}
	}
});

/*
Ext.override(Ext.form.TriggerField, { 
    initComponent: function(){
        Ext.form.TriggerField.superclass.initComponent.call(this);
        this.addEvents('triggerClick');
    },
    onTrigger2Click: function(){
        this.fireEvent('triggerClick', this);
    }
});*/


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
                items: [
					'->',
					{
					    xtype: 'searchfield',
					    emptyText: 'enter search term',
					    /*,
					    listeners: 
					    	{
					    		onTrigger1Click: this.clearSearchQuery,
					    		onTrigger2Click: this.doSearch,
					    		scope: this
					    	}*/
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
