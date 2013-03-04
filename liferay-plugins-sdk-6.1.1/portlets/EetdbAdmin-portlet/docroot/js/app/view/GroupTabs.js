Ext.define('EetdbAdmin.view.GroupTabs', {
    extend: 'Ext.tab.Panel',
    alias: 'widget.mygrouptabs',
    
    requires: ['EetdbAdmin.view.entitytemplate.List'],
    
    initComponent: function() {
        this.items = [{
    		xtype: 'grouptabpanel',
            activeGroup: 0,
            items: [{
            	mainItem: 0,
            	items: [{
            		title: 'Templates'
            	},{
            		title: 'Search',
            		items: [{
            			xtype: 'entitytemplatelist'
            		}]
            	},{
            		title: 'Add Template',
            		action: 'addtemplate'
            		/*,listeners: {
            			beforeactivate: function(pnl, e, eOpts){
            				
            				console.log('herrr');
            				return false;
            			}
            		}*/
            	},{
            		title: 'Remove Template',
            		disabled: true
            	}]
            },{
            	expanded: false,
            	items: [{
            		title: 'Entities'
            	}, {
            		title: 'Search',
            		items: [{
            			xtype: 'entitylist',
            			layout: 'fit'
            		}]
            	}, {
            		title: 'Add Entity'
            	}, {
            		title: 'Remove Entity'
            	}]
            },{
            	expanded: false,
            	items: [{
            		title: 'Topics'
            	}, {
            		title: 'Search'
            	}, {
            		title: 'Add Topic'
            	}, {
            		title: 'Remove Topic'
            	}]
            }]
    	}];
        
        this.callParent(arguments);
    }
});