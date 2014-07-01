Ext.define('Ux.locale.override.extjs.Checkbox', {
    override : 'Ext.form.field.Checkbox',

    requires : [
        'Ux.locale.override.extjs.Component'
    ],

    setLocale : function(locale) {
        var me          = this,
            locales     = me.locales,
            text        = locales.fieldLabel,
            manager     = me.locale,
            defaultText = '';

        if (text) {
            if (Ext.isObject(text)) {
                defaultText = text.defaultText;
                text        = text.key;
            }

            text = manager.get(text, defaultText);

            if (Ext.isString(text)) {
                me.setFieldLabel(text);
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