Ext.define('MyApp.controller.Cuploadpanel', {
    extend: 'Ext.app.Controller',
    views: ['uploader.Uploadpanel', 'filetree.Filetreepanel'],
    stores: ['Suploadpanel', 'Sfiletree'],
    models: ['Muploadpanel', 'Mfiletree'],
    refs: [
        {ref: 'filetree',selector: 'filetreepanel'}, 
        {ref: 'uploadpanel',selector: 'uploadpanel'}, 
        {ref: 'uploadBtn',selector: 'uploadpanel>toolbar [id="upbtn"]'}, 
        {ref: 'addBtn',selector: 'uploadpanel>toolbar [id="addbtn"]'}, 
        {ref: 'removeAllBtn',selector: 'uploadpanel>toolbar [id="removeallbtn"]'}
    ]
    ,init: function() {
        this.uploadStore = this.getSuploadpanelStore();
        this.filetreeStore = this.getSfiletreeStore();
        this.control({
            'uploadpanel>toolbar [id="addbtn"]': {change: this.onAddFile},
            'uploadpanel>toolbar [id="removeallbtn"]': {click: this.onRemoveAllClick},
            'uploadpanel>toolbar [id="upbtn"]': {click: this.onUpload},
            'uploadpanel dataview': {
                afterrender: function(view) {
                    this.uploadpanelView = view;
                    this.pb = this.getUploadpanel().getComponent('pb');
                    this.singleUpload = this.getUploadpanel().singleUpload;
                    this.concurrentUpload = this.getUploadpanel().concurrentUpload;
                },
                itemclick: this.onViewClick,
                resize: this.onResize,
                scope: this
            }
        });
    }
    
    ,onResize: function() {
        this.truncate();
    }
    ,truncate: function() {
        truncateEl = Ext.select('.truncate');
        width = this.uploadpanelView.getWidth();
        truncateEl.applyStyles({'width': width - 50 + 'px'})
    }
    
    ,onViewClick: function(view, record, html, index, e) {
        if (!this.singleUpload) {
            var t = e.getTarget('div:any(.ux-up-icon-queued|.ux-up-icon-failed|.ux-up-icon-done|.ux-up-icon-stopped)');
            if (t) {
                this.onRemoveFile(view, record, html, index, e);
            }
        }
        if (!this.singleUpload) {
            var t = e.getTarget('div.ux-up-icon-uploading');
            if (t) {
                this.stopUpload(record);
            }
        }
        this.truncate();
    }
    
    ,onRemoveFile: function(view, record, html, index, e) {
        this.uploadStore.remove(record);
        var count = this.uploadStore.getCount();
        this.getUploadBtn().setDisabled(!count);
        this.getRemoveAllBtn().setDisabled(!count);
    }
    
    ,onRemoveAllClick: function(btn) {
        if (true === this.uploading) {
            this.stopAll();
        } else {
            this.removeAll();
        }
    }
    
    ,removeAll: function() {
        this.uploadStore.removeAll();
        this.getUploadBtn().setDisabled(true);
        this.getRemoveAllBtn().setDisabled(true);
    }
    
    ,onAddFile: function(me) {
        inputEl = me.fileInputEl;
        inputEl.addCls('x-hidden');
        input = me.fileInputEl.dom;
        files = me.fileInputEl.dom.files;
        
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
        if (!this.uploading) {
            this.getUploadBtn().enable(true);
            this.getRemoveAllBtn().enable(true);
        }
        this.truncate();
    }
    
    ,updateButtons: function() {
        if (true === this.uploading) {
            if (this.concurrentUpload || this.singleUpload) {
                this.getAddBtn().disable();
            }
            this.getUploadBtn().disable();
            this.getRemoveAllBtn().setIconCls(this.getUploadpanel().stopIconCls);
            this.getRemoveAllBtn().setText(this.getUploadpanel().stopAllText);
        } 
        else {
            var records = this.uploadStore.queryBy(function(r) {
                return 'done' !== r.get('state')
            });
            if (records.getCount()) {
                this.getUploadBtn().enable();
            }
            
            this.getAddBtn().enable();
            this.getRemoveAllBtn().setIconCls(this.getUploadpanel().removeAllIconCls);
            this.getRemoveAllBtn().setText(this.getUploadpanel().removeAllText);
        }
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
    ,getFileExtension: function(name) {
        var atmp = name.split('.');
        if (1 === atmp.length) {
            return 'file'
        } 
        else {
            return '.' + atmp.pop().toLowerCase();
        }
    }
    
    ,filetreeReload: function() {
        this.filetreeStore.load({
            url: 'get.asp',
            node: this.record,
            recursive: false,
            scope: this,
            callback: function(records, operation, success) {
                if (success) {
                    this.record.expand()
                }
            }
        });
    }
    
    ,onProgress: function(obj) {
        var bytesTotal, bytesUploaded, pctComplete, state, idx, item, width, pgWidth;
        if (this.singleUpload) {
            if (this.pbValue != 1) {
                this.pbValue = parseInt(obj.pct_complete) / 100;
                this.pbText = obj.pct_complete;
                
                pbupdate = '<font size=1>uploaded: ' + obj.bytes_uploaded + ' of ' + obj.bytes_total + '&nbsp;&nbsp;&nbsp;&nbsp;';
                pbupdate += 'speed: ' + obj.speed_now + '/sec&nbsp;&nbsp;&nbsp;&nbsp;';
                pbupdate += 'time left: ' + obj.time_left + '</font>';
                
                this.pbinfo.dom.innerHTML = pbupdate;
                this.pb.updateProgress(this.pbValue, this.pbText, true);
            }
        } else {
            record = obj;
            state = record.get('state');
            bytesTotal = record.get('bytesTotal') || 1;
            bytesUploaded = record.get('bytesUploaded') || 0;
            if ('uploading' === state) {
                pctComplete = parseInt(record.get('pctComplete'), 10);
                timeLeft = record.get('timeLeft');
                speedNow = record.get('speedNow');
            } 
            else if ('done' === state) {
                pctComplete = 100;
            } 
            else {
                pctComplete = 0;
            }
            record.set('pctComplete', pctComplete);
            this.truncate();
            if ('uploading' === state) 
            {
                idx = this.uploadStore.indexOf(record);
                item = Ext.get(this.uploadpanelView.getNode(idx));
                if (item) 
                {
                    width = item.getWidth();
                    if (pctComplete != '') 
                    {
                        item.applyStyles({'background-position': width * pctComplete / 100 + 'px'})
                        item.applyStyles({'background-color': '#AAC7EC'})
                    }
                }
            }
        }
        this.truncate();
    }
    
    ,onUpload: function() {
        selModel = this.getFiletree().getSelectionModel();
        record = selModel.getLastSelected();
        if (record) {
            if (record.isLeaf()) {
                this.path = record.parentNode.get('id');
            } else {
                this.path = record.get('id');
            }
        } else {
            this.path = this.getUploadpanel().rootPath;
            record = this.getFiletree().getRootNode();
            this.getFiletree().view.select(record, false, true);
        }
        
        if (!record.isLeaf() || record.isRoot()) {
            this.record = record
        } else {
            this.record = record.parentNode;
        }
        
        this.truncate();
        
        var records = this.uploadStore.queryBy(function(r) {
            return 'done' !== r.get('state')
        });
        if (!records.getCount()) {
            return;
        } else {
            this.beforeallstart()
        }

        //this.singleUpload=this.getUploadpanel().singleUpload;
        //this.concurrentUpload=this.getUploadpanel().concurrentUpload;
        
        if (this.singleUpload) {
            this.uploadSingle();
        } else if (this.concurrentUpload) {
            records.each(function(r) {
                this.uploadFile(r)
            }, this);
        } else {
            records.each(function(r) {
                r.set('state', 'queued')
            }, this);
            this.uploadFile(records.items[0]);
        }
        
        if (true === this.getUploadpanel().enableProgress) {
            this.startProgress();
        }
    }
    
    ,uploadFile: function(record, params) {
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
    
    ,uploadSingle: function() {
        var records = this.uploadStore.queryBy(function(r) {
            return 'done' !== r.get('state');
        });
        if (!records.getCount()) {
            return;
        }
        
        var form = this.createForm();
        records.each(function(record) {
            if (!this.multiple) {
                var inputEl = record.get('inputEl');
                form.appendChild(inputEl.id);
            }
            record.set('state', 'uploading');
            this.truncate();
        }, this);
        
        if (this.multiple) {
            var inputEl = records.items[0].get('inputEl');
            form.appendChild(inputEl.id);
        }
        
        var o = this.getOptions();
        
        o.form = form;
        this.form = form;
        Ext.Ajax.request(o);
    }
    
    ,getOptions: function(record, params) {
        if (record) {
            progressId = record.get('progressId')
        } else {
            progressId = this.progressId
        }
        var path = this.path;
        var o = {
            url: this.getUploadpanel().uploadUrl + '?PID=' + progressId + '&path=' + path
            ,method: 'post'
            ,isUpload: true
            ,scope: this
            ,callback: this.uploadCallback
            ,record: record
            ,params: this.getParams(record, params)
        };
        return o;
    }
    
    ,getParams: function(record, params) {
        var p = {path: this.path};
        Ext.apply(p, params || {});
        return p;
    }
    
    ,createForm: function(record) {
        var progressId = parseInt(Math.random() * 1e10, 10);
        var form = Ext.getBody().createChild({
            tag: 'form'
            ,method: 'post'
            ,cls: 'hidden'
            ,id: Ext.id()
            ,cn: [{
                    tag: 'input'
                    ,type: 'hidden'
                    ,name: 'APC_UPLOAD_PROGRESS'
                    ,value: progressId
                }, {
                    tag: 'input'
                    ,type: 'hidden'
                    ,name: this.getUploadpanel().progressIdName
                    ,value: progressId
                }, {
                    tag: 'input'
                    ,type: 'hidden'
                    ,name: 'MAX_FILE_SIZE'
                    ,value: this.getUploadpanel().maxFileSize
                }]
        });
        if (record) {
            record.set('id', id);
            record.set('form', form);
            record.set('progressId', progressId);
        } 
        else {
            this.progressId = progressId;
        }
        return form;
    }
    ,deleteForm: function(form, record) {
        form.remove();
        if (record) {
            record.set('form', null);
        }
    }
    
    ,getIframe: function(record) {
        var iframe = null;
        var form = record.get('form');
        if (form && form.dom && form.dom.target) {
            iframe = Ext.get(form.dom.target);
        }
        return iframe;
    }
    
    ,requestProgress: function() {
        var records, p;
        var o = {
            url: this.getUploadpanel().progressUrl
            ,method: 'post'
            ,params: {}
            ,scope: this
            ,callback: function(options, success, response) {
                var o;
                if (true !== success) {
                    return;
                }
                try {
                    o = Ext.decode(response.responseText);
                } 
                catch (e) {
                    return;
                }
                if ('object' !== Ext.type(o) || true !== o.success) {
                    return;
                }
                
                if (this.singleUpload) {
                    if (o.bytes_uploaded == "!--=-->0") {
                    } else {
                        if (true !== this.eventsSuspended) {
                            this.onProgress(o);
                        }
                    }
                } else {
                    records = this.uploadStore.queryBy(function(r) {
                        return r.get('progressId') === o.progress_id
                    });
                    records.each(function(r) {
                        for (p in o) {
                            if (o.bytes_uploaded == "!--=-->0") {
                            } 
                            else {
                                if (this.getUploadpanel().progressMap[p] && r) {
                                    r.set(this.getUploadpanel().progressMap[p], o[p]);
                                }
                            }
                        }
                        if (r) {
                            r.commit();
                            if (true !== this.eventsSuspended) {
                                this.onProgress(r);
                            }
                        }
                    }, this);
                }
                var records = this.uploadStore.queryBy(function(r) {
                    return 'uploading' === r.get('state');
                });
                if (records.getCount()) {
                    this.progressTask.delay(this.getUploadpanel().progressInterval);
                }
            
            }
        };
        
        if (this.singleUpload) {
            o.params[this.getUploadpanel().progressIdName] = this.progressId;
            o.params.APC_UPLOAD_PROGRESS = this.progressId;
            var task = new Ext.util.DelayedTask(function() {
                Ext.Ajax.request(o);
            });
            task.delay(this.getUploadpanel().progressInterval);
        } else {
            records = this.uploadStore.queryBy(function(r) {
                return 'uploading' === r.get('state');
            });
            records.each(function(r) {
                o.params[this.getUploadpanel().progressIdName] = r.get('progressId');
                o.params.APC_UPLOAD_PROGRESS = o.params[this.getUploadpanel().progressIdName];
                o.record = r;
                Ext.Ajax.request(o);
            }, this);
        }
    }
    
    ,startProgress: function() {
        if (!this.progressTask) {
            this.progressTask = new Ext.util.DelayedTask(function() {
                this.requestProgress()
            }, this);
        }
        this.progressTask.delay(this.getUploadpanel().progressInterval / 2);
    }
    
    ,stopProgress: function() {
        if (this.progressTask) {
            this.progressTask.cancel();
        }
    }
    
    ,stopAll: function() {
        var iframe = false;
        var records = this.uploadStore.queryBy(function(r) {
            return 'uploading' === r.get('state');
        });
        if (!this.singleUpload) {
            records.each(function(record) {
                iframe = this.getIframe(record);
                this.stopIframe(iframe);
                record.set('state', 'stopped');
            }, this);
        } else {
            records.each(function(record) {
                record.set('state', 'stopped');
            }, this);
            iframe = Ext.fly(this.form.dom.target);
            this.stopIframe(iframe);
        }
        this.truncate();
        this.stopProgress();
        this.allstopped();
    }
    
    ,stopUpload: function(record) {
        var iframe = false;
        iframe = this.getIframe(record);
        this.stopIframe(iframe);
        record.set('state', 'stopped');
        this.fireStopEvents(record);
        this.truncate();
    }
    
    ,stopIframe: function(iframe) {
        if (iframe) {
            try {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    iframe.dom.contentWindow.document.execCommand('Stop');
                } else {
                    iframe.dom.contentWindow.stop();
                }
                Ext.defer(iframe.remove, 250)
            } 
            catch (e) {
            }
        }
    }
    
    ,uploadCallback: function(options, success, response) {
        var o;
        this.form = false;
        
        if (true === success) {
            try {
                o = Ext.decode(response.responseText);
            } 
            catch (e) {
                this.processFailure(options, response, this.getUploadpanel().jsonErrorText);
                return;
            }
            
            if (true === o.success) {
                this.processSuccess(options, response, o);
            } 
            else {
                this.processFailure(options, response, o);
            }
        } 
        else {
            this.processFailure(options, response);
        }
        this.fireFinishEvents(options);
    }
    
    ,processSuccess: function(options, response, o) {
        var record = false;
        if (this.singleUpload) {
            this.uploadStore.each(function(r) {
                r.set('state', 'done');
                r.set('error', '');
                r.commit();
            });
        } else {
            record = options.record;
            record.set('state', 'done');
            record.set('error', '');
            record.commit();
            this.truncate();
        }
        this.deleteForm(options.form, record);
        this.filetreeReload();
    }
    
    ,processFailure: function(options, response, error) {
        var record = options.record;
        var records;
        
        if (this.singleUpload) {
            records = this.uploadStore.queryBy(function(r) {
                var state = r.get('state');
                return 'done' !== state && 'uploading' !== state;
            });
            records.each(function(record) {
                var e = error.errors ? error.errors[record.id] : this.getUploadpanel().unknownErrorText;
                if (e) {
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
        } else {
            if (error && 'object' === Ext.type(error)) {
                record.set('error', error.errors && error.errors[record.id] ? error.errors[record.id] : this.getUploadpanel().unknownErrorText);
            } else if (error) {
                record.set('error', error);
            } else if (
            response && response.responseText) {
                record.set('error', response.responseText);
            } else {
                record.set('error', this.getUploadpanel().unknownErrorText);
            }
            record.set('state', 'failed');
            record.commit();
            this.truncate();
        }
    }
    
    ,fireFinishEvents: function() {
        if (!this.singleUpload && !this.concurrentUpload) {
            var records = this.uploadStore.queryBy(function(r) {
                return 'queued' === r.get('state')
            });
            if (records.getCount()) {
                this.uploadFile(records.items[0]);
            } else {
                this.allfinished();
            }
        }
        
        if (this.singleUpload || this.concurrentUpload) {
            var records = this.uploadStore.queryBy(function(r) {
                return 'uploading' === r.get('state');
            });
            if (!records.getCount()) {
                this.allfinished();
            }
        }
    }
    
    ,fireStopEvents: function() {
        if (!this.singleUpload && !this.concurrentUpload) {
            var records = this.uploadStore.queryBy(function(r) {
                return 'queued' === r.get('state')
            });
            if (records.getCount()) {
                this.uploadFile(records.items[0]);
            } else {
                this.allstopped();
            }
        }
        
        if (this.singleUpload || this.concurrentUpload) {
            var records = this.uploadStore.queryBy(function(r) {
                return 'uploading' === r.get('state');
            });
            if (!records.getCount()) {
                this.allstopped();
            }
        }
    }
    
    ,beforeallstart: function() {
        this.uploading = true;
        this.updateButtons();
        if (this.singleUpload) {
            this.pbValue = 0;
            this.pbText = '0%';
            this.pb.show();
            this.pbinfo = Ext.get('pbinfo');
            this.pbinfo.setDisplayed('block');
        }
    }
    
    ,allstopped: function() {
        if (this.singleUpload) {
            var pbHide = new Ext.util.DelayedTask(function() {
                this.pb.updateProgress(0, '0%', false);
                this.pb.hide();
                this.pbinfo.setDisplayed('none');
            }, this);
            pbHide.delay(2000);
        }
        this.stopProgress();
        this.uploading = false;
        this.updateButtons();
        this.truncate();
    }
    
    ,allfinished: function() {
        if (this.singleUpload) {
            this.pbValue = 1;
            this.pb.updateProgress(1, '100%', false);
            var pbHide = new Ext.util.DelayedTask(function() {
                this.pb.updateProgress(0, '0%', false);
                this.pb.hide();
                this.pbinfo.setDisplayed('none');
            }, this);
            pbHide.delay(2000);
        }
        this.stopProgress();
        this.uploading = false;
        this.updateButtons();
        this.truncate();
    }
    
    ,progress: function() {
        this.onProgress
    }
});





