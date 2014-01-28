Ext.define('EetdbAdmin.controller.CatalogUpload', {
    extend: 'Ext.app.Controller',

    stores: ['UploadQueue', 'UploadItem', 'UploadErrors'],
    models: ['UploadItem', 'UploadError'],
    views: ['catalogUpload.UploadQueue', 'catalogUpload.UploadItem'],
    
    refs: [
           {ref: 'uploadQueue', selector: 'uploadQueue'},
           {ref: 'uploadQueueDataView', selector: 'uploadQueue dataview'},
           {ref: 'uploadItem', selector: 'uploaditem'},
           {ref: 'uploadErrorsGrid'
        	,selector: 'uploaditem errorsgridplaceholder dataview'
        	,autoCreate: true
        	,xtype: 'dataview'
        	,title: 'Upload Errors'
        	,itemSelector: '.entitytemplate-list-item'
        	,overItemCls: 'entitytemplate-list-item-hover'
        	,tpl: '<tpl for="."><div class="entitytemplate-list-item">{rowNumber}</div></tpl>'
            ,trackOver: true
            ,overflowY: 'auto'
            ,autoHeight:true
            ,store: 'UploadErrors'
           }
       ],
    
    init: function() {
    	
        this.control({
            'uploadQueue dataview': {
                selectionchange: this.loadItem
            },
        });
        
    },
    
    onLaunch: function() {

    	var queueDataview = this.getUploadQueueDataView();
        var queueStore = this.getUploadQueueStore();
        
        queueDataview.bindStore(queueStore);

    },
    
    loadItem: function(selModel, selected) 
    {
        var store = this.getUploadItemStore(),
        errorsStore = this.getUploadErrorsStore(),
        selectedUploadItem = selected[0];
    
	    var eItem = this.getUploadItem();
	    
	    eItem.show();
	    eItem.enable();
	    
	    if (typeof selectedUploadItem === 'undefined')
	    {
	    	this.application.fireEvent('uploadItemUnselected');
	    	return;
	    }
	    
	    if (!selectedUploadItem.phantom
	    		&& !selectedUploadItem.dirty) 
	    {
	    	
	    	
	    	eItem.setLoading({
	            msg: 'Loading upload details...'
	        });
	
	    	store.load({
	            params: {
	            	action: 'getUploadItemDetails',
	                uploadItemId: selectedUploadItem.get('id')
	            },
	            callback: function(records, operation, success) 
	            {
	            	var uploadItem = success ? records[0].data : {};

	            	eItem.setLoading(false);
	            	
	            	if (!success)
	            	{
    	            	eItem.update({});
	            		return;
	            	}
	            	
	            	var errorsGrid = this.getUploadErrorsGrid();
	            	var errorsStore = this.getUploadErrorsStore();
	            	errorsGrid.bindStore(errorsStore);

	            	errorsStore.load({
	    	            params: {
	    	            	action: 'getUploadItemErrors',
	    	                uploadItemId: selectedUploadItem.get('id')
	    	            }
	            	});
	            	
	            	eItem.update(uploadItem);
	            	
	            	
	            },
	            scope: this
	        });
	    	
	    	return;
	    }
	    
        eItem.update(selectedUploadItem);
        store.loadRecords([selectedUploadItem]);
    	this.application.fireEvent('uploadItemSelected');

    }

});