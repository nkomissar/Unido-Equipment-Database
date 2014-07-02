Ext.define('EetdbAdmin.view.topic.ListWindow', {
    extend: 'Ext.window.Window',

    alias: 'widget.topiclistwindow',

    requires: ['Ext.form.Panel', 'EetdbAdmin.view.topic.List' ],
    
    //defaultFocus: '#feed',

    width: 400,
    height: 400,
    title: 'Select Topics',
    locales: {
    	title: 'titles.selecttopics'
    },    
    //iconCls: 'feed-add',
    layout: 'fit',
    modal: true,
    plain: true,

    initComponent: function() {
        Ext.apply(this, {
        	
        	closeAction: 'hide',
            
        	buttons: [{
                text: 'OK',
                locales: {
                	text: 'buttons.ok'
                },                 
                action: 'add',
                disabled: true
            }, {
                text: 'Cancel',
                locales: {
                	text: 'buttons.cancel'
                },                 
                scope: this,
                handler: this.close
            }],

            items: [{
                xtype: 'topiclist',
                //bodyPadding: '12 10 10 10',
                border: false,
                topicListInstance: 'modalTopicSearch',
                listeners: {
                	selectionchange: {
                		fn: function(selModel, selected, eOpts){
                			
                			var btnOk = this.down('button[action=add]');
                			
                			if (selected.length > 0)
                			{
                				btnOk.enable();
                			}
                			else
                			{
                				btnOk.disable();
                			}
                		}
            			,scope: this
                	}
                }
            }]
        });

        this.callParent(arguments);
    }
});
