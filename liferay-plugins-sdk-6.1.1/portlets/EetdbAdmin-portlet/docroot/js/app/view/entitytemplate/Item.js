Ext.define('Ext.form.ClosableFieldSet', {
    extend: 'Ext.form.FieldSet',
    
    uses: ['Ext.panel.Tool'],
    
    alias: 'widget.closablefieldset',
    items:[{
    	xtype: 'hidden',
    	name: 'id'
    },{
    	fieldLabel: 'Name',
    	xtype: 'textfield',
    	name: 'name'
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
    	var inGrid = me.down('[isFormField][name="displayingrid"]');
    	var mandatory = me.down('[isFormField][name="mandatory"]');
    	var uom = me.down('[isFormField][name="unitofmeasure"]');
    	
    	if(typeof id != 'undefined')
    	{
    		id.setValue(record.id);
    	}

    	if(typeof nm != 'undefined')
    	{
    		nm.setValue(record.name);
    	}

    	if(typeof inGrid != 'undefined')
    	{
    		inGrid.setValue(record.displayInGrid);
    	}

    	if(typeof mandatory != 'undefined')
    	{
    		mandatory.setValue(record.mandatory);
    	}

    	if(typeof uom != 'undefined')
    	{
    		uom.setValue(record.unitOfMeasure);
    	}

    }
    , getFieldValues: function(){
    	var me = this;
    	var prop = Ext.create('EetdbAdmin.model.EntityTemplateProperty');
    	
    	var id = me.down('[isFormField][name="id"]');
    	var nm = me.down('[isFormField][name="name"]');
    	var inGrid = me.down('[isFormField][name="displayingrid"]');
    	var mandatory = me.down('[isFormField][name="mandatory"]');
    	var uom = me.down('[isFormField][name="unitofmeasure"]');

    	if(typeof id != 'undefined')
    	{
    		prop.set('id', id['getModelData']());
    	}

    	if(typeof nm != 'undefined')
    	{
    		prop.set('name', nm['getModelData']());
    	}

    	if(typeof inGrid != 'undefined')
    	{
    		prop.set('displayInGrid', inGrid['getModelData']());
    	}

    	if(typeof mandatory != 'undefined')
    	{
    		prop.set('mandatory', mandatory['getModelData']());
    	}

    	if(typeof uom != 'undefined')
    	{
    		prop.set('unitOfMeasure', uom['getModelData']());
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

	,loadRecord: function(record) {
		
		var form = this.down('form');
		
		form.loadRecord(record);
		
		var props = form.query('closablefieldset');
		
		Ext.each(props, function(prop) {
			 if (prop.ownerCt) {
				 prop.ownerCt.remove(prop, true);
             }
		});
		
		Ext.each(record.raw.properties, 
				function(property)
				{
					var fieldSet = form.add(Ext.widget('closablefieldset', {
		                columnWidth: 0.5,
		                title: property.name,
		                collapsible: true,
		                collapsed: true,
		                defaults: { anchor: '100%' },
		                layout: 'anchor'
		            }));
					
					fieldSet.loadRecord(property);
					
				}
		);
	}
	
	,getFieldValues: function() {
		
		var form = this.down('form');
		
    	var template = Ext.create('EetdbAdmin.model.EntityTemplate');
    	
    	var id = form.down('[isFormField][name="id"]');
    	var nm = form.down('[isFormField][name="name"]');
    	var fieldSets = form.query('fieldset');

    	if(typeof id != 'undefined')
    	{
    		template.set('id', id['getModelData']());
    	}

    	if(typeof nm != 'undefined')
    	{
    		template.set('name', nm['getModelData']());
    	}
    	
    	Ext.each(fieldSets, function(fieldSet){
    		template.properties.add(fieldSet.getFieldValues());
    	});
		
		return template;
	}
	
});
