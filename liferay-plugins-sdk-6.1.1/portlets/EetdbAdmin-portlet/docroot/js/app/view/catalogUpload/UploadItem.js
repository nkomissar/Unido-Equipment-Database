
Ext.define('EetdbAdmin.view.catalogUpload.UploadItem', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.uploaditem',

    uses: ['Ext.grid.Panel'],
    
   // cls: 'preview',
   // autoScroll: true,
   // border: false,
    
    initComponent: function() {
   	
    	Ext.apply(this, {
    		
    		items: [{
    			xtype: 'panel'
    			,region: 'center'
    			,bodyStyle: 'padding:15px'
    			,id: 'uploaddetails',
                tpl: new Ext.XTemplate(
                        '<div>',
                        	'<tpl if="this.isDataEmpty(values, xcount)">',
                        	'No data',
                        	'</tpl>',
                        	'<tpl if="!this.isDataEmpty(values, xcount)">',
                            '<h3>File name: {fileName}</h3>',
                            '<h4>Status: {status}</h4>',
                            '<h4>Size: {fileSize:this.formatFileSize}</h4>',
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
                        
                    }),
    		},{
    			xtype: 'grid'
    			,region: 'south'
            	,title: 'Upload Errors'
            	,locales:{
            		title: 'titles.uploaderrors'
            	}
                ,overflowY: 'auto'
                ,height: 200
    		    //,bodyStyle: 'padding:15px'
                //,bodyPadding: 15
                ,emptyText: 'No errors for this file'
                ,store: 'UploadErrors'
                ,columns:[
                {
                    id: 'rownum',
                    text: "Row #",
                    locales: {
                    	text: 'titles.rownum'
                    },
                    dataIndex: 'rowNumber',
                    flex: 1,
                    sortable: false
                },{
                    text: "Message",
                    locales: {
                    	text: 'titles.message'
                    },
                    dataIndex: 'message',
                    flex: 2,
                    sortable: false
                	
                }]
    				
    		}],
    		layout: 'border',
    		align: 'stretch',
    		defaults: {
    		    collapsible: false,
    		    split: true,
    		}
    		

        });

        this.callParent(arguments);
    }
	
});
