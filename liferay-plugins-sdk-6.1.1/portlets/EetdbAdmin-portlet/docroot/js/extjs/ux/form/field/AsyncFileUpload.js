Ext.define('Ext.ux.form.field.AsyncFileUpload', {
    extend:'Ext.panel.Panel',
    mixins: {
        labelable: 'Ext.form.Labelable',
        field: 'Ext.form.field.Field'
    },
    alias: ['widget.asyncfileupload'],
    requires: [ 'Ext.data.Store']
    
    , initComponent: function()
    {
    	
       
        Ext.define('UploadItem', {
            extend: 'Ext.data.Model',
            fields: [
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
            ]
        });
        
        this.store = Ext.create('Ext.data.Store', 
        {
           model: 'UploadItem',
           data:
        	   [{id: '1', shortName:2, fileName: 3, filePath: 4, fileCls: 5, input: 6, form: 7, state: 8, error: 9, progressId: 10, bytesTotal: 11, bytesUploaded: 12, estSec: 13, filesUploaded: 14, 
        	   speedAverage: 15, speedLast: 16, timeLast: 17, timeStart: 18, pctComplete: 19}]
        });
        
        
        
    	debugger;
        Ext.apply(this, {
            items:[{
                     xtype:'dataview'
                    ,itemSelector:'div.ux-up-item'
                    ,store:this.store
                    //,selectedClass:this.selectedClass
                    ,singleSelect:true
                   // ,emptyText:this.emptyText
                    ,tpl: new Ext.XTemplate(
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
                    //,listeners:{click:{scope:this, fn:this.onViewClick}}

            }]
    });
    }

});