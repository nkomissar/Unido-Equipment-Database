
Ext.define('EetdbAdmin.view.catalogUpload.UploadCatalog', {
    extend: 'Ext.window.Window',
    alias: 'widget.uploadcatalog',
    
    
    width: 450,
    height: 200,
    title: 'Catalog Upload',
	locales : {
		title : 'titles.uploadcatalog'
    },
    layout: 'fit',
    modal: true,
    plain: true,
    
    
    initComponent: function() 
    {
    	
    	var me = this;
    	
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
        			buttonText: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select File ...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
    				locales : {
    					buttonText : 'buttons.selectfile'
                    },
        			allowBlank: false,
        			flex: 1
        		}],

            
	            buttons: [{
	                    text: 'OK',
	                	locales : {
	                		text : 'buttons.ok'
	                    },                  
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
	                                success: function(fp, o) 
	                                {
	                                    Ext.Msg.alert(
	                                    		'Success', 
	                                    		'Your catalog "' + o.result.fileName + '" has been uploaded.',
	                                    		function() { me.fireEvent('cataloguploaded'); } );
	                                },
	                                failure: function(form, action)
	                                {
	                                	
	                                },
	                            });
	                        }
	                    }
	                }, {
	                    text: 'Cancel',
	                	locales : {
	                		text : 'buttons.cancel'
	                    },	                    
	                    scope: this,
	                    handler: this.close
	                }]
        	}]
        });

        this.callParent(arguments);
    },

    show: function() 
    {   
    	this.callParent(arguments);
    	this.applyLocales();
    	this.updateLayout();
    },
    
    applyLocales : function() {
        var cmps     = Ext.ComponentQuery.query('uploadcatalog component[enableLocale]'),
            c        = 0,
            cNum     = cmps.length,
            language = Ux.locale.Manager.getLanguage(),
            cmp;
        
        for (; c < cNum; c++) {
            cmp = cmps[c];

            if (typeof cmp.setLocale == 'function') {
                cmp.setLocale(language);
            }
            else
            {
            	debugger;
            }
        }
    },    
});
