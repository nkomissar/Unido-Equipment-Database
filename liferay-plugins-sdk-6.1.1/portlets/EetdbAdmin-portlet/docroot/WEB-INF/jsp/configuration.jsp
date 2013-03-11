
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>


<%@ page import="com.liferay.portal.kernel.util.Constants"%>

<%@ page import="javax.portlet.PortletPreferences"%>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ page import="com.liferay.portal.kernel.util.Validator"%>
<%@ page import="com.liferay.portlet.PortletPreferencesFactoryUtil"%>

<portlet:defineObjects />

<%
	PortletPreferences preferences = renderRequest.getPreferences();

	String portletResource = ParamUtil.getString(request,
			"portletResource");

	if (Validator.isNotNull(portletResource)) {
		preferences = PortletPreferencesFactoryUtil.getPortletSetup(
				request, portletResource);
	}

	String eetDbServicesUrl = preferences.getValue("eetDbServicesUrl",
			null);

%>



<liferay-portlet:actionURL portletConfiguration="true"
	var="configurationActionURL" />

<aui:form action="<%=configurationActionURL%>" method="post"
	name="<portlet:namespace />fm">

	<aui:input name="<portlet:namespace /><%=Constants.CMD%>" type="hidden"
		value="<%=Constants.UPDATE%>" />

	<aui:input name="<portlet:namespace />preferences--eetDbServicesUrl--"
		type="text" label="EetDb Services Url" value="<%=eetDbServicesUrl%>" />

	<aui:button-row>
		<aui:button onClick='submitForm(document.<portlet:namespace />fm);'
			type='submit' />
	</aui:button-row>

</aui:form>
