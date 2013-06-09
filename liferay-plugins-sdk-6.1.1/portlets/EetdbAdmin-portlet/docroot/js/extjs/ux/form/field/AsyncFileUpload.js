Ext.define('Ext.ux.form.field.AsyncFileUpload', {
    extend:'Ext.form.field.Base',
    alias: ['widget.asyncfileupload'],
    requires: [ 'Ext.data.Store']
    
    , initComponent: function()
    {
    	
    	
        var fields = [
                      {name:'id', type:'text', system:true}
                     ,{name:'shortName', type:'text', system:true}
                     ,{name:'fileName', type:'text', system:true}
                     ,{name:'filePath', type:'text', system:true}
                     ,{name:'fileCls', type:'text', system:true}
                     ,{name:'input', system:true}
                     ,{name:'form', system:true}
                     ,{name:'state', type:'text', system:true}
                     ,{name:'error', type:'text', system:true}
                     ,{name:'progressId', type:'int', system:true}
                     ,{name:'bytesTotal', type:'int', system:true}
                     ,{name:'bytesUploaded', type:'int', system:true}
                     ,{name:'estSec', type:'int', system:true}
                     ,{name:'filesUploaded', type:'int', system:true}
                     ,{name:'speedAverage', type:'int', system:true}
                     ,{name:'speedLast', type:'int', system:true}
                     ,{name:'timeLast', type:'int', system:true}
                     ,{name:'timeStart', type:'int', system:true}
                     ,{name:'pctComplete', type:'int', system:true}
             ];
        
        this.store = Ext.create('Ext.data.Store', 
        {
            id:0
           ,fields:fields
           ,data:[]
        });        
    	debugger;
        Ext.apply(this, {
            items:[{
                     xtype:'dataview'
                    ,itemSelector:'div.ux-up-item'
                    ,store:this.store
                    ,selectedClass:this.selectedClass
                    ,singleSelect:true
                    ,emptyText:this.emptyText
                    ,tpl: this.tpl || new Ext.XTemplate(
                              '<tpl for=".">'
                            + '<div class="ux-up-item">'
//                          + '<div class="ux-up-indicator">&#160;</div>'
                            + '<div class="ux-up-icon-file {fileCls}">&#160;</div>'
                            + '<div class="ux-up-text x-unselectable" qtip="{fileName}">{shortName}</div>'
                            + '<div id="remove-{[values.input.id]}" class="ux-up-icon-state ux-up-icon-{state}"'
                            + 'qtip="{[this.scope.getQtip(values)]}">&#160;</div>'
                            + '</div>'
                            + '</tpl>'
                            , {scope:this}
                    )
                    ,listeners:{click:{scope:this, fn:this.onViewClick}}

            }]
    });
    }

});