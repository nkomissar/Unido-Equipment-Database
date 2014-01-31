
Ext.define('EetdbAdmin.view.catalogUpload.UploadCatalog', {
    extend: 'Ext.window.Window',
    alias: 'widget.uploadcatalog',
    
    
    width: 400,
    height: 300,
    title: 'Catalog Upload',
    layout: 'fit',
    modal: true,
    plain: true,
    
    
    initComponent: function() 
    {
        Ext.apply(this, {
            
            closeAction: 'hide',
            
            buttons: [{
                    text: 'OK',
                    action: 'add',
                    disabled: true
                }, {
                    text: 'Cancel',
                    scope: this,
                    handler: this.close
                }],
        });
        
        
        this.callParent(arguments);
    }

});
