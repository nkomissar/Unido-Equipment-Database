Ext.define('EetdbAdmin.model.UploadError', 
{
    extend: 'Ext.data.Model',
    fields: [
			 {name:'id', type:'int'}
			,{name:'rowNumber', type:'int'}
			,{name:'message', type:'string'}
    ]
});