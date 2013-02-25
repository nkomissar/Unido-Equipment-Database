Ext.define('Ext.form.ClosableFieldSet', {
    extend: 'Ext.form.FieldSet',
    
    uses: ['Ext.panel.Tool'],
    
    alias: 'widget.closablefieldset',
    items:[{
    	fieldLabel: 'Name',
    	xtype: 'textfield',
    	name: 'name'
    }],
    initLegend: function () {
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
        			itemId: 'etname',
        			name: 'name',
        			fieldLabel: 'Name'
        		}, {
        			xtype: 'closablefieldset',
                    columnWidth: 0.5,
                    title: 'Test Fieldset',
                    collapsible: true,
                    defaultType: 'textfield',
                    defaults: { anchor: '100%' },
                    layout: 'anchor'
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
		                title: 'Test Fieldset',
		                collapsible: true,
		                defaults: { anchor: '100%' },
		                layout: 'anchor'
		            }));
					
					fieldSet.loadRecord(property);
					
				}
		);
	}
});
