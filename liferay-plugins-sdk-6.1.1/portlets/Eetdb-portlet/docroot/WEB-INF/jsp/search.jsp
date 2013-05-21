<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="/WEB-INF/tld/eetdb.tld" prefix="eetdb"%>

<%@ page import="com.liferay.portal.service.persistence.PortletUtil"%>
<%@ page import="com.liferay.portal.util.PortalUtil"%>

<%@ page import="javax.portlet.PortletURL"%>
<%@ page import="javax.portlet.PortletPreferences"%>
	
<portlet:defineObjects />

<%
	PortalUtil.addPortletBreadcrumbEntry(request, "Поиск",
			PortalUtil.getCurrentURL(request));
%>

<liferay-ui:search-toggle displayTerms="" id="dds">

</liferay-ui:search-toggle>

<portlet:renderURL var="doSearchURL">
	<portlet:param name="action" value="doSearch" />
</portlet:renderURL>

<portlet:renderURL var="showSearchURL">
	<portlet:param name="action" value="showSearch" />
</portlet:renderURL>
	
<aui:form action="<%= doSearchURL %>" method="post" name="search">

	<aui:select 
		name="selectedTemplate" 
		label="Тип оборудования" 
		id="selectedTemplate" 
		onChange="<%= \"submitForm(document.\" + renderResponse.getNamespace() + \"search, '\" + showSearchURL + \"');\" %>"
		inlineLabel="true">
        
        <c:forEach items="${templates}" var="template">
            <aui:option value="${template.id}" label="${template.name}" selected="${selectedTemplate == template.id}"/>
        </c:forEach>
        
	</aui:select>
	
	<c:forEach items="${loadedTemplate.properties}" var="templateProperty">
		<c:if test="${templateProperty.displayInGrid}">
			<c:choose>
				<c:when test="${templateProperty.valueType.type == 'NUMBER' || templateProperty.valueType.type == 'INTEGER'}">
					
					<aui:fieldset label="${eetdb:getTemplatePropertyNameDecorated(templateProperty)}" column="true">
						<aui:input 
							name="${templateProperty.code}min" 
							label="${eetdb:getTemplatePropertyNameDecorated(templateProperty)}" 
							inlineField="true" 
							class="text" 
							size="5"/>
							
						<aui:input 
							name="${templateProperty.code}max" 
							label="-&nbsp;&nbsp;" 
							inlineLabel="true" 
							inlineField="true"
							class="text" 
							size="5"/>
					</aui:fieldset>
					
				</c:when>
				<c:otherwise>
				
					<aui:input 
						name="${templateProperty.code}" 
						label="${eetdb:getTemplatePropertyNameDecorated(templateProperty)}" 
						inlineLabel="true"/>
					
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:forEach>
	
	<aui:button-row>
		<aui:button type='submit' value="Поиск"/>
	</aui:button-row>

</aui:form>


