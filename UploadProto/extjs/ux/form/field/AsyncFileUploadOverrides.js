Ext.define('Ext.ux.form.field.AsyncFileUploadOverrides', 
{
    requires: 
		[ 
			'Ext.data.Connection'
			, 'Ext.form.field.File'
		],
	singleton: true,
	overridesLoaded: false,
	loadOverrides: function() 
	{
		debugger;
		if(!this.overridesLoaded)
		{
			Ext.override(Ext.data.Connection, 
			{
				upload: this.customizedUpload
			});

			Ext.override(Ext.form.field.File, 
				{
					// Copy of 4.1.1 File.reset but remains inputEl
					reset: function()
					{
						var me = this;
						if (me.rendered) {
							//me.fileInputEl.remove();   
							me.createFileInput();
							me.inputEl.dom.value = '';
						}
						me.callParent();
					}
					,createFileInput: this.customizedCreateFileInput
				});
			
			this.overridesLoaded = true;
		}
	}
	
	// Copy of 4.1.1 Connection.upload but remains reference to form's target.
	, customizedUpload: function(form, url, params, options) {
        form = Ext.getDom(form);
        options = options || {};

        var id = Ext.id(),
            frame = document.createElement('iframe'),
            hiddens = [],
            encoding = 'multipart/form-data',
            buf = {
                target: form.target,
                method: form.method,
                encoding: form.encoding,
                enctype: form.enctype,
                action: form.action
            },
            addField = function(name, value) {
                hiddenItem = document.createElement('input');
                Ext.fly(hiddenItem).set({
                    type: 'hidden',
                    value: value,
                    name: name
                });
                form.appendChild(hiddenItem);
                hiddens.push(hiddenItem);
            },
            hiddenItem, obj, value, name, vLen, v, hLen, h;

        /*
         * Originally this behaviour was modified for Opera 10 to apply the secure URL after
         * the frame had been added to the document. It seems this has since been corrected in
         * Opera so the behaviour has been reverted, the URL will be set before being added.
         */
        Ext.fly(frame).set({
            id: id,
            name: id,
            cls: Ext.baseCSSPrefix + 'hide-display',
            src: Ext.SSL_SECURE_URL
        });

        document.body.appendChild(frame);

        // This is required so that IE doesn't pop the response up in a new window.
        if (document.frames) {
            document.frames[id].name = id;
        }

        Ext.fly(form).set({
            target: id,
            method: 'POST',
            enctype: encoding,
            encoding: encoding,
            action: url || buf.action
        });

        // add dynamic params
        if (params) {
            obj = Ext.Object.fromQueryString(params) || {};

            for (name in obj) {
                if (obj.hasOwnProperty(name)) {
                    value = obj[name];  
                    if (Ext.isArray(value)) {
                        vLen = value.length;
                        for (v = 0; v < vLen; v++) {
                            addField(name, value[v]);
                        }
                    } else {
                        addField(name, value);
                    }
                }
            }
        }

        Ext.fly(frame).on('load', Ext.Function.bind(this.onUploadComplete, this, [frame, options]), null, {single: true});
        form.submit();

        //Ext.fly(form).set(buf);

        hLen = hiddens.length;

        for (h = 0; h < hLen; h++) {
            Ext.removeNode(hiddens[h]);
        }
    }
	
	, customizedCreateFileInput : function() 
	{
        var me = this;
        me.fileInputEl = me.buttonEl.createChild({
            name: me.getName(),
            //id: me.id + '-fileInputEl',
			id: Ext.id() + '-fileInputEl',
            cls: Ext.baseCSSPrefix + 'form-file-input',
			multiple: 'multiple',
            tag: 'input',
            type: 'file',
            size: 1
        });
        me.fileInputEl.on({
            scope: me,
            change: me.onFileChange
        });
    }
	
});