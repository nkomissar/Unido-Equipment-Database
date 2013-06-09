Ext.define('EetdbAdmin.model.Muploadpanel', {
    extend: 'Ext.data.Model',
    requires: 'Ext.tip.*',
    fields: [
			 {name:'id', type:'text', system:true}
			,{name:'sortId', type:'text', system:true}
			,{name:'shortName', type:'text', system:true}
			,{name:'fileSize', type:'text', system:true}
			,{name:'fileCls', type:'text', system:true}
			,{name:'inputEl', system:true}
			,{name:'form', system:true}
			,{name:'state', type:'string', system:true}
			,{name:'error', type:'text', system:true}
			,{name:'progressId', type:'int', system:true}
			,{name:'bytesTotal', type:'string', system:true}
			,{name:'bytesUploaded', type:'string', system:true}
			,{name:'filesUploaded', type:'int', system:true}
			,{name:'pctComplete', type:'string', system:true}
			,{name:'speedNow', type:'string', system:true}
			,{name:'timeLeft', type:'string', system:true}
    ]
});