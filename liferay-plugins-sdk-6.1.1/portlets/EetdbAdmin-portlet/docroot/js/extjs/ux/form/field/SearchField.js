Ext.define("Ext.ux.form.field.SearchField", {
		extend : "Ext.form.field.Trigger",
		alias : "widget.searchfield",
	
		//requires: ['Ext.form.TriggerField'],
		
		enableKeyEvents : true,
		
		trigger1Cls: Ext.baseCSSPrefix + 'form-clear-trigger',
	    trigger2Cls: Ext.baseCSSPrefix + 'form-search-trigger',
	
		listeners : {
			keyup : function(f, e) {
				if (f.hideTrigger) {
					return;
				}
				var key = e.getKey();
				if (key == e.ENTER || (key == e.SPACE && !f.editable)) {
					f.fireEvent("triggerclick", f, e);
				}
			}
		},
	
	
		afterRender : function() {
			var me = this, body = me.bodyEl;
			me.callParent();
			me.mon(body, "dblclick", me.onDblClick, me);
		},
	
		onTrigger1Click : function(e) {
			this.setValue('');
		},
	
		onTrigger2Click : function(e) {
			var me = this;
			if (!me.hideTrigger) {
				me.fireEvent("triggerclick", me, e);
			}
		},
	
	
		onDblClick : function(e) {
			var me = this;
			if (!me.hideTrigger) {
				me.fireEvent("triggerclick", me, e);
			}
		}
	});
