Ext.define('MyApp.controller.Cfiletree', {
    extend: 'Ext.app.Controller'
    ,views: ['filetree.Filetreepanel']
    ,stores: ['Sfiletree']
    ,models: ['Mfiletree']
    ,fileCls: 'file'
    ,fileText: 'File'
    ,readOnly: false
    ,sortAfterRename: true
    ,init: function() {
        this.filetreeStore = this.getSfiletreeStore();
        this.control({
            'filetreepanel': {
                render: function(ft) {
                    this.filetree = ft;
                    Ext.get(ft.getEl()).on("contextmenu", Ext.emptyFn, null, {preventDefault: true});
                }
            },
            'filetreepanel dataview': {
                render: function(view) {
                    this.filetreeView = view; //this.filetree.view;	
                    view.setAutoScroll(false);
                    
                    new Ext.util.KeyMap(view.getEl(), 
                    [{
                            key: "e",
                            ctrl: true,
                            fn: function() {
                                var sm = view.getSelectionModel();
                                record = sm.getLastSelected();
                                if (record && !record.isLeaf()) {
                                    this.reloadNode(record)
                                }
                            },
                            defaultEventAction: 'stopEvent',
                            scope: this
                        }, {
                            key: "n",
                            ctrl: true,
                            fn: function() {
                                var sm = view.getSelectionModel();
                                record = sm.getLastSelected();
                                if (record && !record.isLeaf()) {
                                    record.expand(false, function() {
                                        this.create(record);
                                    }, this);
                                }
                            },
                            defaultEventAction: 'stopEvent',
                            scope: this
                        }]
                    );
                },
                itemkeydown: this.onKeyDown,
                beforedrop: this.onBeforeDrop,
                drop: this.onDrop,
                itemcontextmenu: this.showContextMenu,
                itemdblclick: function(view, record) {
                    this.downloadFile(record)
                },
                scope: this
            },
            'filetreepanel[id="MyFiletree"] > toolbar [text="Sort"]': {
                click: this.sortAll
            }
        });
    }
    
    ,onKeyDown: function(view, record, item, index, e, opts) {
        if (e.keyCode == 13) {
            if (record && 0 !== record.getDepth() && record.isLeaf()) {
                this.downloadFile(record);
            }
        }
        if (e.keyCode == 113) {
            e.preventDefault();
            if (record && 0 !== record.getDepth() && !this.readOnly && !record.isRoot() && !record.parentNode.get('disabled') && !record.get('disabled')) {
                nodeToEdit = Ext.DomQuery.selectNode('span[id="' + record.get('id') + '"]', item);
                this.edit(record, nodeToEdit)
            }
        }
        
        if (e.keyCode == 46) {
            e.preventDefault();
            if (record && 0 !== record.getDepth() && !this.readOnly && !record.isRoot() && !record.parentNode.get('disabled') && !record.get('disabled')) {
                this.deleteNode(record);
            }
        }
    }
    
    ,onBeforeDrop: function(node, data, model, pos, dropHandlers) {
        oldNodeId = data.records[0].get('id');
        oldParentId = data.records[0].get('parentId');
        oldFileName = oldNodeId.match(/[^\/\\]+$/);
        oldFileName = String(oldFileName);
        newParentId = model.get('id');
        if (newParentId != oldParentId) {
            var options = {
                node: node,
                data: data,
                model: model,
                pos: pos,
                dropHandlers: dropHandlers,
                url: 'rename.asp',
                method: 'post',
                scope: this,
                callback: this.cmdCallback,
                oldFileName: oldFileName,
                oldNodeId: oldNodeId,
                oldParentId: oldParentId,
                params: {
                    cmd: 'rename',
                    oldname: oldNodeId,
                    newname: newParentId + '/' + oldFileName
                }
            };
            if (!model.isLoaded()) {
                var store = this.filetree.view.getTreeStore();
                store.load({
                    url: 'get.asp',
                    node: model,
                    recursive: false,
                    callback: function(records, operation, success) {
                        model.expand();
                        var task = new Ext.util.DelayedTask(function() {
                            Ext.Ajax.request(options);
                        });
                        task.delay(500);
                    }
                });
            } else {
                if (!model.isExpanded()) {
                    model.expand();
                }
                Ext.Ajax.request(options)
            }
        }
        return false;
    }
    
    ,onDrop: function(node, data, model, pos) {
    //do nothing
    }
    
    ,deleteNode: function(record) {
        nodeId = record.get('id');
        fileName = record.get('id').match(/[^\/\\]+$/);
        fileName = String(fileName);
        
        Ext.MessageBox.confirm(
        'Confirm'
        , 'Are you sure you want to delete <b>' + fileName + '</b> ?'
        , function(response) {
            if ('yes' !== response) {
                return;
            }
            var options = {
                url: 'delete.asp',
                method: 'post',
                scope: this,
                record: record,
                callback: this.cmdCallback,
                params: {
                    cmd: 'delete',
                    node: nodeId
                }
            };
            Ext.Ajax.request(options);
        }, 
        this
        );
    }
    
    ,sortAll: function() {
        root = this.filetree.getRootNode();
        if (!root.isExpanded()) {
            root.expand();
        }
        dir = this.filetreeStore.sorters.items[1].direction;
        if (dir == 'ASC') {
            this.filetreeStore.sort('id', 'DESC');
        } else {
            this.filetreeStore.sort('id', 'ASC');
        }
        root.collapse();
        root.expand();
    }
    
    ,downloadFile: function(record) {
        path = record.get('id');
        var id = Ext.id();
        var frame = document.createElement('iframe');
        frame.id = id;
        frame.name = id;
        frame.className = 'x-hidden';
        if (Ext.isIE) {
            frame.src = Ext.SSL_SECURE_URL;
        }
        Ext.getBody().appendChild(frame);
        
        if (Ext.isIE) {
            document.frames[id].name = id;
        }
        
        var form = Ext.DomHelper.append(document.body, {
            tag: 'form'
            ,method: 'post'
            ,action: 'download.asp'
            ,target: id
        });
        
        Ext.getBody().appendChild(form);
        var hidden;
        hidden = document.createElement('input');
        hidden.type = 'hidden';
        hidden.name = 'cmd';
        hidden.value = 'download';
        form.appendChild(hidden);
        
        hidden = document.createElement('input');
        hidden.type = 'hidden';
        hidden.name = 'path';
        hidden.value = path;
        form.appendChild(hidden);
        
        var callback = function() {
            Ext.EventManager.removeListener(frame, 'load', callback, this);
            setTimeout(function() {
                document.body.removeChild(form);
            }, 100);
            setTimeout(function() {
                document.body.removeChild(frame);
            }, 110);
        };
        Ext.EventManager.on(frame, 'load', callback, this);
        form.submit();
    }
    
    ,reloadNode: function(record) {
        this.filetreeStore.load({
            url: 'get.asp',
            node: record,
            recursive: false,
            scope: this,
            callback: function(records, operation, success) {
                if (success) {
                    record.expand()
                }
            }
        });
    }
    
    ,edit: function(record, nodeToEdit) {
        parentId = record.parentNode.get('id');
        var cfg = {
            shadow: true,
            completeOnEnter: true,
            cancelOnEsc: true,
            updateEl: true,
            ignoreNoChange: true
        }, height = 18;
        
        var editor = Ext.create('Ext.Editor', Ext.apply({
            width: 200,
            height: height,
            offsets: [0, 0],
            alignment: 'l-l',
            options: {record: record},
            field: {
                name: 'nodeToEditField',
                allowBlank: false,
                xtype: 'textfield',
                width: 200,
                minWidth: 100,
                maxWidth: 300,
                selectOnFocus: true
            }
        }, cfg));
        
        editor.startEdit(nodeToEdit);
        editor.on('complete', this.onEditComplete, this, {
            single: true,
            delay: 100
        });
    }
    
    ,onEditComplete: function(me, newName, oldName) {
        var options = {
            url: 'rename.asp',
            method: 'post',
            scope: this,
            record: record,
            callback: this.cmdCallback,
            newName: newName,
            oldName: oldName,
            params: {
                cmd: 'rename',
                newfilename: newName,
                oldname: parentId + '/' + oldName,
                newname: parentId + '/' + newName
            }
        };
        Ext.Ajax.request(options);
    }
    
    ,create: function(record) {
        var newNodeId = record.get('id') + '/' + Ext.id();
        record.insertChild(0, {
            text: '<span id="' + newNodeId + '">New Folder</span>',
            id: newNodeId,
            iconCls: 'folder',
            disabled: false,
            leaf: false
        });
        
        var newRecord = this.filetreeStore.getNodeById(newNodeId);
        this.filetreeView.select(newRecord, false, true);
        var item = this.filetreeView.getSelectedNodes();
        var nodeToCreate = Ext.DomQuery.selectNode('span[id="' + newNodeId + '"]', item);
        parentId = newRecord.parentNode.get('id');
        
        var cfg = {
            shadow: true,
            completeOnEnter: true,
            cancelOnEsc: true,
            updateEl: true
        }, height = 18;
        
        var editor = Ext.create('Ext.Editor', Ext.apply({
            width: 200,
            height: height,
            offsets: [0, 0],
            alignment: 'l-l',
            options: {record: record},
            field: {
                name: 'nodeToCreateField',
                allowBlank: false,
                xtype: 'textfield',
                width: 200,
                minWidth: 100,
                maxWidth: 400,
                selectOnFocus: true
            }
        }, cfg));
        
        
        var task = new Ext.util.DelayedTask(function() {
            editor.startEdit(nodeToCreate);
        });
        task.delay(500);
        editor.on('complete', this.onCreateComplete, this, {single: true,delay: 100,newRecord: newRecord});
    }
    
    ,onCreateComplete: function(me, newDir, defaultNewDir, o) {
        var options = {
            url: 'newdir.asp',
            method: 'post',
            scope: this,
            newRecord: o.newRecord,
            callback: this.cmdCallback,
            newDir: newDir,
            params: {
                cmd: 'newdir',
                dir: parentId + '/' + newDir
            }
        };
        Ext.Ajax.request(options);
    }
    
    ,cmdCallback: function(options, success, response) {
        var i, o, node;
        var showMsg = true;
        if (true === success) {
            try {
                o = Ext.decode(response.responseText);
            } 
            catch (ex) {
                this.showError(response.responseText);
            }
            
            if (true === o.success) {
                switch (options.params.cmd) {
                    case 'rename':
                        if (!options.oldParentId) {
                            this.updateCls(options.record, options.newName);
                            newNameId = parentId + '/' + options.newName;
                            record = options.record;
                            record.set('id', newNameId);
                            record.set('sortId', options.newName.toLowerCase());
                            record.set('text', '<span id="' + newNameId + '">' + options.newName + '</span>');
                        } else {
                            options.dropHandlers();
                            record = options.data.records[0];
                            oldName = record.get('id');
                            oldParentId = record.get('parentId');
                            oldFileName = oldName.match(/[^\/\\]+$/);
                            oldFileName = String(oldFileName);
                            newParentId = options.model.get('id');
                            record.set('id', newParentId + '/' + oldFileName);
                            record.set('sortId', oldFileName.toLowerCase());
                            record.set('text', '<span id="' + newParentId + '/' + oldFileName + '">' + oldFileName + '</span>');
                        }
                        record.commit();
                        if (!record.isLeaf() && record.isLoaded() && record.hasChildNodes()) {
                            this.filetreeStore.load({
                                url: 'get.asp',
                                node: record,
                                recursive: false,
                                scope: this
                            });
                        }
                        if (this.sortAfterRename) {
                            this.filetreeStore.sort('id', this.filetreeStore.sorters.items[1].direction);
                            if (record.parentNode.isRoot()) {
                                record.parentNode.collapse();
                                record.parentNode.expand();
                            }
                        }
                        break;
                    
                    case 'delete':
                        options.record.remove();
                        this.filetree.view.select(this.filetree.getRootNode(), false, true);
                        break;
                    
                    case 'newdir':
                        record = options.newRecord;
                        record.set('id', options.params.dir);
                        record.set('sortId', options.newDir.toLowerCase());
                        record.set('text', '<span id="' + options.params.dir + '">' + options.newDir + '</span>');
                        record.commit();
                        break;
                }
            } else {
                switch (options.params.cmd) {
                    case 'rename':
                        if (options.oldParentId) {
                        //here drag & drop error repair						
                        } 
                        else {
                            oldNameId = parentId + '/' + options.oldName;
                            record.set('id', oldNameId);
                            record.set('sortId', options.oldName.toLowerCase());
                            record.set('text', '<span id="' + oldNameId + '">' + options.oldName + '</span>');
                            record.commit();
                        }
                        break;
                    
                    case 'newdir':
                        record = options.newRecord
                        record.remove();
                        break;
                    
                    case 'delete':
                        record = options.record;
                        this.reloadNode(record.parentNode)
                        break;
                    
                    case 'get':
                        //alert('');
                        break;
                    
                    default:
                        //default error handling
                        break;
                }
                this.showError(o.error || response.responseText);
            }
        } else {
            this.showError(response.responseText);
            switch (options.params.cmd) {
                case 'rename':
                    if (options.oldParentId) {
                    //here drag & drop error repair						
                    } 
                    else {
                        oldNameId = parentId + '/' + options.oldName;
                        record.set('id', oldNameId);
                        record.set('sortId', options.oldName.toLowerCase());
                        record.set('text', '<span id="' + oldNameId + '">' + options.oldName + '</span>');
                        record.commit();
                    }
                    break;
                
                case 'newdir':
                    record = options.newRecord
                    record.remove();
                    break;
            }
        }
    }
    
    ,updateCls: function(record, newName) {
        if (record.isLeaf()) {
            record.set('iconCls', this.getFileCls(newName))
        }
    }
    
    ,getFileCls: function(name) {
        var atmp = name.split('.');
        if (1 === atmp.length) {
            return this.fileCls;
        } 
        else {
            return this.fileCls + '-' + atmp.pop().toLowerCase();
        }
    }
    
    ,showError: function(msg, title) {
        Ext.Msg.show({
            title: 'Error'
            ,msg: Ext.util.Format.ellipsis(msg, this.maxMsgLen)
            ,icon: Ext.Msg.WARNING
            ,buttons: Ext.Msg.OK
            ,minWidth: 1200 > String(msg).length ? 360 : 600
        });
    }
    
    ,showContextMenu: function(view, record, item, index, e) {
        view.select(record, false, true);
        var nodeId = record.get('id');
        nodeName = nodeId.match(/[^\/\\]+$/);
        nodeName = String(nodeName);
        
        x = e.browserEvent.clientX;
        y = e.browserEvent.clientY;
        if (!menu) {
            var menu = Ext.create('MyApp.view.filetree.Filetreemenu');
        }
        menu.getComponent('nodename').setText(Ext.util.Format.ellipsis('<b>' + nodeName + '</b>', 22));
        if (record.isLeaf()) {
            nodeCls = this.getFileCls(nodeId);
            menu.getComponent('nodename').setIconCls(nodeCls);
        } else {
            menu.getComponent('nodename').setIconCls('x-tree-icon-parent');
        }
        
        menu.setItemDisabled('download', !record.isLeaf());
        menu.setItemDisabled('reload', record.isLeaf());
        menu.setItemDisabled('delete', record.isRoot() || record.get('disabled'));
        menu.setItemDisabled('rename', this.readOnly || record.isRoot() || (record.isLeaf() ? record.parentNode.get('disabled') : record.get('disabled')));
        menu.setItemDisabled('newdir', this.readOnly || record.isLeaf());
        menu.setItemDisabled('uploader', !Ext.getCmp('MyUploaderwindow').isHidden());
        menu.showAt([x, y]);
        menu.on({
            click: {
                scope: this,
                fn: this.onContextClick,
                record: record
            }
        });
    }
    
    ,onContextClick: function(menu, item, e, options) {
        if (item.disabled) {
            return;
        }
        record = options.record;
        
        switch (item.cmd) {
            case 'download':
                this.downloadFile(record);
                break;
            
            case 'reload':
                if (!record.isLeaf()) {
                    this.reloadNode(record);
                }
                break;
            
            case 'rename':
                nodeToEdit = Ext.DomQuery.selectNode('span[id="' + record.get('id') + '"]', options.item);
                this.edit(record, nodeToEdit);
                break;
            
            case 'delete':
                this.deleteNode(record);
                break;
            
            case 'newdir':
                record.expand(false, function() {
                    this.create(record);
                }, this);
                break;
            
            case 'uploader':
                uploaderWin = Ext.getCmp('MyUploaderwindow');
                if (!uploaderWin) {
                    new uploaderWin();
                } else {
                    uploaderWin.show();
                    menu.setItemDisabled('uploader', true);
                }
                break;
        }
    }
});




