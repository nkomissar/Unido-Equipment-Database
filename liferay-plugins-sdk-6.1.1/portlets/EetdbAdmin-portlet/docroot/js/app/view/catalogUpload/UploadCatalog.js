
Ext.define('EetdbAdmin.view.catalogUpload.UploadCatalog', {
    extend: 'Ext.window.Window',
    alias: 'widget.uploadcatalog',
    
    
    width: 450,
    height: 200,
    title: 'Catalog Upload',
    layout: 'fit',
    modal: true,
    plain: true,
    
    
    initComponent: function() 
    {
        Ext.apply(this, {
            
            closeAction: 'hide',
            
        	items: [{
        		xtype: 'form',
        		bodyPadding: 10,
        		layout: {
                    type: 'hbox',
                    padding:'5',
                    align:'middle'
                },
        		items: [{
        			xtype: 'filefield',
        			name: 'fileData',
        			hideLabel: true,
        			anchor: '100%',
        			buttonText: 'Select File ...',
        			allowBlank: false,
        			flex: 1
        		}],

            
	            buttons: [{
	                    text: 'OK',
	                    //this is not MVC at all...
	                    handler: function() {
	                        var form = this.up('form').getForm();
	                        
	                		var pUrl = portletUrl.createActionURL();
	                		pUrl.setPortletId(portletId);
	                		pUrl.setWindowState(exclusiveWindowState);
	                		
	                		pUrl.setParameter('formAction', 'catalogUpload');
	                        
	                        if(form.isValid()){
	                            form.submit({
	                                url: pUrl.toString(),
	                                waitMsg: 'Uploading your catalog...',
	                                success: function(fp, o) {
	                                    Ext.Msg.alert('Success', 'Your catalog "' + o.result.file + '" has been uploaded.');
	                                }
	                            });
	                        }
	                    }
	                }, {
	                    text: 'Cancel',
	                    scope: this,
	                    handler: this.close
	                }]
        	}]
        });
        
        
        this.callParent(arguments);
    }

});
