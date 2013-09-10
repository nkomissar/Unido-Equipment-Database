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
			, 'Ext.ProgressBar'
			, 'Ext.resizer.Splitter'
			, 'Ext.ux.layout.component.field.AsyncFileUpload'
			, 'Ext.ux.form.field.AsyncFileUploadOverrides'
		],
    
    fieldSubTpl: [
                    '<div class="bold">fieldSubTpl</div>',
                  {
                      disableFormats: true
                  }
              ]
    
	, componentLayout: 'asyncfileupload'
	
	, uploadUrl: '/web/test/subpage?p_auth=mwEshkT0&p_p_id=EetdbAdmin_WAR_EetdbAdminportlet&p_p_lifecycle=1&p_p_state=exclusive&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_EetdbAdmin_WAR_EetdbAdminportlet_formAction=fileUpload'
	
	, progressUrl:  '/web/test/subpage?p_auth=mwEshkT0&p_p_id=EetdbAdmin_WAR_EetdbAdminportlet&p_p_state=exclusive&action=getProgress'
	, progressIdName: '_EetdbAdmin_WAR_EetdbAdminportlet_pid'
	
	, enableProgress: true
	, progressInterval: 1500
	, singleUpload: false
	, concurrentUpload: true
	
	,progressMap:{
		progress_id:'progressId'
		,bytes_total:'bytesTotal'
		,bytes_uploaded:'bytesUploaded'
		,files_uploaded:'filesUploaded'
		,speed_now:'speedNow'
		,time_left:'timeLeft'
		,pct_complete:'pctComplete'
	}
	
    , initComponent: function()
    {
    	
    	var me = this;
		
		Ext.tip.QuickTipManager.init();
    	
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
        });

		me.callParent(arguments);
		
		Ext.ux.form.field.AsyncFileUploadOverrides.loadOverrides();
		
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
		
		var addCfg = {
			xtype: 'filefield'
			//,id:'addbtn'
			//,itemId:'addbtn'
			,name:'fileData'
			,buttonOnly: true
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
				//,id:'upbtn'
				,iconCls:'icon-upload'
				,text:'Upload'
				,scope:editor
				,handler: editor.onUpload
				//,disabled:true
			};

			var removeAllCfg = {
				xtype:'button'
				//,id:'removeallbtn'
				,iconCls:'icon-cross'
				,text:'Remove All'
				,scope:this
				//,disabled:true
				,handler: editor.onRemoveAllClick
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
		
		var pb = Ext.widget('progressbar', 
		{
			id: me.id + '-progressbar',
			itemId: 'pb',
			hidden: true,
			ownerCt: me
			,ownerLayout: me.getComponentLayout()
		});
		me.pb = pb;
		
		/*var splitter =  Ext.widget('splitter', 
		{
			id: me.id + '-splitter',
			ownerCt: me
            ,ownerLayout: me.getComponentLayout()
		});
		me.splitter = splitter;*/
		
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
            ,ownerLayout: me.getComponentLayout()
			, listeners: 
			{
				itemclick: editor.onViewClick,
				resize: editor.truncate,
				afterrender: editor.onViewRender,
				scope: editor,
				
			}
        });

        me.uploadItems = uploadItems;        
    },
    
    finishRenderChildren: function () {
        this.callParent();
		this.pb.finishRender();
		//this.splitter.finishRender();
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
        	+ Ext.DomHelper.markup(me.pb.getRenderTree())
        	//+ Ext.DomHelper.markup(me.splitter.getRenderTree())
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

    ,onViewRender: function(view) {
    		//this.uploadpanelView=view; 
    	//this.pb=this.getComponent('pb');
				//this.singleUpload=this.getUploadpanel().singleUpload;
				//this.concurrentUpload=this.getUploadpanel().concurrentUpload;
      }
	
	,onViewClick:function(view, record, html, index,e) {
		if(!this.singleUpload){
			var t = e.getTarget('div:any(.ux-up-icon-queued|.ux-up-icon-failed|.ux-up-icon-done|.ux-up-icon-stopped)');
			if(t) {
				this.onRemoveFile(view,record,html,index,e);
			}
		}
		if(!this.singleUpload){
			var t = e.getTarget('div.ux-up-icon-uploading');
			if(t) {
				this.stopUpload(record);
			}
		}
		this.truncate();
	}

	,onProgress:function(obj){
		var bytesTotal, bytesUploaded, pctComplete, state, idx, item, width, pgWidth;
		
		if (this.singleUpload){
			if(this.pbValue!=1)
			{
				this.pbValue=parseInt(obj.pct_complete)/100;
				this.pbText=obj.pct_complete;
				
				pbupdate='<font size=1>uploaded: '+obj.bytes_uploaded+' of '+obj.bytes_total+ '&nbsp;&nbsp;&nbsp;&nbsp;';
				pbupdate +='speed: '+obj.speed_now+'/sec&nbsp;&nbsp;&nbsp;&nbsp;';
				pbupdate +='time left: '+obj.time_left+'</font>';
					
				this.pbinfo.dom.innerHTML=pbupdate;
				this.pb.updateProgress(this.pbValue,this.pbText,true);
			}
		}
		else
		{
			record=obj;
			state = record.get('state');
			bytesTotal = record.get('bytesTotal') || 1;
			bytesUploaded = record.get('bytesUploaded') || 0;
			
			if('uploading' === state) 
			{
				pctComplete = parseInt(record.get('pctComplete'),10);
				timeLeft=record.get('timeLeft');
				speedNow=record.get('speedNow');
			}
			else if('done' === state) 
			{
				pctComplete = 100;
			}
			else 
			{
				pctComplete = 0;
			}
			record.set('pctComplete', pctComplete);
			
			if('uploading' === state) 
			{
				idx = this.uploadStore.indexOf(record);
				item = Ext.get(this.uploadItems.getNode(idx));
				if(item) 
				{	
					width = item.getWidth();
					if(pctComplete!='')
					{
						item.applyStyles({'background-position':width * pctComplete / 100 + 'px'})
						item.applyStyles({'background-color':'#AAC7EC'})
					}
				}
			}
		}
		this.truncate();
	} 	
	
	,onUpload:function() {	
		
		var records = this.uploadStore
							.queryBy(
								function(r)
								{
									return 'done' !== r.get('state')
								});
								
		if(!records.getCount()) {
			return;
		}else{
			this.beforeallstart()
		}
		
		if(this.singleUpload){
			this.uploadSingle();
		}else if(this.concurrentUpload){
			records.each(function(r){this.uploadFile(r)}, this);
		}else{
			records.each(function(r){r.set('state', 'queued')}, this);
			this.uploadFile(records.items[0]);
		}
		
		if(true === this.enableProgress) {
			this.startProgress();
		}
	}
		
	,uploadFile:function(record,params) {
		var form = this.createForm(record);
		var inputEl = record.get('inputEl');
		form.appendChild(inputEl.id);

		var o = this.getOptions(record, params);
		o.form = form;

		record.set('state', 'uploading');
		record.set('pctComplete', 0);
		this.truncate();
		Ext.Ajax.request(o);
		Ext.Function.defer(this.getIframe, 100, this, [record]);
	} 

	,uploadSingle:function() {
		var records = this.uploadStore.queryBy(function(r){return 'done' !== r.get('state');});
		if(!records.getCount()){
			return;
		}

		var form = this.createForm();
		records.each(function(record) {
			if(!this.multiple){
				var inputEl = record.get('inputEl');
				form.appendChild(inputEl.id);
			}
				record.set('state', 'uploading');
				this.truncate();
		}, this);
		
		if(this.multiple){
			var inputEl = records.items[0].get('inputEl');
			form.appendChild(inputEl.id);
		}

		var o = this.getOptions();

		o.form = form;
		this.form = form;
		Ext.Ajax.request(o);
	} 
	
	,getOptions:function(record, params) {
		if(record){
			progressId=record.get('progressId')
		}else{
			progressId=this.progressId
		}
		var path = "myUpload";//this.path;	
		var o = {
			 //url:/*this.getUploadpanel().uploadUrl*/ '/uploadUrl'+'?PID='+progressId+'&path='+path
			url: this.uploadUrl + "&" + this.progressIdName + "=" + progressId
			,method:'post'
			,isUpload:true
			,scope:this
			,callback:this.uploadCallback
			,record:record
			,params:this.getParams(record, params)
		};
		return o;
	} 
	
	,getParams:function(record, params) {
		var p = {path:this.path};
		Ext.apply(p, params || {});
		return p;
	}	
	
	,createForm:function(record) {
		var progressId = parseInt(Math.random() * 1e10, 10);
		debugger;
		var form = Ext.getBody().createChild({
			 tag:'form'
			,method:'post'
			,cls:'hidden'
			,id:Ext.id()
		}); 
		if(record) {
			record.set('id', 'same-same'/*id*/ );
			record.set('form', form);
			record.set('progressId', progressId);
		}
		else {
			this.progressId = progressId;
		}
		return form;
	} 
	,deleteForm:function(form, record) {
		form.remove();
		if(record) {
			record.set('form', null);
		}
	} 
	
	,uploadCallback:function(options, success, response) {
		var o;
		this.form = false;

		if(true === success) {
			try 
			{
				o = Ext.decode(response.responseText);
			}
			catch(e) {
				this.processFailure(options, response, /*this.getUploadpanel().jsonErrorText*/ 'jsonErrorText');
				return;
			}

			if(true === o.success) {
				this.processSuccess(options, response, o);
			}
			else {
				this.processFailure(options, response, o);
			}
		}
		else 
		{
			this.processFailure(options, response);
		}
		
		this.fireFinishEvents(options);
		
	} 
	
	,processSuccess:function(options, response, o) {
		var record = false;
		if(this.singleUpload) {
			this.uploadStore.each(function(r) {
				r.set('state', 'done');
				r.set('error', '');
				r.commit();
			});
		}else{
			record = options.record;
			record.set('state', 'done');
			record.set('error', '');
			record.commit();		
			this.truncate();
			
		}
		this.deleteForm(options.form, record);
	} 
	
	, setValuePrivate: function(value)
	{
	
        var me = this,
            i, len, record,
            dataObj,
            matchedRecords = [],
            displayTplData = [],
            processedValue = [];
			
        // This method processes multi-values, so ensure value is an array.
        value = Ext.Array.from(value);
		
		if (!Ext.isDefined(me.value)) {
            me.value = null;
        }
		
		me.mixins.field.setValue.call(me, value);
	}
	
	,processFailure:function(options, response, error) {
		var record = options.record;
		var records;
		 
		if(this.singleUpload) 
		{
			records = this.uploadStore.queryBy(
				function(r)
				{
					var state = r.get('state');
					return 'done' !== state && 'uploading' !== state;
				});

			records.each(
				function(record) {
				var e = error.errors ? error.errors[record.id] : /*this.getUploadpanel().unknownErrorText*/'unknownErrorText';
				if(e) {
					record.set('state', 'failed');
					record.set('error', e);
					Ext.getBody().appendChild(record.get('inputEl'));
				} else {
					record.set('state', 'done');
					record.set('error', '');
				}
				
				record.commit();
				this.truncate();
				
				}, this);
     
			this.deleteForm(options.form);
		}
		else
		{
			if(error && 'object' === Ext.type(error)) {
				record.set('error', error.errors && error.errors[record.id] ? error.errors[record.id] : /*this.getUploadpanel().unknownErrorText*/ 'unknownErrorText');
			}else if(error) {
				record.set('error', error);
			}else if(
				response && response.responseText) {
				record.set('error', response.responseText);
			}else{
				record.set('error', this.getUploadpanel().unknownErrorText);
			}
			
			record.set('state', 'failed');
			record.commit();
			
			this.truncate();
		}
	}
	
	,fireFinishEvents:function() 
	{
		if(!this.singleUpload && !this.concurrentUpload){
			var records = this.uploadStore.queryBy(function(r){return 'queued' === r.get('state') });
			if(records.getCount()) {
				this.uploadFile(records.items[0]);
			}else{
				this.allfinished();
			}
		}

		if(this.singleUpload || this.concurrentUpload){
			var records = this.uploadStore.queryBy(function(r){return 'uploading' === r.get('state');});
			if(!records.getCount()){	
				this.allfinished();
			}
		}
	} 
			
	,beforeallstart:function() 
	{
		this.uploading = true;
		this.updateButtons();
		if(this.singleUpload){
			this.pbValue=0;
			this.pbText='0%';
			this.pb.show();
			this.pbinfo=Ext.get('pbinfo');
			this.pbinfo.setDisplayed('block');
		}
	}
	,allstopped:function()
	{
		if(this.singleUpload){
			var pbHide = new Ext.util.DelayedTask(function()
			{		
				this.pb.updateProgress(0,'0%',false);	
				this.pb.hide();
				this.pbinfo.setDisplayed('none');
			},this);				
		  pbHide.delay(2000); 						
		}
		this.stopProgress();
		this.uploading = false;
		this.updateButtons();
		this.truncate();
	}
		
	,allfinished:function()
	{
		if(this.singleUpload)
		{
			this.pbValue=1;
			this.pb.updateProgress(1,'100%',false);
			var pbHide = new Ext.util.DelayedTask(function(){		
				this.pb.updateProgress(0,'0%',false);	
				this.pb.hide();
				this.pbinfo.setDisplayed('none');
			},this);				
			pbHide.delay(2000);
		}
		
		this.stopProgress();
		this.uploading = false;
		this.updateButtons();
		this.truncate();
	}	
	
	,getIframe:function(record) 
	{
		var iframe = null;
		var form = record.get('form');
		if(form && form.dom && form.dom.target) 
		{
			iframe = Ext.get(form.dom.target);		
		}
		return iframe;
	} 	
	
	,requestProgress:function() 
	{
		var records, p;
		var o = {
			 url: this.progressUrl 
			,method:'get'
			,params:{}
			,scope:this
			,callback:this.requestProgressCallback 
		};
		
		if(this.singleUpload) 
		{
			o.params[this.progressIdName] = this.progressId;
			var task = new Ext.util.DelayedTask(function(){						
				Ext.Ajax.request(o);
			});
			task.delay(this.progressInterval);
		}
		else
		{
			records = 
				this
					.uploadStore
					.queryBy(
						function(r)
						{
							return 'uploading' === r.get('state');
						});
						
			records.each(
				function(r) 
				{				
					o.params[this.progressIdName] = r.get('progressId');
					o.record = r;						
					Ext.Ajax.request(o);
				}, this);
		}
	}
	
	,requestProgressCallback: function(options, success, response) 
	{
		var o;
		if(true !== success) {
			return;
		}
		
		try {
			o = Ext.decode(response.responseText);
		}
		catch(e) {
			return;
		}
		
		if('object' !== Ext.type(o) || true !== o.success) {
			return;
		}

		if (this.singleUpload)
		{	
			if (o.bytes_uploaded > 0 && 
				true !== this.eventsSuspended) 
			{
				this.onProgress(o);
			}
		}
		else
		{
			records = this.uploadStore.queryBy(
					function(r)
					{
						return r.get('progressId') === o.progress_id
					});
			
			records.each(
				function(r) 
				{
					if(!r)
					{
						return;
					}
					for(p in o) 
					{
						if(o.bytes_uploaded > 0 
							&& this.progressMap[p]) 
						{
							r.set(this.progressMap[p],o[p]);
						}
					}
					
					r.commit();
					if(true !== this.eventsSuspended) 
					{
						this.onProgress(r);
					}
					
				}, this);		
		}				

		var records = this
						.uploadStore
						.queryBy(
							function(r)
							{
								return 'uploading' === r.get('state');
							});
		
		if(records.getCount())
		{
			this.progressTask.delay(this.progressInterval);
		}
	}
	
	,startProgress:function() 
	{
		if(!this.progressTask) 
		{
			this.progressTask = 
				new Ext.util.DelayedTask(
					function()
					{
						this.requestProgress()
					},this);
		}
		
		this.progressTask.delay(this.progressInterval/2);    				
		
	} 
	
	,stopProgress:function() 
	{
		if(this.progressTask) 
		{
			  this.progressTask.cancel();
		}
	} 
	
	,onAddFile: function(addBtn) 
	{
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
		
		addBtn.extractFileInput();
		
        this.truncate();
    }
	,truncate:function(){
		truncateEl = Ext.select('.truncate');
		width = this.uploadItems.getWidth();
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
		var qtip = '';
		
		switch(values.state) 
		{
			case 'queued':
				qtip = 'Size: <b>'+values.fileSize+'</b>';
				qtip += '<br>Queued for upload';
				if(!this.singleUpload)
				{
					qtip += '<br>Click to remove';
				}
				break;

			case 'uploading':
				if(!this.singleUpload)
				{
					qtip = 'Uploading...';
					qtip += '<br>' + Ext.util.Format.elapsedTime(values.timeLeft) + ' remaining -- at ' + values.speedNow + ' bytes/sec)';
					qtip += '<br>' + values.bytesUploaded + ' Kb of '+values.bytesTotal+' Kb ('+values.pctComplete+'% done)';
					qtip += '<br>Click to stop';
				}
				else
				{
					qtip = 'Size: <b>'+values.fileSize+'</b>';
					qtip += '<br>Uploading..';
				}
				break;

			case 'done':
				qtip = 'Size: <b>'+values.fileSize+'</b>';
				qtip += '<br>Successfully uploaded';
				if(!this.singleUpload)
				{
					qtip += '<br>Click to remove';
				}
				break;

			case 'failed':
				qtip = 'Size: <b>'+values.fileSize+'</b>';
				qtip += '<br>Failed to upload';
				qtip += '<br>Error:' + values.error;
				if(!this.singleUpload)
				{
					qtip += '<br>Click to remove';
				}
				break;

			case 'stopped':
				qtip = 'Size: <b>'+values.fileSize+'</b>';
				qtip += '<br>Stopped by user';
				if(!this.singleUpload)
				{
					qtip += '<br>Click to remove';
				}
				break;
		}
		
		return qtip;
		
	}

	,onRemoveFile:function(view,record,html,index,e) {
		this.uploadStore.remove(record);
		var count = this.uploadStore.getCount();
		//this.getUploadBtn().setDisabled(!count);
		//this.getRemoveAllBtn().setDisabled(!count);
	}
	
	,onRemoveAllClick:function(btn) {
		if(true === this.uploading) {
			this.stopAll();
		}else{
			this.removeAll();
		}
	} 
	
	,removeAll:function() {
		this.uploadStore.removeAll();
		//this.getUploadBtn().setDisabled(true);
		//this.getRemoveAllBtn().setDisabled(true);
	} 
	
	,stopUpload:function(record) {	
		var iframe = false;
		iframe = this.getIframe(record);
		this.stopIframe(iframe);
		record.set('state', 'stopped');
		this.fireStopEvents(record);
		this.truncate();
	} 
	
	,stopIframe:function(iframe) {
		if(iframe) {
			try {
				if( navigator.appName == "Microsoft Internet Explorer" ){
					iframe.dom.contentWindow.document.execCommand('Stop');
				}else{
					iframe.dom.contentWindow.stop();
				}
				Ext.defer(iframe.remove,250)
			}
			catch(e){}
		}
	}
		
	,fireStopEvents:function() 
	{
		if(!this.singleUpload && !this.concurrentUpload)
		{
			var records = 
				this
					.uploadStore
					.queryBy(
						function(r)
						{
							return 'queued' === r.get('state') 
						});
						
			if(records.getCount()) 
			{
				this.uploadFile(records.items[0]);
			}
			else
			{
				this.allstopped();
			}
		}

		if(this.singleUpload || this.concurrentUpload){
			var records = 
				this
					.uploadStore
					.queryBy(
						function(r)
						{
							return 'uploading' === r.get('state');
						});
						
			if(!records.getCount())
			{	
				this.allstopped();
			}
		}
	} 
	
	,updateButtons:function()
	{
	
		if(true === this.uploading) {
			/*if(this.concurrentUpload || this.singleUpload){
				this.getAddBtn().disable();
			}
			this.getUploadBtn().disable();
			this.getRemoveAllBtn().setIconCls(this.getUploadpanel().stopIconCls);
			this.getRemoveAllBtn().setText(this.getUploadpanel().stopAllText);
			*/
		}
		else {
			var records = this.uploadStore.queryBy(function(r){return 'done' !== r.get('state') });
			if(records.getCount()) {
				//this.getUploadBtn().enable();
			}
			/*
			this.getAddBtn().enable();
			this.getRemoveAllBtn().setIconCls(this.getUploadpanel().removeAllIconCls);
			this.getRemoveAllBtn().setText(this.getUploadpanel().removeAllText);
			*/
		}	
	}
	
	 /**
     * Overridden to do nothing
     * @method
     */
    , setValue: Ext.emptyFn
	
});