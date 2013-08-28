
Ext.Loader.setPath('Ext.ux', 'extjs/ux');

Ext.require([
    'Ext.form.field.File',
    'Ext.form.field.Number',
    'Ext.form.Panel',
    'Ext.window.MessageBox',
	'Ext.ux.form.field.AsyncFileUpload',
	'Ext.ux.form.field.MyHtmlEditor',
	'Ext.form.field.HtmlEditor'
	//,'Ext.util.Observable'
]);

Ext.onReady(function() {

//  Class which shows invisible file input field.
   /* if (window.location.href.indexOf('debug') !== -1) {
        Ext.getBody().addCls('x-debug');
    }*/

    Ext.create('Ext.form.Panel', {
        renderTo: 'async-form',
        width: 500,
		height: 600,
        frame: true,
        title: 'Async File Upload Form',
        bodyPadding: '10 10 10',

        defaults: {
            anchor: '100%',
            allowBlank: false,
            msgTarget: 'side'
			//,labelWidth: 60
        },

        items: [
		{
			xtype: 'asyncfileupload',
			fieldLabel: 'Suppalabel'
		}
		, {
			xtype: 'asyncfileupload',
			fieldLabel: 'Suppalabel'
		}

		/*,{
			xtype: 'filefield',
			fieldLabel: 'tiss'
			,id:'addbtn1'
			,itemId:'addbtn1'
			,buttonOnly: true
			,hideLabel: true
			,buttonText: 'Add..'
			,buttonConfig: {iconCls: 'icon-plus'}
			,handler: this.onAddFile	
		}
		,{
			xtype: 'myeditor',
			fieldLabel: 'Source'
		},*/
		/*,
		
		{
		xtype: 'htmleditor',
		fieldLabel: 'Source'
		}*/
		]
	});
});