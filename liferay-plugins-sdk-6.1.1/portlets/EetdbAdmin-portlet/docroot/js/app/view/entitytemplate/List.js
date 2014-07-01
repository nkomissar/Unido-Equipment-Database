Ext.define('EetdbAdmin.view.entitytemplate.List', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.entitytemplatelist',

    title: 'Templates',
    border: false,
    layout: 'fit',
	locales : {
		title : 'titles.templates'
    },

    initComponent: function() {

    	Ext.apply(this, {
        	
            items: [{
                	xtype: 'dataview',
                	trackOver: true,
                	overflowY: 'auto',
                	autoHeight:true,
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
