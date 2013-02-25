Ext.define('EetdbAdmin.view.Viewer', {
    extend: 'Ext.tab.Panel',
    alias: 'widget.viewer',
    
    requires: ['EetdbAdmin.view.entitytemplate.Item'],
    
    activeItem: 0,
    //margins: '5 5 5 5',
    
    cls: 'preview',
    
    initComponent: function() {
        this.items = [{
            xtype: 'entitytemplateitem',
            title: 'Sencha Blog',
            html: '<p>Useless</p>'
        }];
        
        this.callParent(arguments);
    }
});