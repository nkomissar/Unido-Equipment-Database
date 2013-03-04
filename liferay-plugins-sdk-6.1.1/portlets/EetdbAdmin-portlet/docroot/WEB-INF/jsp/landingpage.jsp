
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
	
	var portletId = '${portletDisplay.getId()}';
	var exclusiveWindowState = '<%=LiferayWindowState.EXCLUSIVE.toString()%>';
	
</script>

<aui:script use="liferay-portlet-url">
	
	
	Ext.Loader.setPath('Ext.ux', '${extUxUrl}');
	
	Ext.require([ 'Ext.form.*', 
	              'Ext.layout.container.Column',
	              'Ext.tab.Panel', 
	              'Ext.util.*',
	              'Ext.data.proxy',
	              'Ext.ux.GroupTabPanel']);
	
	doEntityLoadURL = '${doEntityLoadURL}';
	
	entityTemplateControllerURL = Liferay.PortletURL.createRenderURL();
	entityTemplateControllerURL.setPortletId(portletId);
	entityTemplateControllerURL.setWindowState(exclusiveWindowState);
	
	portletUrl = Liferay.PortletURL;
	
	
	Ext.application({
	    name: 'EetdbAdmin',
	    
	    appFolder: '<%= renderRequest.getContextPath() %>/js/app',

	    // Define all the controllers that should initialize at boot up of your application
	    controllers: [
	        'Entities',
	        'EntityTemplates',
	        'GroupTabs'
	    ],
	    
	    autoCreateViewport: true,
	    
	    launch : function() {
        	EetdbAdmin.app = this;
    	}
	});
	
	
</aui:script>

<a href="javascript:(function(){var a,l,o=(Ext?Ext.util.Observable.prototype:false);if(!o){alert('Ext not in page');return;}if(!(l=console?console.log:false)){alert('Use Firefox with Firebug');return;}o.fireEvent=Ext.Function.createInterceptor(o.fireEvent, function(evt){debugger;a=arguments;console.log(this,' fired event ',evt,' with args ',Array.prototype.slice.call(a,1,a.length));});})();">Log all Ext events</a>