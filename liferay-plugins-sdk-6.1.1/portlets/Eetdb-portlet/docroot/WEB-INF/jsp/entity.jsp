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

<h2>
	<c:out value="${entity.entityTemplate.name}" />
</h2>

<p>
	<c:choose>
		<c:when test="${isInComparison}">
			<portlet:actionURL var="compareAdd" name="removeFromCompare" copyCurrentRenderParameters="true"/>
			<aui:a href="${compareAdd}">Убрать из сравнения</aui:a>
		</c:when>
		<c:otherwise>
			<portlet:actionURL var="compareRemove" name="addToCompare" copyCurrentRenderParameters="true" />
			<aui:a href="${compareRemove}">Добавить к сравнению</aui:a>
		</c:otherwise>
	</c:choose>
	<c:if test="${comparisonCount > 0}">
		<portlet:renderURL var="doCompare">
			<portlet:param name="action" value="doCompare"/>
		</portlet:renderURL>
		<aui:a href="${doCompare}">Сравнить</aui:a> 
		<c:out value="${comparisonCount}"/>
	</c:if>
</p>

<liferay-ui:panel-container>
	<liferay-ui:panel id="displayInGrid" title="Основные характеристики"
		collapsible="true" extended="true">

		<c:forEach var="prop" items="${entity.properties}" varStatus="index">
			<c:if test="${prop.templateProperty.displayInGrid}">
			

				<aui:layout>
					<aui:column>
						<c:out value="${prop.templateProperty.name}" />
					</aui:column>
					<aui:column>
						<c:choose>
							<c:when test="${prop.templateProperty.valueType.type == 'REFERENCE'}">
								<c:forTokens items="${prop.value}" delims="," var="strId">
								
									<portlet:renderURL var="showEnityURL">
					      				<portlet:param name="action" value="showEntity" />
					      				<portlet:param name="entityId" value="${strId}" />
					    			</portlet:renderURL>
					    											
									<aui:a href="${showEnityURL}"><c:out value="${referencedEntities.get(strId).getName()}"/></aui:a>
									&nbsp;
									
								</c:forTokens>
							</c:when>
							<c:when test="${prop.templateProperty.valueType.type == 'IMG'}">
								
								<c:forTokens items="${prop.value}" delims="," var="strId">
								
									<portlet:resourceURL var="showBoobURL">
										<portlet:param name="action" value="showBoob" />
					      				<portlet:param name="blobId" value="${strId}" />
									</portlet:resourceURL>
								
									<img src="${showBoobURL}" alt="Image returned by portlet." />&nbsp;
																		
								</c:forTokens>
							</c:when>
							<c:otherwise>
								<c:out value="${prop.value}" />
							</c:otherwise>
						</c:choose>
						
					</aui:column>
				</aui:layout>
				
			</c:if>
		</c:forEach>


	</liferay-ui:panel>
</liferay-ui:panel-container>

<liferay-ui:panel-container>
	<liferay-ui:panel id="notDisplayInGrid" title="Дополнительные характеристики"
		collapsible="true" extended="true">

		<c:forEach var="prop" items="${entity.properties}" varStatus="index">
			<c:if test="${!prop.templateProperty.displayInGrid}">
			

				<aui:layout>
					<aui:column>
						<c:out value="${prop.templateProperty.name}" />
					</aui:column>
					<aui:column>
						<c:choose>
							<c:when test="${prop.templateProperty.valueType.type == 'REFERENCE'}">
								<c:forTokens items="${prop.value}" delims="," var="strId">
								
									<portlet:renderURL var="showEnityURL">
					      				<portlet:param name="action" value="showEntity" />
					      				<portlet:param name="entityId" value="${strId}" />
					    			</portlet:renderURL>
					    											
									<aui:a href="${showEnityURL}"><c:out value="${referencedEntities.get(strId).getName()}"/></aui:a>
									&nbsp;
									
								</c:forTokens>
							</c:when>
							<c:when test="${prop.templateProperty.valueType.type == 'IMG'}">
								
								<c:forTokens items="${prop.value}" delims="," var="strId">
								
									<portlet:resourceURL var="showBoobURL" id="showBoob">
										<portlet:param name="action" value="showBoob" />
					      				<portlet:param name="blobId" value="${strId}" />
									</portlet:resourceURL>
								
									<img src="${showBoobURL}" alt="Image returned by portlet." />&nbsp;
																		
								</c:forTokens>
							</c:when>
							<c:otherwise>
								<c:out value="${prop.value}" />
							</c:otherwise>
						</c:choose>
					</aui:column>
				</aui:layout>
				
			</c:if>
		</c:forEach>


	</liferay-ui:panel>
</liferay-ui:panel-container>

<liferay-ui:panel-container>
	<liferay-ui:panel id="linkedEntities" title="Связанное оборудование" collapsible="true"
		extended="true">

		<aui:layout>
			<c:forEach var="oddOrEven" begin="0" end="1" step="1">
				<aui:column>
					<c:forEach var="subentity" items="${entity.childEntities}" varStatus="index">
						<c:if test="${index.getIndex() % 2 == oddOrEven}">
							<h1>
								
								<portlet:renderURL var="entityDetailsUrl">
									<portlet:param name="action" value="showEntity" />
									<portlet:param name="entityId" value="${subentity.id}" />
								</portlet:renderURL>
								
								<aui:a href="${entityDetailsUrl}">
									<c:out value="${subentity.name}" />
								</aui:a>
								
							</h1>
						</c:if>
					</c:forEach>
				</aui:column>
			</c:forEach>
		</aui:layout>

	</liferay-ui:panel>
</liferay-ui:panel-container>
