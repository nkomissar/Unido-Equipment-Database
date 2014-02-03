Ext.define('EetdbAdmin.model.UploadItem', {
    extend: 'Ext.data.Model',
    fields: [
			 {name:'id', type:'int'}
			//,{name:'sortId', type:'text', system:true}
			,{name:'fileName', type:'string'}
			,{name:'fileSize', type:'int'}
			,{name:'fileCls', type:'string'}
			//,{name:'inputEl', system:true}
			//,{name:'form', system:true}
			,{name:'status', type:'string'}
			//,{name:'error', type:'text', system:true}
			//,{name:'progressId', type:'int', system:true}
			//,{name:'bytesTotal', type:'string', system:true}
			//,{name:'bytesUploaded', type:'string', system:true}
			//,{name:'filesUploaded', type:'int', system:true}
			,{name:'pctComplete', type:'int'}
			//,{name:'speedNow', type:'string', system:true}
			//,{name:'timeLeft', type:'string', system:true}
    ]
}); 