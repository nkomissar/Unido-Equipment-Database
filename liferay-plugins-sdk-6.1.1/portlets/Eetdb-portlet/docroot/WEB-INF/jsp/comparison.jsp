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
<%@ page import="java.util.Map.Entry"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.lang.Math"%>

<%@ page import="javax.portlet.PortletURL"%>
<%@ page import="javax.portlet.PortletPreferences"%>


<portlet:defineObjects />

<%
	PortalUtil.addPortletBreadcrumbEntry(request, "Сравнение",
			PortalUtil.getCurrentURL(request));
%>
<liferay-ui:search-container  emptyResultsMessage="Не выбраны позиции для сравнения!">


	<liferay-ui:search-container-results results="${compareResults}" total="${compareResults.size()}" />

	<liferay-ui:search-container-row modelVar="entry" className="Entry">
		<liferay-ui:search-container-column-text value="${uniqueProperties.get(entry.key).getName()}"/>
		
 		<c:forEach var="entity" items="${entities}" varStatus="status">
 		
			<portlet:renderURL var="showEnityURL">
     				<portlet:param name="action" value="showEntity" />
     				<portlet:param name="entityId" value="${entity.id}" />
   			</portlet:renderURL>
   			
 			<c:set var="nameDecorated"><a href="${showEnityURL}"><c:out value="${entity.name}" /></a></c:set>
			
			<liferay-ui:search-container-column-text name="${nameDecorated}">
				<c:choose>
					<c:when test="${property.templateProperty.valueType.type == 'REFERENCE'}">
						<c:forTokens items="${property.value}" delims="," var="strId">
						
							<portlet:renderURL var="showRefEnityURL">
				     				<portlet:param name="action" value="showEntity" />
				     				<portlet:param name="entityId" value="${strId}" />
				   			</portlet:renderURL>
				   											
							<aui:a href="${showRefEnityURL}"><c:out value="${referencedEntities.get(strId).getName()}"/></aui:a>
							&nbsp;
							
						</c:forTokens>
					</c:when>
					<c:otherwise>
						<c:out value="${entry.value[status.index]}" />
					</c:otherwise>
				</c:choose>
			</liferay-ui:search-container-column-text>
			
		</c:forEach> 
		
	</liferay-ui:search-container-row>
	
	<liferay-ui:search-iterator paginate="false"/>
	
</liferay-ui:search-container>
