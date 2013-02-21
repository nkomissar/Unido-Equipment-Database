
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>


<portlet:defineObjects />

<portlet:renderURL var="doEntityLoadURL" windowState="<%=LiferayWindowState.EXCLUSIVE.toString()%>">
	<portlet:param name="action" value="doEntityLoad" />
</portlet:renderURL>

<portlet:renderURL var="doEntityTemplateListURL" windowState="<%=LiferayWindowState.EXCLUSIVE.toString()%>">
	<portlet:param name="action" value="doEntityTemplateList" />
</portlet:renderURL>

<div id="landingBody"></div>

<script type="text/javascript">
   
	Ext.require([ 'Ext.form.*', 
	              'Ext.layout.container.Column',
	              'Ext.tab.Panel', 
	              'Ext.util.*',
	              'Ext.data.proxy']);
	
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