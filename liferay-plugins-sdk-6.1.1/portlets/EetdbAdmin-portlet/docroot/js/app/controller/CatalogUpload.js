Ext.define('EetdbAdmin.controller.CatalogUpload', {
    extend: 'Ext.app.Controller',
    
    stores: ['UploadQueue', 'UploadItem', 'UploadErrors'],
    models: ['UploadItem', 'UploadError'],
    views: ['catalogUpload.UploadQueue'
        , 'catalogUpload.UploadItem'
        , 'catalogUpload.UploadCatalog'],
    
    refs: [
        {ref: 'uploadQueue',selector: 'uploadQueue'}, 
        {ref: 'uploadItemView',selector: 'uploaditem'}, 
        {ref: 'uploadQueueDataView',selector: 'uploadQueue dataview'}, 
        {ref: 'uploadDetailsPanel',selector: 'uploaditem #uploaddetails'}, 
        {ref: 'uploadErrorsGrid',selector: 'uploaditem dataview'}, 
        {
            ref: 'uploadCatalogWindow',
            selector: 'uploadcatalog',
            autoCreate: true,
            xtype: 'uploadcatalog'
        }
        , 
    ],
    
    init: function() {
        
        this.control({
            'uploadQueue dataview': {
                selectionchange: this.loadItem
            },
            '#uploadQueueTab': {
                show: this.showDetails
            }
            ,'*': {
                cataloguploaded: this.onCatalogUploaded
            }
        });
        
        this.application.on(
        {
            uploadCatalog: this.showCatalogUpload,
            scope: this
        });
    
    },
    
    showDetails: function() 
    {
        var uploadItemView = this.getUploadItemView();
        uploadItemView.show();
        uploadItemView.enable();
    },
    
    showCatalogUpload: function() 
    {
        var popup = this.getUploadCatalogWindow();
        
        popup.show();
    
    },
    
    onCatalogUploaded: function()
    {
        var popup = this.getUploadCatalogWindow();
        
        popup.hide();
    },
    
    onLaunch: function() {
        
        var queueDataview = this.getUploadQueueDataView();
        var queueStore = this.getUploadQueueStore();
        
        queueDataview.bindStore(queueStore);
        
        var errorsGrid = this.getUploadErrorsGrid();
        var errorsStore = this.getUploadErrorsStore();
        errorsGrid.bindStore(errorsStore);
    
    },
    
    loadItem: function(selModel, selected) 
    {
        var store = this.getUploadItemStore(), 
        eItem = this.getUploadDetailsPanel(), 
        selectedUploadItem = selected[0];
        
        if (typeof selectedUploadItem === 'undefined') 
        {
            this.application.fireEvent('uploadItemUnselected');
            return;
        }
        
        if (!selectedUploadItem.phantom 
        && !selectedUploadItem.dirty) 
        {
            
            this.loadUploadItemDetails(selectedUploadItem);
            this.loadUploadErrors(selectedUploadItem);
            
            return;
        }
        eItem.update(selectedUploadItem);
        store.loadRecords([selectedUploadItem]);
        this.application.fireEvent('uploadItemSelected');
    
    }
    
    ,loadUploadItemDetails: function(uploadItem) 
    {
        
        var eItem = this.getUploadDetailsPanel(), 
        store = this.getUploadItemStore();
        eItem.setLoading({
            msg: 'Loading upload details...'
        });
        
        store.load({
            params: {
                action: 'getUploadItemDetails',
                uploadItemId: uploadItem.get('id')
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
                
                eItem.update(uploadItem);
            
            },
            scope: this
        });
    
    }
    ,loadUploadErrors: function(uploadItem) 
    {
        
        var errorsStore = this.getUploadErrorsStore();
        
        errorsStore.load({
            params: {
                action: 'getUploadItemErrors',
                uploadItemId: uploadItem.get('id')
            }
        });
    
    }

});
