Ext.define('Ux.locale.override.extjs.File', {
    override : 'Ext.form.field.File',

    requires : [
        'Ux.locale.override.extjs.Component'
    ],

    setLocale : function(locale) {
        var me          = this,
            locales     = me.locales,
            buttonText  = locales.buttonText,
            manager     = me.locale,
            defaultText = '';

        if (buttonText) {
            if (Ext.isObject(buttonText)) {
                defaultText = buttonText.defaultText;
                buttonText  = buttonText.key;
            }

            buttonText = manager.get(buttonText, defaultText);

            if (Ext.isString(buttonText)) {
                me.buttonEl.dom.textContent = buttonText;
            }
        }

        me.callOverridden(arguments);
    }
});