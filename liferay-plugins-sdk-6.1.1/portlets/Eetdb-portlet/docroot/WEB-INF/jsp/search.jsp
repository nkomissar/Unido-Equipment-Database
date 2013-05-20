<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>

<%@ page import="com.liferay.portal.service.persistence.PortletUtil"%>
<%@ page import="com.liferay.portal.util.PortalUtil"%>

<%@ page import="javax.portlet.PortletURL"%>
<%@ page import="javax.portlet.PortletPreferences"%>
	
<portlet:defineObjects />

<%
	PortalUtil.addPortletBreadcrumbEntry(request, "Поиск",
			PortalUtil.getCurrentURL(request));
%>


<portlet:renderURL var="doSearchURL">
	<portlet:param name="action" value="doSearch" />
</portlet:renderURL>

<portlet:renderURL var="showSearchURL">
	<portlet:param name="action" value="showSearch" />
</portlet:renderURL>
	
<aui:form action="<%= doSearchURL %>" method="post" name="search">

	<aui:select 
		name="template" 
		label="Тип оборудования" 
		id="selectedTemplate" 
		onChange="<%= \"submitForm(document.\" + renderResponse.getNamespace() + \"search, '\" + showSearchURL + \"');\" %>">
        
        <c:forEach items="${templates}" var="template">
            <aui:option value="${template.id}" label="${template.name}" selected="${selectedTemplate == template.id}"/>
        </c:forEach>
        
	</aui:select>
	
	<c:forEach items="${loadedTemplate.properties}" var="templateProperty">
		<c:out value="${templateProperty.code}"></c:out>
		<c:if test="${templateProperty.displayInGrid}">
			<c:choose>
				<c:when test="${templateProperty.valueType.type == 'NUMBER' || templateProperty.valueType.type == 'INTEGER'}">
					<aui:input name="${templateProperty.code + 'min'}" label="${templateProperty.name + ', ' + templateProperty.unitOfMeasure}"/>
					<aui:input name="${templateProperty.code + 'max'}" />
				</c:when>
				<c:otherwise>
					<aui:input name="${templateProperty.code}" label="${templateProperty.name + ', ' + templateProperty.unitOfMeasure}" />
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:forEach>
	
	<aui:button-row>
		<aui:button type='submit' value="Поиск"/>
	</aui:button-row>

</aui:form>


