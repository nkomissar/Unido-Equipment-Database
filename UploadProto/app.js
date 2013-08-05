Ext.Loader.setConfig({ enabled: true });
Ext.Loader.setPath('MyApp', 'app');

Ext.require([
    'Ext.window.MessageBox',
    'Ext.state.CookieProvider',
    'Ext.form.field.File'
]);


    	
Ext.application({
	id:'MyApp',
  name: 'MyApp',
  appFolder: 'app',
  controllers: ['Cuploadpanel','Cfiletree'],
  models: ['Muploadpanel', 'Mfiletree'],
  stores: ['Suploadpanel', 'Sfiletree'],
	//autoCreateViewport: true,
	launch: function() {  
			 Ext.override(Ext.data.TreeStore, {
			load: function(options) {
  			options = options || {};
        options.params = options.params || {};
        var me = this,
            node = options.node || me.tree.getRootNode(),
            root;
        if (!node) {
            node = me.setRootNode({
                expanded: true
            });
        }
        if (me.clearOnLoad) {
            node.removeAll(true);  
        }else{
        		node.removeAll(false);
        }
        Ext.applyIf(options, {
            node: node
        });
        options.params[me.nodeParam] = node ? node.getId() : 'root';
        if (node) {
            node.set('loading', true);
        }
        return me.callParent([options]);
        this.callOverridden();
    	}
		});
		
		Ext.override(Ext.form.field.File, {   
			reset : function(){
        var me = this;
        if (me.rendered) {
            //me.fileInputEl.remove();   
            me.createFileInput();
            me.inputEl.dom.value = '';
        }
        me.callParent();
   		}
		});
		
	Ext.override(Ext.data.Connection, {
    upload: function(form, url, params, options) {
        form = Ext.getDom(form);
        options = options || {};

        var id = Ext.id(),
                frame = document.createElement('iframe'),
                hiddens = [],
                encoding = 'multipart/form-data',
                buf = {
                    target: form.target,
                    method: form.method,
                    encoding: form.encoding,
                    enctype: form.enctype,
                    action: form.action
                }, hiddenItem;


        Ext.fly(frame).set({
            id: id,
            name: id,
            cls: Ext.baseCSSPrefix + 'hide-display',
            src: Ext.SSL_SECURE_URL
        });

        document.body.appendChild(frame);

        if (document.frames) {
           document.frames[id].name = id;
        }

        Ext.fly(form).set({
            target: id,
            method: 'POST',
            enctype: encoding,
            encoding: encoding,
            action: url || buf.action
        });

        if (params) {
            Ext.iterate(Ext.Object.fromQueryString(params), function(name, value){
                hiddenItem = document.createElement('input');
                Ext.fly(hiddenItem).set({
                    type: 'hidden',
                    value: value,
                    name: name
                });
                form.appendChild(hiddenItem);
                hiddens.push(hiddenItem);
            });
        }

        Ext.fly(frame).on('load', Ext.Function.bind(this.onUploadComplete, this, [frame, options]), null, {single: true});
        form.submit();

       // Ext.fly(form).set(buf);   
        Ext.each(hiddens, function(h) {
            Ext.removeNode(h);
        });
    }
});

		Ext.state.Manager.setProvider(new Ext.state.CookieProvider);
    Ext.BLANK_IMAGE_URL = '/extjs/resources/themes/images/default/tree/s.gif';
		Ext.tip.QuickTipManager.init();
		
		Ext.create('MyApp.view.filetree.Filetreepanel', {
      renderTo: 'filetree-div',
      init: function() {} 	
    });   
    
	var uploaderWin = new Ext.Window({
    width:350
		,minWidth:350
    ,id:'MyUploaderwindow'
    ,height:200
		,minHeight:200
		,stateful:true
    ,layout:'fit'
    ,border:false
    ,closable:true
    ,closeAction:'hide'
    ,title:'Upload Panel'
		,iconCls:'icon-ups-png'
		,items:[{xtype:'uploadpanel'}]
    });
    uploaderWin.show();
    
    
    
    
    
    
  }
});




