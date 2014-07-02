Ext.define('Ux.locale.override.extjs.SearchField', {
    override : 'Ext.ux.form.field.SearchField',

    requires : [
        'Ux.locale.override.extjs.Component'
    ],

    setLocale : function(locale) {
        var me          = this,
            locales     = me.locales,
            text        = locales.fieldLabel,
            emptyText	= locales.emptyText,
            manager     = me.locale,
            defaultText = '';
        
        if (text) {
            if (Ext.isObject(text)) {
                defaultText = text.defaultText;
                text        = text.key;
            }

            text = manager.get(text, defaultText);
            emptyText = manager.get(emptyText, defaultText);

            if (Ext.isString(text)) {
                me.setFieldLabel(text);
            }

            if (Ext.isString(emptyText)) {
                me.emptyText = emptyText;
            }
        }

        if (emptyText) {
            if (Ext.isObject(emptyText)) {
                defaultText = emptyText.defaultText;
                text        = emptyText.key;
            }

            emptyText = manager.get(emptyText, defaultText);

            if (Ext.isString(emptyText)) {
                me.emptyText = [emptyText];
                me.applyEmptyText();
            }
        }

        me.callOverridden(arguments);
    },

    setFieldLabel : function(text) {

    	if(this.labelEl)
    	{
    		this.labelEl.update(text);
    	}
    	
        this.fieldLabel = text;

        return this;
    }
});