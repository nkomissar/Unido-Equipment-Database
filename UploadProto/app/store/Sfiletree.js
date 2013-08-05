Ext.define('MyApp.store.Sfiletree', {
    extend: 'Ext.data.TreeStore',
    model: 'MyApp.model.Mfiletree',
    autoLoad: true,
    clearOnLoad: false,
    
    proxy: {
        type: 'ajax',
				url: 'get.asp'
    },

    root: {
         text: '<span id="upload">root</span>',
         id: 'upload',
         sortid: 'upload',
         expanded: true
     },
     
     folderSort: true,
     sorters: [{
         property: 'sortId',
         direction: 'ASC'
     }]
});

 