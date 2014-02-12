Ext.define('Ext.ux.form.PopOutable', 
{
	requires:['Ext.button.Button', 'Ext.XTemplate'],
	
	afterLabelTpl: 
	[
		'<tpl for=".">', 
			'{[ this.addCmp({',
				'xclass: "Ext.button.Button",',
				'parentCmp: parent,',
				'tooltip:"Pop Out",',
				'handler: this.buttonClick,',
				'iconCls: "popout popout-maximize",',
				'width: "21px",',
				'height: "21px"',
			'}) ]}',
		'</tpl>', 
		{
			createCmp: function (scope) {
				//render any components that addCmp might have added
				while (scope.templateComponents.length > 0) 
				{
					var el = scope.templateComponents.shift();
					el.scope = scope;
					
					if (Ext.get(el.renderTo) != null) {
						var newel = new Ext.create(el);
					}
				}
			},

			//Pushes an initialConfig to the array so that
			//a component can be later created and rendered.
			//It also generates a div container for the component 
			//with id
			addCmp: function (initConfig) 
			{
				var parentCmp = Ext.getCmp(initConfig.parentCmp.id || this.fn.arguments[2].id);
				
				//an array to store the initialconfigs of the components-to-be
				if (!Array.isArray(parentCmp.templateComponents))
				{
					parentCmp.templateComponents = [];
				}
				
				var wrapperId = Ext.id( {}, "ext-comp-wrapper-");
				initConfig.renderTo = wrapperId;
		
				parentCmp.templateComponents.push(initConfig);

				return '<div id="' + wrapperId + '" class="y-wrapper" style="text-align: right; padding-right: 2px; vertical-align: bottom; height: 100%"></div>';

			},		
			buttonClick: function()
			{
				var field = this;
				field.popOut(field.id);
			}
		}],
	
	listeners:
	{
		afterrender:function()
		{
			var me = this;
			var mytpl = Ext.XTemplate.getTpl(me, 'afterLabelTpl');
			mytpl.createCmp(me);
		}
	},

    popOut: function(elId) {
        var field = this;
		var fieldEl = field.getEl();
		//var field1 = Ext.getCmp(elId);
		
		var confOverrides = {
            anchor: '100% -5',
            //labelStyle: 'font-weight:bold; font-size:14px;',
			margin: 5,
		};
		
		var conf = Ext.apply({}, confOverrides, field.initialConfig);
		
		var fieldSuperclass = Ext.getClass(field).superclass;
		var tBox = Ext.create( Ext.getClassName(fieldSuperclass), conf);
		
		tBox.setValue(field.getValue());

        viewSize = Ext.getBody().getViewSize();
		
        var popOutWin = new Ext.Window({
            width: viewSize.width - 50,
            height: viewSize.height - 50,
            closable: false,
            draggable: false,
            border: false,
			padding: 5,
            modal: true,
            layout: 'anchor',
            labelAlign: 'top',
            items: [tBox],
            buttons: [{
                text: "Close",
                handler: function() {
                    field.setValue(tBox.getValue());
                    popOutWin.hide(
						fieldEl,
						function() 
						{
							var win = this;
							win.close();
						});
                }
            }]
        });
		
		popOutWin.show(fieldEl);
		
    }
});