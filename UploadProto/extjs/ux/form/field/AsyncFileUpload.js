Ext.define('Ext.ux.form.field.AsyncFileUpload', {
    extend:'Ext.Component',
    mixins: {
        labelable: 'Ext.form.Labelable'
        , field: 'Ext.form.field.Field'
    },
    alias: ['widget.asyncfileupload'],
    requires: 
		[ 
			'Ext.data.Store'
			, 'Ext.view.View'
			, 'Ext.ux.layout.component.field.AsyncFileUpload'
		],
    
    fieldSubTpl: [
                    '<div class="bold">fieldSubTpl</div>',
                  {
                      disableFormats: true
                  }
              ]
    
	, componentLayout: 'asyncfileupload'
	
    , initComponent: function()
    {
    	
    	var me = this;
    	
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
					 ,{name:'inputEl', system:true}
					 ,{name:'fileSize', system:true}
            ]
        });
        
        this.uploadStore = Ext.create('Ext.data.Store', 
        {
           model: 'UploadItem'
           /*
		   ,data:
        	   [{id: '1', shortName:2, fileName: 3, filePath: 4, fileCls: 5, input: 6, form: 7, state: 8, error: 9, progressId: 10, bytesTotal: 11, bytesUploaded: 12, estSec: 13, filesUploaded: 14, 
        	   speedAverage: 15, speedLast: 16, timeLast: 17, timeStart: 18, pctComplete: 19},
			   {id: '2', shortName:22, fileName: 3, filePath: 4, fileCls: 5, input: 6, form: 7, state: 8, error: 9, progressId: 10, bytesTotal: 11, bytesUploaded: 12, estSec: 13, filesUploaded: 14, 
        	   speedAverage: 15, speedLast: 16, timeLast: 17, timeStart: 18, pctComplete: 19}]
			*/	
        });
        
        
        /*
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
    	
    	});*/

		me.callParent(arguments);
		me.createGrid(me);
		
		// Init mixins
		me.initLabelable();
		me.initField();
    }
    
    , getRefItems: function() {
        return [ this.toolbar ];
    },

    
    createGrid : function(editor)
    {
        var me = this, uploadItems, items = [],
        baseCSSPrefix = Ext.baseCSSPrefix, undef;
		
		function btn(id, toggle, handler){
            return {
                itemId : id,
                cls : baseCSSPrefix + 'btn-icon',
                iconCls: baseCSSPrefix + 'edit-'+id,
                enableToggle:toggle !== false,
                scope: editor,
                //handler:handler||editor.relayBtnCmd,
                clickEvent: 'mousedown',
				text: 'O',
                //tooltip: tipsEnabled ? editor.buttonTips[id] || undef : undef,
                //overflowText: editor.buttonTips[id].title || undef,
                tabIndex: -1
            };
        }
        
		var addCfg = {
			xtype: 'filefield'
			,id:'addbtn'
			,itemId:'addbtn'
			//,buttonOnly: true
			,hideLabel: true
			,buttonText: 'Add..'
			,buttonConfig: {iconCls: 'icon-plus'}
			,scope:editor
			,listeners: {
	                change: editor.onAddFile
	                //,element: 'el'
					,scope: editor
	            }
		};

			var upCfg = {
				xtype:'button'
				,id:'upbtn'
				,iconCls:'icon-upload'
				,text:'Upload'
				,scope:editor
			,handler: editor.onAddFile
				//,disabled:true
			};

			var removeAllCfg = {
				xtype:'button'
				,id:'removeallbtn'
				,iconCls:'icon-cross'
				,text:'Remove All'
				,scope:this
				//,disabled:true
			};

			items = [addCfg, '->', upCfg, removeAllCfg];
		
	        toolbar = Ext.widget('toolbar', {
	            id: me.id + '-toolbar',
	            ownerCt: me,
	            cls: Ext.baseCSSPrefix + 'html-editor-tb',
	            enableOverflow: true,
	            items: items,
	            ownerLayout: me.getComponentLayout()

	            // stop form submits
	            /*,listeners: {
	                click: function(e){
	                    e.preventDefault();
	                },
	                element: 'el'
	            }*/
	        });

	        me.toolbar = toolbar;
		
        uploadItems = Ext.widget('dataview', {
            id: me.id + '-dataview',
            ownerCt: me,
            cls: Ext.baseCSSPrefix + 'uploader-dv',
			height: 100,
			tpl: this.tpl || new Ext.XTemplate(
						'<div id=pbinfo style="display:none;padding-bottom:7px"></div>'
					+ '<tpl for=".">'
					+ '<div class="ux-up-item">'
						+ '<div class="ux-up-icon-file {fileCls}">&#160;</div>'
					+ '<div class="ux-up-text x-unselectable truncate" >{shortName}</div>'
					+ '<div id="remove-{[values.inputEl.id]}" class="ux-up-icon-state ux-up-icon-{state}"'
					+ 'data-qtip="{[this.scope.getQtip(values)]}">&#160;</div>'
					+ '</div>'
					+ '</tpl>', {scope:this}
				)
			,itemSelector:'div.ux-up-item'
			,emptyText: 'nofiles'
			,store: editor.uploadStore  
            //enableOverflow: true,
            //items: items,
            ,ownerLayout: me.getComponentLayout(),

        });

        me.uploadItems = uploadItems;        
    },
    
    finishRenderChildren: function () {
        this.callParent();
        this.uploadItems.finishRender();
		this.toolbar.finishRender();
    },

    // @private
    onRender: function() {
        var me = this;

        me.callParent(arguments);

        // The input element is interrogated by the layout to extract height when labelAlign is 'top'
        // It must be set, and then switched between the iframe and the textarea
        //me.inputEl = me.iframeEl;

        // Start polling for when the iframe document is ready to be manipulated
        /*me.monitorTask = Ext.TaskManager.start({
            run: me.checkDesignMode,
            scope: me,
            interval: 100
        });*/ 
    },

    initRenderTpl: function() {
        var me = this;
        if (!me.hasOwnProperty('renderTpl')) {
            me.renderTpl = me.getTpl('labelableRenderTpl');
        }
        return me.callParent();
    },

    initRenderData: function() {
        var me = this;
        
        me.beforeSubTpl = '<div id="' + me.id + '-wrapEl" class="async-file-uploader-wrap">' 
        	+ Ext.DomHelper.markup(me.uploadItems.getRenderTree())
			+ Ext.DomHelper.markup(me.toolbar.getRenderTree());
        
        //me.fieldSubTpl = Ext.DomHelper.markup(me.toolbar.getRenderTree());
        
        return Ext.applyIf(me.callParent(), me.getLabelableRenderData());
    },

    getSubTplData: function() {
        return {
            $comp       : this,
            cmpId       : this.id,
            id          : this.getInputId(),
            textareaCls : Ext.baseCSSPrefix + 'hidden',
            value       : this.value,
            iframeName  : Ext.id(),
            iframeSrc   : Ext.SSL_SECURE_URL,
            size        : 'height:100px;width:100%'
        };
    },

    getSubTplMarkup: function() {
        return this.getTpl('fieldSubTpl').apply(this.getSubTplData());
    },

    getToolbar : function(){
        return this.toolbar;
    },
    getUploadItems : function(){
        return this.uploadItems;
    },
    /*getRefItems: function() {
        return [ this.toolbar ];
    },*/	
    relayBtnCmd: function(btn) {
      //  this.relayCmd(btn.getItemId());
    }
    
	,onAddFile: function(addBtn) {
		debugger;
        inputEl = addBtn.fileInputEl;
        inputEl.addCls('x-hidden');
        input = addBtn.fileInputEl.dom;
        files = addBtn.fileInputEl.dom.files;
        
        Ext.each(files, function(file) {
			this.uploadStore.add([{
                    id: Ext.id(),
                    inputEl: input,
                    shortName: String(file.name.match(/[^\/\\]+$/)),
                    fileSize: Ext.util.Format.fileSize(file.size),
                    fileCls: this.getFileCls(file.name),
                    state: 'queued'
                }])
        }, this);
        /*if (!this.uploading) {
            this.getUploadBtn().enable(true);
            this.getRemoveAllBtn().enable(true);
        }*/
        this.truncate();
    }
	,
	truncate:function(){
		debugger;
		truncateEl = Ext.select('.truncate');
		width = this.getWidth();
		truncateEl.applyStyles({'width':width-50+'px'})
	}	
	,getFileCls: function(name) {
        var atmp = name.split('.');
        if (1 === atmp.length) {
            return 'file';
        } 
        else {
            return 'file-' + atmp.pop().toLowerCase();
        }
    }
    ,getQtip:function(values) 
	{
		return 'qtip';
	}
});