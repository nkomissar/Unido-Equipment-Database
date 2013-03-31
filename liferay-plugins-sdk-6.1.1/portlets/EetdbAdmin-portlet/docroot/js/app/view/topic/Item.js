
Ext.define('EetdbAdmin.view.topic.Item', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.topicitem',

    requires: ['Ext.toolbar.Toolbar', 'Ext.toolbar.Spacer'],

    cls: 'preview',
    autoScroll: true,
    border: false,
    
    initComponent: function() {
   	
        Ext.apply(this,{
        	
        	items: [{
        		xtype: 'form',
        		bodyPadding: 10,
        		items: [{
        			xtype: 'textfield',
        			name: 'name',
        			fieldLabel: 'Name',
        			anchor: '100%'
        		},{
        			xtype: 'textarea',
        			name: 'description',
        			fieldLabel: 'Description',
        			anchor: '100%'
        		},{
        			xtype: 'hidden',
        			name: 'id'
        		},{
        			xtype: 'hidden',
        			name: 'version'
        		},{
        			xtype:'tabpanel',
                    plain:true,
                    activeTab: 0,
                    //height:235,
                    defaults:{
                        bodyPadding: 10
                    },
                    items:[{
                        title:'Relations',

                        items: [{
                        	xtype: 'dataview',
                        	layout: 'fit',
                        	trackOver: true,
                        	//store: this.store,
                        	cls: 'topic-list',
                        	itemSelector: '.topic-list-item',
                        	overItemCls: 'topic-list-item-hover',
                        	tpl: '<tpl for="."><div class="topic-list-item">{name}</div></tpl>'
                        },
                        {
                        	xtype: 'fieldset',
                        	title: 'Linked Entities',
                        	height: 200,
                        	items:[{
                                   	xtype: 'dataview',
                                   	trackOver: true,
                                   	overflowY: 'scroll',
                                   	anchor: '100%',
                                   	store: 
                                   	{
                                   		model: 'EetdbAdmin.model.Entity'
                                   	},
                                   	cls: 'entity-list',
                                   	itemSelector: '.entity-list-item',
                                   	overItemCls: 'entity-list-item-hover',
                                   	tpl: '<tpl for="."><div class="entity-list-item">{name}</div></tpl>',
                                   	name: 'linkedEntities',
                                   	listeners: {
                                   		selectionchange: function(selModel, selected){
                                   			 
                                   			var btnRemove = this.ownerCt.down('button[action=removechildentity]');
                                   			
                                   			if (selected.length > 0)
                                   			{
                                   				btnRemove.enable();
                                   			}
                                   			else
                                   			{
                                   				btnRemove.disable();
                                   			}
                                   			
                                   		}
                                   	}
                                   },
                                   {
                                	   xtype: 'container',
                                	   anchor: '100%',
                                	   items:[{
											   xtype: 'button',
											   text: 'Add',
											   action: 'addchildentity',
											   margin: '5 5 0 5'
											},{
											   xtype: 'button',
											   text: 'Remove',
											   action: 'removechildentity',
											   margin: '5 5 0 5',
											   disabled: true
											}]
                                   }]
                        }]
                    	
                    }]
        		}
        		],
        		buttons: [{
        			text: 'Save',
        			action: 'create'
        		}]
        	}]
        	
        });

        this.callParent(arguments);
    }

	,loadRecord: function(topic) {

		var form = this.down('form');
		var entitiesDataview = form.down('dataview[cls="entity-list"]');
		var entitiesStore = topic.entitiesOfTopic();
		
		form.loadRecord(topic);

		entitiesDataview.bindStore(entitiesStore);
		
	}
	
	,getFieldValues: function() {
		
		var form = this.down('form');
		
    	var topic = {};
    	
    	var id = form.down('[isFormField][name="id"]');
    	var nm = form.down('[isFormField][name="name"]');
    	var version = form.down('[isFormField][name="version"]');
    	var description = form.down('[isFormField][name="description"]');
		var entitiesDataview = form.down('dataview[cls="entity-list"]');

    	if(typeof id != 'undefined')
    	{
    		topic['id'] = +id.getValue();
    	}

    	if(typeof nm != 'undefined')
    	{
    		topic['name'] = nm.getValue();
    	}

    	if(typeof version != 'undefined')
    	{
    		topic['version'] = version.getValue();
    	}
    	
    	if(typeof description != 'undefined')
    	{
    		topic['description'] = description.getValue();
    	}
    	
    	if(typeof entitiesDataview != 'undefined')
    	{
    		entitiesDataview.getStore().each(function(item){
    			
    			if (topic.hasOwnProperty('entitiesOfTopic')){
    				topic['entitiesOfTopic'].push(item.data);
        		} else {
        			topic['entitiesOfTopic'] = [item.data];
        		}
    			
    		});
    	}
		
		return topic;
	}
	
});
