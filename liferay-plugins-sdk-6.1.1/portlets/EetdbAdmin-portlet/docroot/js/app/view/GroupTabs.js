Ext.define('EetdbAdmin.view.GroupTabs', {
    extend: 'Ext.ux.GroupTabPanel',
    alias: 'widget.mygrouptabs',
    
    requires: ['EetdbAdmin.view.entitytemplate.List', 'Ext.ux.GroupTabPanel'],
    
    activeGroup: 0,
    //activeItem: 1,
    items: [{
    	mainItem: 0,
        //activeItem: 1,
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
    }],


    
    
    
    
    initComponent: function() {
       /* this.items = [{
    		xtype: 'grouptabpanel',
            activeGroup: 0,
            //activeItem: 1,
            items: [{
            	mainItem: 0,
                //activeItem: 1,
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
            		*//*,listeners: {
            			beforeactivate: function(pnl, e, eOpts){
            				
            				console.log('herrr');
            				return false;
            			}
            		}*//*
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
        */
        this.callParent(arguments);
    }
});