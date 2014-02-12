Ext.define('Ext.ux.form.field.PopOutableHtmlEditor', 
{
    extend:'Ext.form.field.HtmlEditor',
    alias: ['widget.popoutablehtmleditor'],
    alternateClassName: 'Ext.ux.form.PopOutableHtmlEditor',
	mixins: 
	{
		popoutable: 'Ext.ux.form.PopOutable'
	},

});