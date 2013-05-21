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
<%@ page import="org.unido.eetdb.common.model.EntityProperty"%>
<%@ page import="org.unido.eetdb.common.model.EntityTemplate"%>
<%@ page import="org.unido.eetdb.util.CustomComparatorUtil"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.lang.Math"%>

<%@ page import="javax.portlet.PortletURL"%>
<%@ page import="javax.portlet.PortletPreferences"%>
<%@ page import="javax.servlet.jsp.jstl.core.LoopTagStatus  " %>



<portlet:defineObjects />

<%
	Topic tp = (Topic) request.getAttribute("topic");

	PortalUtil.addPortletBreadcrumbEntry(request, tp.getName(),
			PortalUtil.getCurrentURL(request));

%>


<h1>
	<c:out value="${topic.name}" />
</h1>

<div>
	<c:out value="${topic.description}" />
</div>

<liferay-ui:panel-container>
	<liferay-ui:panel id="subTopics" title="Связанные отрасли"
		collapsible="true" extended="true">

		<aui:layout>
			<c:forEach var="oddOrEven" begin="0" end="1" step="1">
				<aui:column>
					<c:forEach var="subtopic" items="${topic.childTopics}"
						varStatus="index">
						<c:if test="${index.getIndex() % 2 == oddOrEven}">
							<h1>

								<portlet:renderURL var="topicDetailsUrl">
									<portlet:param name="action" value="showTopic" />
									<portlet:param name="topicId" value="${subtopic.id}" />
								</portlet:renderURL>

								<aui:a href="${topicDetailsUrl}">
									<c:out value="${subtopic.name}" />
								</aui:a>

							</h1>
						</c:if>
					</c:forEach>
				</aui:column>
			</c:forEach>
		</aui:layout>

	</liferay-ui:panel>
</liferay-ui:panel-container>

<aui:layout>
	<c:forEach var="oddOrEvenTemplates" begin="0" end="1" step="1">
		<aui:column>
			<c:forEach var="entry" items="${searchContainers.entrySet()}"
				varStatus="distinctTemplateIndex">
				
				<c:set var="template" value="${entry.key}"/>
				<c:set var="searchContainer" value="${entry.value}"/>
						
				<c:if test="${distinctTemplateIndex.getIndex() % 2 == oddOrEvenTemplates}">

					<liferay-ui:panel-container>
						<liferay-ui:panel id="childEntities" title="${'Применяемое оборудование : '}${template.name}"
							collapsible="true" extended="true">

							<liferay-ui:search-container
								searchContainer="${searchContainer}"
								orderByCol="${searchContainer.orderByCol}"
								orderByColParam="${searchContainer.orderByColParam}"
 								orderByType="${searchContainer.orderByType}"
								orderByTypeParam="${searchContainer.orderByTypeParam}"> 
					
								<liferay-ui:search-container-results results="${searchContainer.results}" total="${searchContainer.total}" />
					
								<liferay-ui:search-container-row
									className="org.unido.eetdb.common.model.Entity" 
									keyProperty="id"
									modelVar="entity">
									
									<portlet:renderURL var="showEnityURL">
					      				<portlet:param name="action" value="showEntity" />
					      				<portlet:param name="entityId" value="${entity.id}" />
					    			</portlet:renderURL>
					
									<liferay-ui:search-container-column-text name="Id" property="id" orderable="true" orderableProperty="id" href="${showEnityURL}"/>
									<liferay-ui:search-container-column-text name="Название" property="name" orderable="true" orderableProperty="name" href="${showEnityURL}"/>
									<liferay-ui:search-container-column-text name="Тип" value="${entity.entityTemplate.name}" />
									
									<c:forEach items="${eetdb:sortPropertyByCode(entity.properties)}" var="property">
									
										<c:if test="${property.templateProperty.displayInGrid}">
											
											<liferay-ui:search-container-column-text name="${eetdb:getPropertyNameDecorated(property)}">
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
														<c:out value="${property.value}" />
													</c:otherwise>
												</c:choose>
											</liferay-ui:search-container-column-text>										
										</c:if>
									</c:forEach>
					
								</liferay-ui:search-container-row>
					
								<liferay-ui:search-iterator />
					
							</liferay-ui:search-container>
					
					
						</liferay-ui:panel>
					</liferay-ui:panel-container>

				</c:if>
			</c:forEach>
		</aui:column>
	</c:forEach>
</aui:layout>

