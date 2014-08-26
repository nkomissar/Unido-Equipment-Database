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

<h3>
	<c:out value="${topic.description}" />
</h3>

<c:if test="${!topic.childTopics.isEmpty()}">
	<liferay-ui:panel-container>
		<liferay-ui:panel id="subTopics" title="Связанные отрасли"
			collapsible="true" extended="true">
	
			<aui:layout>
				<c:forEach var="oddOrEven" begin="0" end="1" step="1">
					<aui:column>
						<c:forEach var="subtopic" items="${topic.childTopics}"
							varStatus="index">
							<c:if test="${index.getIndex() % 2 == oddOrEven}">
								<h4>
	
									<portlet:renderURL var="topicDetailsUrl">
										<portlet:param name="action" value="showTopic" />
										<portlet:param name="topicId" value="${subtopic.id}" />
									</portlet:renderURL>
	
									<aui:a href="${topicDetailsUrl}">
										<c:out value="${subtopic.name}" />
									</aui:a>
	
								</h4>
							</c:if>
						</c:forEach>
					</aui:column>
				</c:forEach>
			</aui:layout>
	
		</liferay-ui:panel>
	</liferay-ui:panel-container>
</c:if>

<aui:layout>
	<c:forEach var="oddOrEvenTemplates" begin="0" end="1" step="1">
		<aui:column>
			<c:forEach var="entry" items="${searchContainers.entrySet()}"
				varStatus="distinctTemplateIndex">
				
				<c:set var="template" value="${entry.key}"/>
				<c:set var="searchContainer" value="${entry.value}"/>
						
				<c:if test="${distinctTemplateIndex.getIndex() % 2 == oddOrEvenTemplates && searchContainer.total > 0}">

					<liferay-ui:panel-container>
						<liferay-ui:panel id="childEntities" title="${'Сопутсвующее оборудование : '}${template.name}"
							collapsible="true" extended="true">

<%@include file="entityGrid.jsp" %>					
					
							</liferay-ui:panel>
						</liferay-ui:panel-container>
	
				</c:if>
			</c:forEach>
		</aui:column>
	</c:forEach>
</aui:layout>
