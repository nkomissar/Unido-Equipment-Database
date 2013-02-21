
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>


<portlet:defineObjects />

<portlet:renderURL var="doEntityLoadURL" windowState="<%=LiferayWindowState.EXCLUSIVE.toString()%>">
	<portlet:param name="action" value="doEntityLoad" />
</portlet:renderURL>

<portlet:renderURL var="doEntityTemplateListURL" windowState="<%=LiferayWindowState.EXCLUSIVE.toString()%>">
	<portlet:param name="action" value="doEntityTemplateList" />
</portlet:renderURL>

<c:url var="extUxUrl" context="${renderRequest.contextPath}" value="/js/extjs/ux" />


<div id="landingBody"></div>

<script type="text/javascript">
   
	Ext.Loader.setPath('Ext.ux', '${extUxUrl}');
	
	Ext.require([ 'Ext.form.*', 
	              'Ext.layout.container.Column',
	              'Ext.tab.Panel', 
	              'Ext.util.*',
	              'Ext.data.proxy',
	              'Ext.ux.GroupTabPanel']);
	
	var doEntityLoadURL = '${doEntityLoadURL}';
	var doEntityTemplateListURL = '${doEntityTemplateListURL}';

	
	Ext.application({
	    name: 'EetdbAdmin',
	    
	    appFolder: '<%= renderRequest.getContextPath() %>/js/app',

	    // Define all the controllers that should initialize at boot up of your application
	    controllers: [
	        'Entities',
	        'EntityTemplates'
	    ],
	    
	    autoCreateViewport: true
	});
	
	
</script>