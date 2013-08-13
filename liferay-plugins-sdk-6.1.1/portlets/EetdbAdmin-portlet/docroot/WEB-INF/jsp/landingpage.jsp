
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>

<portlet:defineObjects />
<liferay-theme:defineObjects/>

<portlet:renderURL var="doEntityLoadURL" windowState="<%=LiferayWindowState.EXCLUSIVE.toString()%>">
	<portlet:param name="action" value="doEntityLoad" />
</portlet:renderURL>

<portlet:renderURL var="doEntityTemplateListURL" windowState="<%=LiferayWindowState.EXCLUSIVE.toString()%>">
	<portlet:param name="action" value="doEntityTemplateList" />
</portlet:renderURL>

<c:url var="extUxUrl" context="${renderRequest.contextPath}" value="/js/extjs/ux" />

<div id="landingBody"></div>

<script type="text/javascript">

	var doEntityLoadURL, doEntityTemplateListURL
		,entityTemplateControllerURL, portletUrl;
	
	var portletId = '<%= portletDisplay.getId() %>';
	var exclusiveWindowState = '<%= LiferayWindowState.EXCLUSIVE.toString() %>';
	
</script>

<aui:script use="liferay-portlet-url">
	
	Ext.Loader.setConfig({enabled:true});
	Ext.Loader.setPath('Ext.ux', '${extUxUrl}');
	/*Ext.Loader.setPath("Ext", "http://cdn.sencha.io/ext-4.2.0-gpl/src");
	Ext.Loader.setPath("Ext.ux", "http://cdn.sencha.io/ext-4.2.0-gpl/examples/ux");*/
	
	Ext.require([ 'Ext.form.*', 
	              'Ext.layout.container.Column',
	              'Ext.tab.Panel', 
	              'Ext.util.*',
	              'Ext.data.proxy.*',
	              'Ext.ux.GroupTabPanel']);
	
	doEntityLoadURL = '${doEntityLoadURL}';
	
	entityTemplateControllerURL = Liferay.PortletURL.createRenderURL();
	entityTemplateControllerURL.setPortletId(portletId);
	entityTemplateControllerURL.setWindowState(exclusiveWindowState);
	
	portletUrl = Liferay.PortletURL;
	
	Ext.require('Ext.data.writer.Writer', function(){
	Ext.data.writer.Json.override({
	    getRecordData: function(record) {
	    	
	        var me = this, /*i, association,*/ childStore, data = {};
	
	        data = this.callParent(arguments);
	
	        Ext.each(record.associations.items, 
	        	function(association)
	        	{
		        	
		            if (association.type == 'hasMany')  
		            {
		            
		            	data[association.name] = [];
		                childStore = record[association.name]();
		
		                //Iterate over all the children in the current association
		                childStore.each(
		                	function(childRecord) 
		                	{
								data[association.name].push(this.getRecordData(childRecord));
		                	}, 
		                	me);
		                
		                return true;
		            }
		            
		            if (association.type == 'hasOne'
		    			|| association.type == 'belongsTo')  
		    		{
		    			data[association.name] = me.getRecordData(record[association.getterName]());
		    		}
		            
	        	}
	        );
	        
	        //Ext.apply(data,record.getAssociatedData());
	                
	        return data;
	        
	    }
	});});
	
	Ext.require('Ext.data.Model', function(){
	Ext.data.Model.override({
	    
	    /**
	     * @Override
	     * Copies association data after calling super.copyFrom
	     */
	    copyFrom: function(sourceRecord) {
	        
	    	var me = this,
	    		assData = sourceRecord.getAssociatedData();
	    	
	    	me.callParent(arguments);
	    	
	    	Ext.apply(me[me.persistenceProperty], assData);
	    	
	    	Ext.each(sourceRecord.associations.items, 
	    		function(association)
		    	{
		    		if (association.type == 'hasMany')  
		    		{
		    			var assName = association.name;
						var assStore = me[assName]();
		    			assStore.clearFilter(true); //don't know why there is filter defined
		    			assStore.loadData(assData[assName]);
		    			return true;
		    		}
		    		
		    		if (association.type == 'hasOne'
		    			|| association.type == 'belongsTo')  
		    		{
		    			me[association.instanceName].copyFrom(sourceRecord[association.getterName]());
		    		}
		    	}
	    	);
	    	
	    }
	    
	});	
	});

	Ext.define("EetdbAdmin.component.SearchField", {
		extend : "Ext.form.field.Trigger",
		alias : "widget.searchfield",
	
		//requires: ['Ext.form.TriggerField'],
		
		enableKeyEvents : true,
		
		trigger1Cls: Ext.baseCSSPrefix + 'form-clear-trigger',
	    trigger2Cls: Ext.baseCSSPrefix + 'form-search-trigger',
	
		listeners : {
			keyup : function(f, e) {
				if (f.hideTrigger) {
					return;
				}
				var key = e.getKey();
				if (key == e.ENTER || (key == e.SPACE && !f.editable)) {
					f.fireEvent("triggerclick", f, e);
				}
			}
		},
	
	
		afterRender : function() {
			var me = this, body = me.bodyEl;
			me.callParent();
			me.mon(body, "dblclick", me.onDblClick, me);
		},
	
		onTrigger1Click : function(e) {
			this.setValue('');
		},
	
		onTrigger2Click : function(e) {
			var me = this;
			if (!me.hideTrigger) {
				me.fireEvent("triggerclick", me, e);
			}
		},
	
	
		onDblClick : function(e) {
			var me = this;
			if (!me.hideTrigger) {
				me.fireEvent("triggerclick", me, e);
			}
		}
	});
	
		
	Ext.application({
	    name: 'EetdbAdmin',
	    
	    appFolder: '<%= renderRequest.getContextPath() %>/js/app',

	    // Define all the controllers that should initialize at boot up of your application
	    controllers: [
	        'Entities',
	        'Topics',
	        'EntityTemplates',
	        'GroupTabs'
	    ],
	    
	    autoCreateViewport: true,
	    
	    launch : function() {
        	EetdbAdmin.app = this;
    	}
	});
	
	
</aui:script>

<a href="javascript:(function(){var a,l,o=(Ext?Ext.util.Observable.prototype:false);if(!o){alert('Ext not in page');return;}if(!(l=console?console.log:false)){alert('Use Firefox with Firebug');return;}o.fireEvent=Ext.Function.createInterceptor(o.fireEvent, function(evt){a=arguments;console.log(this,' fired event ',evt,' with args ',Array.prototype.slice.call(a,1,a.length));});})();">Log all Ext events</a>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- File Upload -->
 
      <portlet:actionURL var="fileUploadURL">
                <portlet:param name="formAction" value="fileUpload" />      
      </portlet:actionURL>
       
      <form:form name="fileUploader" commandName="springFileVO" method="post"
                action="${fileUploadURL}"  enctype="multipart/form-data">
                 
                <c:out value="${springFileVO.message}" />
                 
                <label> Select a File</label>
                <form:input path="fileData" type="file"/>
                 
                <button type="submit">Submit</button>
                 
      </form:form>
       
<!-- File Download  --> 
    <portlet:resourceURL var="fileDownloadURL" id="fileDownload">
    </portlet:resourceURL>
      
     </br>
     <a href="#" onClick="window.location ='${fileDownloadURL}';"> Download </a>