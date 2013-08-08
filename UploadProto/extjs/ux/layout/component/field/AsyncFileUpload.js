 /**
 * Layout class for {@link Ext.form.field.HtmlEditor} fields. Sizes the toolbar, textarea, and iframe elements.
 * @private
 */
Ext.define('Ext.ux.layout.component.field.AsyncFileUpload', {
    extend: 'Ext.layout.component.field.Field',
    alias: ['layout.asyncfileupload'],
    
    type: 'asyncfileupload',

    // Flags to say that the item is autosizing itself.
    toolbarSizePolicy: {
        setsWidth: 0,
        setsHeight: 0
    },
    
    beginLayout: function(ownerContext) {
        this.callParent(arguments);
        
        //ownerContext.textAreaContext = ownerContext.getEl('textareaEl');
        //ownerContext.iframeContext = ownerContext.getEl('iframeEl');
        ownerContext.toolbarContext = ownerContext.context.getCmp(this.owner.getToolbar());
        ownerContext.uploadItemsContext = ownerContext.context.getCmp(this.owner.getUploadItems());
    },

    // It's not a container, can never add/remove dynamically
    renderItems: Ext.emptyFn,
    
    getItemSizePolicy: function(item) {
        // we are only ever called by the toolbar
        return this.toolbarSizePolicy;
    },
    
    getLayoutItems: function() {
        var toolbar = this.owner.getToolbar();
		var uploadItems = this.owner.getUploadItems();
        // The toolbar may not exist if we're destroying
        return toolbar ? [toolbar, uploadItems] : [];
    },
    
    getRenderTarget: function() {
        return this.owner.bodyEl;
    },
    
    publishInnerHeight: function(ownerContext, height) {
        var me = this, 
        innerHeight = height - me.measureLabelErrorHeight(ownerContext) - 
        ownerContext.toolbarContext.getProp('height') - 
        ownerContext.bodyCellContext.getPaddingInfo().height;

        // If the Toolbar has not acheieved a height yet, we are not done laying out.
        if (Ext.isNumber(innerHeight)) {
            ownerContext.uploadItemsContext.setHeight(innerHeight);
            //ownerContext.iframeContext.setHeight(innerHeight);
        } else {
            me.done = false;
        }
    }
});
