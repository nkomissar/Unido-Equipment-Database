
Ext.define('EetdbAdmin.view.topic.Item', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.topicitem',

    requires: ['Ext.toolbar.Toolbar'],

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
        			fieldLabel: 'Name'
        		},{
        			xtype: 'textarea',
        			name: 'description',
        			fieldLabel: 'Description'
        		},{
        			xtype: 'hidden',
        			name: 'id'
        		},{
        			xtype: 'hidden',
        			name: 'version'
        		}],
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
		
		form.loadRecord(topic);

	}
	
	,getFieldValues: function() {
		
		var form = this.down('form');
		
    	var topic = {};
    	
    	var id = form.down('[isFormField][name="id"]');
    	var nm = form.down('[isFormField][name="name"]');
    	var version = form.down('[isFormField][name="version"]');
    	var description = form.down('[isFormField][name="description"]');

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
		
		return topic;
	}
	
});
