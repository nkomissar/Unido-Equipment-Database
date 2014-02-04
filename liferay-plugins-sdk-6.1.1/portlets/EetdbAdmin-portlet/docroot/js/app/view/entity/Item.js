
Ext.require([
    'Ext.ux.form.field.BoxSelect',
    'Ext.ux.form.field.AsyncFileUpload',
    ]);



/**
 * Override for default Ext.form.TextArea.  Growing to near full-screen/full-window on double-click.
 * 
 * Makes all text areas enlargable by default on double-click - to prevent this behaviour set "popout:false" in the config
 * By default the fieldLabel of the enhanced field is the fieldLabel of the popout - this can be set separately with "popoutLabel:'some string'"  this will also inherit the same labelSeparator config value as that of the enhanced parent.
 * The close text for the button defaults to "Close" but can be overriden by setting the "popoutClose:'some other text'" config
 */

Ext.override(Ext.form.TextArea, {
    popout: true,
    onRender: function(ct, position) {
        if (!this.el) {
            this.defaultAutoCreate = {
                tag: "textarea",
                style: "width:100px;height:60px;",
                autocomplete: "off"
            };
        }
        Ext.form.TextArea.superclass.onRender.call(this, ct, position);
        if (this.grow) {
            this.textSizeEl = Ext.DomHelper.append(document.body, {
                tag: "pre",
                cls: "x-form-grow-sizer"
            });
            if (this.preventScrollbars) {
                this.el.setStyle("overflow", "hidden");
            }
            this.el.setHeight(this.growMin);
        }
        if (this.popout && !this.readOnly) {

            if (!this.popoutLabel) {
                this.popoutLabel = this.fieldLabel;
            }
            this.popoutClose = 'Close';
            var field = this;
            this.getEl().on('dblclick',
            function() {
                field.popoutTextArea(this.id);
            });
        };
    },
    popoutTextArea: function(elId) {
        var field = this;
        tBox = new Ext.form.TextArea({
            popout: false,
            anchor: '100% 100%',
            labelStyle: 'font-weight:bold; font-size:14px;',
            value: Ext.getCmp(elId).getValue(),
            fieldLabel: field.popoutLabel,
            labelSeparator: field.labelSeparator
        });

        viewSize = Ext.getBody().getViewSize();
        textAreaWin = new Ext.Window({
            width: viewSize.width - 50,
            height: viewSize.height - 50,
            closable: false,
            draggable: false,
            border: false,
            bodyStyle: 'background-color:#badffd;',
            //bodyBorder:false,
            modal: true,
            layout: 'form',
            // explicitly set layout manager: override the default (layout:'auto')
            labelAlign: 'top',
            items: [tBox],
            buttons: [{
                text: field.popoutClose,
                handler: function() {
                    Ext.getCmp(elId).setValue(tBox.getValue());
                    textAreaWin.hide(Ext.getCmp(elId).getEl(),
                    function(win) {
                        win.close();
                    });
                }
            }]
        }).show(Ext.getCmp(elId).getEl());
    }

});



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
        
		var pUrl = portletUrl.createActionURL();
		pUrl.setPortletId(portletId);
		pUrl.setWindowState(exclusiveWindowState);
		
		pUrl.setParameter('formAction', 'fileUpload');
		
		this.blobUploadUrl = pUrl.toString();

		var renderUrl = portletUrl.createRenderURL();
		renderUrl.setPortletId(portletId);
		renderUrl.setWindowState(exclusiveWindowState);
		
		renderUrl.setParameter('action', 'getProgress');
		
		this.blobProgressUrl = renderUrl.toString();

		renderUrl.setParameter('action', 'doBlobMetaLoad');
		
		this.fetchInitialItemUrl = renderUrl.toString();
        
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
				popout: true,
				name: 'value',
	            columnWidth: 0.5,
	            fieldLabel: this.getLabel(record.TemplateProperty),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            value: record.get('value')
	        }));
			
			break;
		case "HTML":
			
			me.add(Ext.widget('htmleditor', {
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
			
			var boxselect = me.add(Ext.widget('boxselect', {
				name: 'value',
		        displayField: 'name',
		        valueField: 'stringId',
		        delimiter: ',',
	            fieldLabel: this.getLabel(record.TemplateProperty),
	            defaults: { anchor: '100%' },
	            layout: 'anchor',
	            emptyText: 'Pick a value',
	            queryMode: 'local'
	        }));
			
			me.fireEvent('reffieldcreated', boxselect, record);
			
			break;
			
		case "IMG":
			
			me.add(Ext.widget('asyncfileupload', {
				name: 'value',
				columnWidth: 0.5,
	            fieldLabel: this.getLabel(record.TemplateProperty),
	            defaults: { anchor: '100%'},
	            layout: 'anchor',
	            uploadUrl: this.blobUploadUrl,
	            progressUrl: this.blobProgressUrl,
				fetchInitialItemUrl: this.fetchInitialItemUrl,
				initialValue: record.get('value')
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
        			xtype: 'checkbox',
        			name: 'status',
        			fieldLabel: 'Approved'
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
                    	
                    },{
                        title:'Parent Topics',
	                	layout: 'anchor',
	                	bodyPadding: 10,
	                	items:[{
							xtype: 'dataview',
							trackOver: true,
							overflowY: 'scroll',
							anchor: '100% -30',
							store: 
							{
								model: 'EetdbAdmin.model.Topic'
							},
							cls: 'topic-list',
							itemSelector: '.topic-list-item',
							overItemCls: 'topic-list-item-hover',
							tpl: '<tpl for="."><div class="topic-list-item">{name}</div></tpl>',
							name: 'parentTopics',
							listeners: {
								selectionchange: function(selModel, selected){
									 
									var btnRemove = this.ownerCt.down('button[action=removeparenttopic]');
									
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
									action: 'addparenttopic',
									margin: '5 5 0 5'
								},{
									xtype: 'button',
									text: 'Remove',
									action: 'removeparenttopic',
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

    	var statusCheck = form.down('[isFormField][name="status"]');
    	statusCheck.setValue(entity.get('status') == 'ACTIVE');
		
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
		
		var topicsDataview = form.down('dataview[name="parentTopics"]');
		var topicsStore = entity.parentTopics();
		
		topicsDataview.bindStore(topicsStore);		
	}
	
	,getFieldValues: function() {
		
		var form = this.down('form');
		
    	var entity = {};
    	
    	var id = form.down('[isFormField][name="id"]');
    	var nm = form.down('[isFormField][name="name"]');
    	var status = form.down('[isFormField][name="status"]');
    	var version = form.down('[isFormField][name="version"]');
    	var fieldSets = form.query('entitypropertyfieldset');
    	var entityTemplateCombo = form.down('[isFormField][name="entityTemplate"]');
		var entitiesDataview = form.down('dataview[name="linkedEntities"]');
		var topicsDataview = form.down('dataview[name="parentTopics"]');    	

    	if(typeof id != 'undefined')
    	{
    		entity['id'] = +id.getValue();
    	}

    	if(typeof nm != 'undefined')
    	{
    		entity['name'] = nm.getValue();
    	}

    	if(typeof status != 'undefined')
    	{
    		entity['status'] = status.getValue() ? 'ACTIVE' : 'PENDING';
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
    	
    	if(typeof topicsDataview != 'undefined')
    	{
    		topicsDataview.getStore().each(function(item){
    			
    			if (entity.hasOwnProperty('parentTopics')){
    				entity['parentTopics'].push(item.data);
        		} else {
        			entity['parentTopics'] = [item.data];
        		}
    			
    		});
    	}
    	
		return entity;
	}
	
});
