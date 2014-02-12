Ext.define('Ext.ux.form.field.PopOutableTextArea', 
{
    extend:'Ext.form.field.TextArea',
    alias: ['widget.popoutabletextareafield', 'widget.popoutabletextarea'],
    alternateClassName: 'Ext.ux.form.PopOutableTextArea',
	mixins: 
	{
		popoutable: 'Ext.ux.form.PopOutable'
	},
	
});