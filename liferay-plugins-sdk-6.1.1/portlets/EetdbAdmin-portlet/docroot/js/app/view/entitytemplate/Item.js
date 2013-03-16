Ext.define('Ext.form.TemplateClosableFieldSet', {
    extend: 'Ext.form.FieldSet',
    
    uses: ['Ext.panel.Tool'],
    
    alias: 'widget.templateclosablefieldset',
    items:[{
    	xtype: 'hidden',
    	name: 'id'
    },{
    	fieldLabel: 'Name',
    	xtype: 'textfield',
    	name: 'name'
    },{
    	fieldLabel: 'Code',
    	xtype: 'textfield',
    	name: 'code'
    },{
    	fieldLabel: 'Display in grid',
    	xtype: 'checkbox',
    	name: 'displayingrid'
    },{
    	fieldLabel: 'Mandatory',
    	xtype: 'checkbox',
    	name: 'mandatory'
    },{
    	fieldLabel: 'Unit of measure',
    	xtype: 'textfield',
    	name: 'unitofmeasure'
    },{
    	xtype: 'hidden',
    	name: 'version'
    },{
        xtype: 'combobox',
        name : 'valueType',
        fieldLabel: 'Value Type',
        displayField: 'type',
        queryMode: 'local',
        valueField: 'id',
        store: 'ValueType',
        editable: false
    }],
    initComponent: function () {
        var me = this;
        me.callParent(arguments);
        if (!me.legend.closable) {
            me.legend.insert(1, Ext.widget('tool', {
                type: 'close',
                handler: me.onCloseClick,
                scope: me
            }));
            me.legend.closable = true;
        }
    },
    onCloseClick: function () {
        if (this.ownerCt) {
            this.ownerCt.remove(this, true);
        }
    },
    loadRecord: function (record) {
    	var me = this;
    	
    	var id = me.down('[isFormField][name="id"]');
    	var nm = me.down('[isFormField][name="name"]');
    	var code = me.down('[isFormField][name="code"]');
    	var inGrid = me.down('[isFormField][name="displayingrid"]');
    	var mandatory = me.down('[isFormField][name="mandatory"]');
    	var uom = me.down('[isFormField][name="unitofmeasure"]');
    	var version = me.down('[isFormField][name="version"]');
    	var vt = me.down('[isFormField][name="valueType"]');
    	
    	if(typeof id != 'undefined')
    	{
    		id.setValue(record.get('id'));
    	}

    	if(typeof code != 'undefined')
    	{
    		code.setValue(record.get('code'));
    	}
    	if(typeof nm != 'undefined')
    	{
    		nm.setValue(record.get('name'));
    	}

    	if(typeof inGrid != 'undefined')
    	{
    		inGrid.setValue(record.get('displayInGrid'));
    	}

    	if(typeof mandatory != 'undefined')
    	{
    		mandatory.setValue(record.get('mandatory'));
    	}

    	if(typeof uom != 'undefined')
    	{
    		uom.setValue(record.get('unitOfMeasure'));
    	}

    	if(typeof version != 'undefined')
    	{
    		version.setValue(record.get('version'));
    	}

    	if(typeof vt != 'undefined')
    	{
    		vt.setValue(record.GetValueType().get('id'));
    	}
    	
    }
    , getFieldValues: function(){
    	var me = this;
    	var prop = {};
    	
    	var id = me.down('[isFormField][name="id"]');
    	var nm = me.down('[isFormField][name="name"]');
    	var code = me.down('[isFormField][name="code"]');
    	var inGrid = me.down('[isFormField][name="displayingrid"]');
    	var mandatory = me.down('[isFormField][name="mandatory"]');
    	var uom = me.down('[isFormField][name="unitofmeasure"]');
    	var version = me.down('[isFormField][name="version"]');
    	var vt = me.down('[isFormField][name="valueType"]');

    	if(typeof id != 'undefined')
    	{
    		prop['id'] = +id.getValue();
    	}

    	if(typeof nm != 'undefined')
    	{
    		prop['name'] = nm.getValue();
    	}

    	if(typeof code != 'undefined')
    	{
    		prop['code'] = code.getValue();
    	}
    	
    	if(typeof inGrid != 'undefined')
    	{
    		prop['displayInGrid'] = inGrid.getValue();
    	}

    	if(typeof mandatory != 'undefined')
    	{
    		prop['mandatory'] = mandatory.getValue();
    	}

    	if(typeof uom != 'undefined')
    	{
    		prop['unitOfMeasure'] = uom.getValue();
    	}
    	
    	if(typeof lud != 'undefined')
    	{
    		prop['version'] = version.getValue();
    	}
    	
    	if(typeof vt != 'undefined')
    	{
    		var id = vt.getValue();
    		prop['valueType'] = vt.findRecord(vt.valueField || vt.displayField, id).data;
    	}
    	
    	return prop;

    }
});    	


Ext.define('EetdbAdmin.view.entitytemplate.Item', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.entitytemplateitem',

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
        			xtype: 'textfield',
        			name: 'code',
        			fieldLabel: 'Code'
        		},{
        			xtype: 'hidden',
        			name: 'id'
        		},{
        			xtype: 'hidden',
        			name: 'version'
        		},{
        			xtype: 'button',
        			text: 'Add Property',
        			handler: function(btn){
        				var form = btn.up('form');
        				this.addProperty(form);
        			},
        			scope: this
        		}],
        		buttons: [{
        			text: 'Save',
        			action: 'create'
        		}]
        	}]
        	
        });

        this.callParent(arguments);
    }

	,addProperty: function(frm) {
		
		var fieldSet = frm.add(Ext.widget('templateclosablefieldset', {
            columnWidth: 0.5,
            title: 'Property',
            collapsible: true,
            collapsed: false,
            defaults: { anchor: '100%' },
            layout: 'anchor'
        }));
		
		return fieldSet;
	}

	,loadRecord: function(record) {
		var me = this;
		var form = this.down('form');
		
		form.loadRecord(record);
		
		var props = form.query('templateclosablefieldset');
		
		Ext.each(props, function(prop) {
			 if (prop.ownerCt) {
				 prop.ownerCt.remove(prop, true);
             }
		});
		
		Ext.each(record['properties']().data.items, 
				function(property)
				{
			
					var fieldSet = me.addProperty(form);
					fieldSet.collapse();
					
					fieldSet.loadRecord(property);
					
				}
		);
	}
	
	,getFieldValues: function() {
		
		var form = this.down('form');
		
    	var template = {};
    	
    	var id = form.down('[isFormField][name="id"]');
    	var nm = form.down('[isFormField][name="name"]');
    	var code = form.down('[isFormField][name="code"]');
    	var version = form.down('[isFormField][name="version"]');
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

    	if(typeof version != 'version')
    	{
    		template['version'] = version.getValue();
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
