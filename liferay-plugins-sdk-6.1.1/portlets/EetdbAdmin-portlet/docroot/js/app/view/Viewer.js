Ext.define('EetdbAdmin.view.Viewer', {
    extend: 'Ext.tab.Panel',
    alias: 'widget.viewer',
    
    requires: ['EetdbAdmin.view.entitytemplate.Item'
               	,'EetdbAdmin.view.entity.Item'],
    
    activeItem: 0,
    
    initComponent: function() {
    	
    	var me = this;
    	
        me.items = [
          {
            xtype: 'entitytemplateitem',
            title: 'Template'
            ,id: 'entitytemplateitem'
          },{
              xtype: 'entityitem',
              title: 'Entity'
              ,id: 'entityitem'
          }];
        
        
        me.callParent(arguments);
        
        me.getTabBar().hide();
        
    }
});