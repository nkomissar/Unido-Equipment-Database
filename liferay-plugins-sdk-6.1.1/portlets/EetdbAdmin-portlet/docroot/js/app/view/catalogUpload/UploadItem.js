
Ext.define('EetdbAdmin.view.catalogUpload.UploadItem', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.uploaditem',

    cls: 'preview',
    autoScroll: true,
    border: false,
    
    initComponent: function() {
   	
    	Ext.apply(this, {
            tpl: new Ext.XTemplate(
                '<div>',
                	'<tpl if="this.isDataEmpty(values, xcount)">',
                	'No data',
                	'</tpl>',
                	'<tpl if="!this.isDataEmpty(values, xcount)">',
                    '<h3>{fileName}</h3>',
                    '<h4>Size {fileSize:this.formatFileSize}</h4>',
                	'</tpl>',
                '</div>',{

                formatFileSize: function(value) {
                    if (isNaN(value)) {
                        return '';
                    }
                    return Ext.util.Format.fileSize(value);
                },
                isDataEmpty: function(value, a){
                	return (!value.hasOwnProperty('fileName'));
                }
                
            })
        });

        this.callParent(arguments);
    }
	
});
