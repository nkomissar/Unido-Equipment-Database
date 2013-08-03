Ext.define('MyApp.view.uploader.Uploadpanel', {
    extend: 'Ext.panel.Panel'
    ,alias: ['widget.uploadpanel']
    ,id: 'MyUploadpanel'
    ,uploadUrl: 'upload.asp'
    ,singleUpload: false
    ,concurrentUpload: false
    ,enableProgress: true
    ,maxFileSize: 1048576
    ,rootPath: 'upload'
    ,progressIdName: 'UPLOAD_IDENTIFIER'
    ,progressInterval: 1500
    ,progressUrl: 'progress.asp'
    ,addIconCls: 'icon-plus'
    ,bodyStyle: 'padding:2px'
    ,emptyText: 'No files'
    ,removeAllIconCls: 'icon-cross'
    ,removeAllText: 'Remove All'
    ,removeIconCls: 'icon-minus'
    ,removeText: 'Remove'
    ,selectedItemCls: 'ux-up-item-selected'
    ,stopAllText: 'Stop All'
    ,stopIconCls: 'icon-stop'
    ,uploadText: 'Upload'
    ,uploadIconCls: 'icon-upload'
    ,workingIconCls: 'icon-working'
    ,jsonErrorText: 'Cannot decode JSON object'
    ,unknownErrorText: 'Unknown error'
    ,progressMap: {
        progress_id: 'progressId'
        ,bytes_total: 'bytesTotal'
        ,bytes_uploaded: 'bytesUploaded'
        ,files_uploaded: 'filesUploaded'
        ,speed_now: 'speedNow'
        ,time_left: 'timeLeft'
        ,pct_complete: 'pctComplete'
    }
    ,layout: {
        type: 'vbox',
        align: 'stretch',
        padding: 3
    }
    ,constructor: function(config) {
        var addCfg = {
            xtype: 'filefield'
            ,id: 'addbtn'
            ,itemId: 'addbtn'
            ,buttonOnly: true
            ,hideLabel: true
            ,buttonText: 'Add..'
            ,buttonConfig: {iconCls: this.addIconCls}
            ,scope: this
        };
        
        var upCfg = {
            xtype: 'button'
            ,id: 'upbtn'
            ,iconCls: this.uploadIconCls
            ,text: this.uploadText
            ,scope: this
            ,disabled: true
        };
        
        var removeAllCfg = {
            xtype: 'button'
            ,id: 'removeallbtn'
            ,iconCls: this.removeAllIconCls
            ,text: this.removeAllText
            ,scope: this
            ,disabled: true
        };
        
        this.fbar = [addCfg, '->', upCfg, removeAllCfg];
        
        Ext.apply(this, {
            items: [{
                    xtype: 'progressbar'
                    ,itemId: 'pb'
                    ,hidden: true
                }, {
                    xtype: 'splitter'
                }, {
                    xtype: 'dataview'
                    ,itemId: 'view'
                    ,itemSelector: 'div.ux-up-item'
                    ,store: 'Suploadpanel'
                    ,selectedClass: this.selectedClass
                    ,singleSelect: true
                    ,emptyText: this.emptyText
                    ,tpl: this.tpl || new Ext.XTemplate(
                    '<div id=pbinfo style="display:none;padding-bottom:7px"></div>' 
                    + '<tpl for=".">' 
                    + '<div class="ux-up-item">' 
                    + '<div class="ux-up-icon-file {fileCls}">&#160;</div>' 
                    + '<div class="ux-up-text x-unselectable truncate" >{shortName}</div>' 
                    + '<div id="remove-{[values.inputEl.id]}" class="ux-up-icon-state ux-up-icon-{state}"' 
                    + 'data-qtip="{[this.scope.getQtip(values)]}">&#160;</div>' 
                    + '</div>' 
                    + '</tpl>'
                    , {scope: this}
                    )
                }]
        });
        this.callParent(arguments);
    }
    
    ,onRender: function() {
        this.callParent(arguments);
        if (this.singleUpload) {
            Ext.override(Ext.form.field.File, {
                createFileInput: function() {
                    var me = this;
                    me.fileInputEl = me.button.el.createChild({
                        name: me.getName(),
                        cls: Ext.baseCSSPrefix + 'form-file-input',
                        multiple: 'multiple',
                        tag: 'input',
                        type: 'file',
                        size: 1
                    }).on('change', me.onFileChange, me);
                }
            });
        }
    }
    
    ,getQtip: function(values) {
        var qtip = '';
        switch (values.state) {
            case 'queued':
                qtip = 'Size: <b>' + values.fileSize + '</b>';
                qtip += '<br>Queued for upload';
                if (!this.singleUpload) {
                    qtip += '<br>Click to remove';
                }
                break;
            
            case 'uploading':
                if (!this.singleUpload) {
                    qtip = 'Uploading...';
                    qtip += '<br>' + values.timeLeft + ' remaining -- at ' + values.speedNow + '/sec)';
                    qtip += '<br>' + values.bytesUploaded + ' of ' + values.bytesTotal + ' (' + values.pctComplete + '% done)';
                    qtip += '<br>Click to stop';
                } else {
                    qtip = 'Size: <b>' + values.fileSize + '</b>';
                    qtip += '<br>Uploading..';
                }
                break;
            
            case 'done':
                qtip = 'Size: <b>' + values.fileSize + '</b>';
                qtip += '<br>Successfully uploaded';
                if (!this.singleUpload) {
                    qtip += '<br>Click to remove';
                }
                break;
            
            case 'failed':
                qtip = 'Size: <b>' + values.fileSize + '</b>';
                qtip += '<br>Failed to upload';
                qtip += '<br>Error:' + values.error;
                if (!this.singleUpload) {
                    qtip += '<br>Click to remove';
                }
                break;
            
            case 'stopped':
                qtip = 'Size: <b>' + values.fileSize + '</b>';
                qtip += '<br>Stopped by user';
                if (!this.singleUpload) {
                    qtip += '<br>Click to remove';
                }
                break;
        }
        return qtip;
    }

});

