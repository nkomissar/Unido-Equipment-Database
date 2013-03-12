
Ext.define('EetdbAdmin.view.entity.Item', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.entityitem',

    requires: ['Ext.toolbar.Toolbar', ''],

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
        			xtype: 'textfield',
        			name: 'code',
        			fieldLabel: 'Code'
        		},{
        			xtype: 'hidden',
        			name: 'id'
        		}],
        		buttons: [{
        			text: 'Save',
        			action: 'create'
        		}]
        	}]
        	
        });

        this.callParent(arguments);
    }

	,addProperty: function(frm, property) {
		
		var item = null;
		
		switch(property.get('propertyTypeId'))
		{
		case 1:
			
			item = frm.add(Ext.widget('textbox', {
	            columnWidth: 0.5,
	            title: property.get('name'),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: propert.get('value'),
	            name: property.get('code')
	        }));
			
			break;
			
		case 2:
			
			item = frm.add(Ext.widget('textarea', {
	            columnWidth: 0.5,
	            title: property.get('name'),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: propert.get('value'),
	            name: property.get('code')
	        }));
			
			break;
			
		case 3:
			
			item = frm.add(Ext.widget('textbox', {
	            columnWidth: 0.5,
	            title: property.get('name'),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: propert.get('value'),
	            name: property.get('code')
	        }));
			
			break;
			
		case 4:
			
			item = frm.add(Ext.widget('textbox', {
	            columnWidth: 0.5,
	            title: property.get('name'),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: propert.get('value'),
	            name: property.get('code')
	        }));
			
			break;
			
		case 5:
			
			item = frm.add(Ext.widget('checkbox', {
	            columnWidth: 0.5,
	            title: property.get('name'),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: propert.get('value'),
	            name: property.get('code')
	        }));
			
			break;

		}
	
		return item;
	}

	,loadRecord: function(entity) {
		var me = this;
		var form = this.down('form');
		
		form.loadRecord(entity);
		
		var items = form.items;
		
		Ext.each(items, function(item) {
			 if (item.ownerCt) {
				 item.ownerCt.remove(item, true);
             }
		});
		
		
		Ext.each(entity['properties']().data.items, 
				function(property)
				{
			
					me.addProperty(form, property);
				
				}
		);
	}
	
	,getFieldValues: function() {
		
		var form = this.down('form');
		
    	var template = {};
    	
    	var id = form.down('[isFormField][name="id"]');
    	var nm = form.down('[isFormField][name="name"]');
    	var code = form.down('[isFormField][name="code"]');
    	var fieldSets = form.query('fieldset');

    	if(typeof id != 'undefined')
    	{
    		template['id'] = +id.getValue();
    	}

    	if(typeof nm != 'undefined')
    	{
    		template['name'] = nm.getValue();
    	}

    	if(typeof code != 'undefined')
    	{
    		template['code'] = code.getValue();
    	}
    	
    	Ext.each(fieldSets, function(fieldSet)
    	{
    		
    		var val = fieldSet.getFieldValues();
    		
    		if (template.hasOwnProperty('properties')){
    			template['properties'].push(val);
    		} else {
    			template['properties'] = [val];
    		}
    	});
		
		return template;
	}
	
});
