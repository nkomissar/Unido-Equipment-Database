<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>

<%@ page import="com.liferay.portal.service.persistence.PortletUtil"%>
<%@ page import="com.liferay.portal.util.PortalUtil"%>
<%@ page import="com.liferay.portal.kernel.util.ListUtil"%>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ page import="com.liferay.portlet.PortalPreferences"%>
<%@ page import="com.liferay.portlet.PortletPreferencesFactoryUtil"%>
<%@ page import="com.liferay.portal.kernel.dao.search.SearchContainer"%>
<%@ page import="com.liferay.portal.kernel.util.ListUtil"%>
<%@ page import="com.liferay.portal.kernel.util.Validator"%>
<%@ page import="com.liferay.portal.kernel.util.OrderByComparator"%>
<%@ page import="org.unido.eetdb.common.model.Topic"%>
<%@ page import="org.unido.eetdb.common.model.Entity"%>
<%@ page import="org.unido.eetdb.util.CustomComparatorUtil"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.lang.Math"%>

<%@ page import="javax.portlet.PortletURL"%>
<%@ page import="javax.portlet.PortletPreferences"%>



<portlet:defineObjects />

<%
	Entity entity = (Entity) request.getAttribute("entity");

	PortalUtil.addPortletBreadcrumbEntry(request, entity.getName(),
			PortalUtil.getCurrentURL(request));

%>


<h1>
	<c:out value="${entity.name}" />
</h1>


