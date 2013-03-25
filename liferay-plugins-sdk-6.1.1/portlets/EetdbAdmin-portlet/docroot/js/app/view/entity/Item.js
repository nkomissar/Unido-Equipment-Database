
Ext.define('Ext.form.EntityPropertyFieldSet', {
    extend: 'Ext.form.FieldSet',
    
    uses: ['Ext.panel.Tool'],
    
    alias: 'widget.entitypropertyfieldset',
    items:[{
    	xtype: 'hidden',
    	name: 'id'
    },{
    	xtype: 'hidden',
    	name: 'version'
    },{
    	xtype: 'hidden',
    	name: 'templateProperty'
    }],
    
    initComponent: function () {
        var me = this;
        me.callParent(arguments);
        
    },
    
    loadRecord: function (record) {
    	var me = this;
    	
    	me.name = record.TemplateProperty.get('code');
    	
    	me.record = record;
    	
    	var id = me.down('[isFormField][name="id"]');
    	var version = me.down('[isFormField][name="version"]');
    	var tp = me.down('[isFormField][name="templateProperty"]');
    	
    	if(typeof id != 'undefined')
    	{
    		id.setValue(record.get('id'));
    	}

    	if(typeof version != 'undefined')
    	{
    		version.setValue(record.get('version'));
    	}

    	if(typeof tp != 'undefined')
    	{
    		tp.setValue(record.GetTemplateProperty().get('id'));
    	}

		switch(record.TemplateProperty.ValueType.get("type"))
		{
		case "NUMBER":
			
			me.add(Ext.widget('textfield', {
				name: 'value',
	            columnWidth: 0.5,
	            fieldLabel: record.TemplateProperty.get('name'),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: record.get('value')
	        }));
			
			break;
			
		case "TEXT":
			
			me.add(Ext.widget('textarea', {
				name: 'value',
	            columnWidth: 0.5,
	            fieldLabel: record.TemplateProperty.get('name'),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: record.get('value')
	        }));
			
			break;
			
		case "STRING":
			
			me.add(Ext.widget('textfield', {
				name: 'value',
	            columnWidth: 0.5,
	            fieldLabel: record.TemplateProperty.get('name'),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: record.get('value')
	        }));
			
			break;
			
		case "INTEGER":
			
			me.add(Ext.widget('textfield', {
				name: 'value',
	            columnWidth: 0.5,
	            fieldLabel: record.TemplateProperty.get('name'),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: record.get('value')
	        }));
			
			break;
			
		case "BOOLEAN":
			
			me.add(Ext.widget('checkbox', {
				name: 'value',
				columnWidth: 0.5,
	            fieldLabel: record.TemplateProperty.get('name'),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: record.get('value')
	        }));
			
			break;

		}

    	
    }
    , getFieldValues: function(){
    	var me = this;
    	
    	var value = me.down('[isFormField][name="value"]');

    	if(typeof value != 'undefined')
    	{
    		me.record.set('value', value.getValue());
    	}
   	
    	var retValue = me.record.data;
    	retValue['templateProperty'] = me.record.getAssociatedData().templateProperty;
    	
    	return retValue;

    }
});    	

Ext.define('EetdbAdmin.view.entity.Item', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.entityitem',

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
        	        xtype: 'combobox',
        	        name : 'entityTemplate',
        	        fieldLabel: 'Template',
        	        displayField: 'name',
        	        queryMode: 'local',
        	        valueField: 'id',
        	        store: 'EntityTemplateSearchResult',
        	        //editable: false,
        	        /*listeners: {
        	            scope: this,
        	            'select': applyTemplate
        	       }*/
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
		
		var fieldSet = frm.add(Ext.widget('entitypropertyfieldset', {
            columnWidth: 0.5,
            collapsed: false,
            defaults: { anchor: '100%' },
            layout: 'anchor'
        }));
		
		fieldSet.loadRecord(property);
		
	}

	,loadRecord: function(entity) {
		var me = this;
		var form = this.down('form');
		
		form.loadRecord(entity);
		
    	var entityTemplateCombo = form.down('[isFormField][name="entityTemplate"]');
    	entityTemplateCombo.setValue(entity.GetEntityTemplate().get('id'));
		
		var items = form.query('entitypropertyfieldset');
		
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
		
    	var entity = {};
    	
    	var id = form.down('[isFormField][name="id"]');
    	var nm = form.down('[isFormField][name="name"]');
    	var version = form.down('[isFormField][name="version"]');
    	var fieldSets = form.query('entitypropertyfieldset');

    	if(typeof id != 'undefined')
    	{
    		entity['id'] = +id.getValue();
    	}

    	if(typeof nm != 'undefined')
    	{
    		entity['name'] = nm.getValue();
    	}

    	if(typeof version != 'undefined')
    	{
    		entity['version'] = version.getValue();
    	}
    	
    	Ext.each(fieldSets, function(fieldSet)
    	{
    		
    		var val = fieldSet.getFieldValues();
    		
    		if (entity.hasOwnProperty('properties')){
    			entity['properties'].push(val);
    		} else {
    			entity['properties'] = [val];
    		}
    	});
		
		return entity;
	}
	
	,applyTemplate: function (combo, records, eOpts)
	{

		var fieldSets = form.query('entitypropertyfieldset');
		
		debugger;

	}
	
	
});
