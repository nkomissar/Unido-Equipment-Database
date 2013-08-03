Ext.define('MyApp.view.filetree.Filetreepanel' ,{
	extend: 'Ext.tree.Panel',
  alias : ['widget.filetreepanel'],
  id:'MyFiletree',
  store: 'Sfiletree',
  viewConfig: {
  	plugins: {
    	ptype: 'treeviewdragdrop',
      pluginId : 'ddplugin',
      allowCopy: true,
      allowDrag:true,
      appendOnly:true,
      expandDelay : 5000000
		}
	},
 	height:400,
  width: 300,
  title: 'Filetree widget',
  useArrows: true,
	  dockedItems: [{
  	  xtype: 'toolbar',
      items: [{
    	  text: 'Expand All',
      	iconCls: 'icon-expand-all',
        handler: function(){this.up('filetreepanel').expandAll()}
     		},{
      	text: 'Collapse All',
        iconCls: 'icon-collapse-all',
        handler: function(){this.up('filetreepanel').collapseAll()}
        },{
        itemId:'sort',
        text: 'Sort',
        iconCls: 'icon-sort'
     	}]
  	}]
});