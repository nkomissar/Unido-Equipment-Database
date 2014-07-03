Ext.define('EetdbAdmin.view.catalogUpload.UploadQueue', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.uploadQueue',

    title: 'Upload Queue',
	locales:{
		title: 'titles.uploadqueue'
	},
	border: false,
    layout: 'fit',

    initComponent: function() {
    	
    	
    	
        /*Ext.apply(this, {
        	
            items: [{
                	xtype: 'panel',
                	trackOver: true,
                	overflowY: 'auto',
                	autoHeight:true,
                	html: 'Disable me'
                }]

        });*/
    	
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
                	tpl: '<tpl for="."><div class="entitytemplate-list-item">{fileName}</div></tpl>',
                }]

        });


        this.callParent(arguments);
        
    }
});