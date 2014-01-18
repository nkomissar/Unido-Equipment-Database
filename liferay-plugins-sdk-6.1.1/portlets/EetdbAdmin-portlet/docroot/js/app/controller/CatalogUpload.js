Ext.define('EetdbAdmin.controller.CatalogUpload', {
    extend: 'Ext.app.Controller',

    stores: ['UploadQueue', 'UploadItem'],
    models: ['UploadItem'],
    views: ['catalogUpload.UploadQueue', 'catalogUpload.UploadItem'],
    
    refs: [
           {ref: 'uploadQueue', selector: 'uploadQueue'},
           {ref: 'uploadQueueDataView', selector: 'uploadQueue dataview'},
           {ref: 'uploadItem', selector: 'uploaditem'}
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
	            callback: function(records, operation, success) {

	            	eItem.setLoading(false);
	            	
	            	eItem.update( success ? records[0].data : {});
	            	
	            }
	        });
	    	
	    	return;
	    }
	    
        eItem.update(selectedUploadItem);
        store.loadRecords([selectedUploadItem]);
    	this.application.fireEvent('uploadItemSelected');

    },
});