
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
	            fieldLabel: this.getLabel(record.TemplateProperty),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: record.get('value')
	        }));
			
			break;
			
		case "TEXT":
			
			me.add(Ext.widget('textarea', {
				name: 'value',
	            columnWidth: 0.5,
	            fieldLabel: this.getLabel(record.TemplateProperty),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: record.get('value')
	        }));
			
			break;
		default:
		case "STRING":
			
			me.add(Ext.widget('textfield', {
				name: 'value',
	            columnWidth: 0.5,
	            fieldLabel: this.getLabel(record.TemplateProperty),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: record.get('value')
	        }));
			
			break;
			
		case "INTEGER":
			
			me.add(Ext.widget('textfield', {
				name: 'value',
	            columnWidth: 0.5,
	            fieldLabel: this.getLabel(record.TemplateProperty),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: record.get('value')
	        }));
			
			break;
			
		case "BOOLEAN":
			
			me.add(Ext.widget('checkbox', {
				name: 'value',
				columnWidth: 0.5,
	            fieldLabel: this.getLabel(record.TemplateProperty),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: record.get('value')
	        }));
			
			break;
			
		case "REFERENCE":
			
			me.add(Ext.widget('textfield', {
				name: 'value',
	            columnWidth: 0.5,
	            fieldLabel: this.getLabel(record.TemplateProperty),
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

    	if(typeof value != 'undefined'
    		&& value != null)
    	{
    		me.record.set('value', value.getValue());
    	}
   	
    	var retValue = me.record.data;
    	retValue['templateProperty'] = me.record.getAssociatedData().templateProperty;
    	
    	return retValue;

    }

    , getLabel: function(templateProperty)
    {
    	var retvalue = templateProperty.get('name');
    	var uom = templateProperty.get('unitOfMeasure');
    	
    	if (uom)
    	{
    		retvalue = retvalue + ", " + uom;
    	}
    	
    	return retvalue;
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
        	
        	layout: 'fit',
        	
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
                    anchor: '100% -55',
                    items:[{
                        title:'Properties',
	                	bodyPadding: 10,
	                	overflowY: 'scroll',
	                	itemId: 'propertiesTab'
	                },{
                        title:'Linked Entities',
	                	layout: 'anchor',
	                	bodyPadding: 10,
	                	items:[{
							xtype: 'dataview',
							trackOver: true,
							overflowY: 'scroll',
							anchor: '100% -30',
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
	                	},{
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
		
		var tab = frm.down('panel[itemId=propertiesTab]');
		
		var fieldSet = Ext.widget('entitypropertyfieldset', {
            columnWidth: 0.5,
            collapsed: false,
            defaults: { anchor: '100%' },
            layout: 'anchor'
        });
		
		tab.add(fieldSet);
		
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
		
		Ext.each(entity.GetEntityTemplate().properties().data.items, 
				function(templProperty)
				{
					var entityProp = null;
					
					Ext.each(entity['properties']().data.items,
							function(prop)
							{
								
								if (prop.GetTemplateProperty().get('id') == templProperty.get('id'))
								{
									entityProp = prop;
									return false;
								}
							}
					);
					
					if (typeof entityProp == 'undefined'
							|| entityProp == null)
					{
						entityProp = Ext.create( 'EetdbAdmin.model.EntityProperty',
								{
									id : 0,
									code : templProperty.get('code'),
									templateProperty : templProperty
								}
						);
					}
					
					me.addProperty(form, entityProp);
				
				}
		);
		
		var entitiesDataview = form.down('dataview[name="linkedEntities"]');
		var entitiesStore = entity.childEntities();
		
		entitiesDataview.bindStore(entitiesStore);
		
	}
	
	,getFieldValues: function() {
		
		var form = this.down('form');
		
    	var entity = {};
    	
    	var id = form.down('[isFormField][name="id"]');
    	var nm = form.down('[isFormField][name="name"]');
    	var version = form.down('[isFormField][name="version"]');
    	var fieldSets = form.query('entitypropertyfieldset');
    	var entityTemplateCombo = form.down('[isFormField][name="entityTemplate"]');
		var entitiesDataview = form.down('dataview[name="linkedEntities"]');
    	

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
    	
    	if(typeof entityTemplateCombo != 'undefined')
    	{
    		var id = entityTemplateCombo.getValue();
    		entity['entityTemplate'] = entityTemplateCombo.findRecord(entityTemplateCombo.valueField || entityTemplateCombo.displayField, id).data;
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
		
    	if(typeof entitiesDataview != 'undefined')
    	{
    		entitiesDataview.getStore().each(function(item){
    			
    			if (entity.hasOwnProperty('childEntities')){
    				entity['childEntities'].push(item.data);
        		} else {
        			entity['childEntities'] = [item.data];
        		}
    			
    		});
    	}    	
		return entity;
	}
	
});
