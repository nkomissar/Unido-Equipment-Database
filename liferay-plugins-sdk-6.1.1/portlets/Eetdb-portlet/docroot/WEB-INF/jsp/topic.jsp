<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>

<%@ page import="com.liferay.portal.service.persistence.PortletUtil"%>
<%@ page import="com.liferay.portal.util.PortalUtil"%>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ page import="org.unido.eetdb.common.model.Topic"%>
<%@ page import="org.unido.eetdb.common.model.Entity"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.lang.Math"%>

<portlet:defineObjects />

<%
	Topic tp = (Topic) request.getAttribute("topic");

	PortalUtil.addPortletBreadcrumbEntry(request, tp.getName(),
			PortalUtil.getCurrentURL(request));

	ArrayList<Entity> entOfTopic = (ArrayList<Entity>) request
			.getAttribute("entitiesOfTopic");
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



<liferay-ui:panel-container>
	<liferay-ui:panel id="childEntities" title="Применяемое оборудование"
		collapsible="true" extended="true">



		<liferay-ui:search-container delta="2" emptyResultsMessage="нет записей">
			<liferay-ui:search-container-results results="${resultsPage}"
				total="${resultsTotal}" />

			<liferay-ui:search-container-row
				className="org.unido.eetdb.common.model.Entity" keyProperty="id"
				modelVar="entity">

				<liferay-ui:search-container-column-text name="Id" property="id" />
				<liferay-ui:search-container-column-text name="Название"
					property="name" />
				<liferay-ui:search-container-column-text name="Тип"
					value="${entity.entityTemplate.name}" />

			</liferay-ui:search-container-row>


			<liferay-ui:search-iterator searchContainer="${model.childEntities}" />

		</liferay-ui:search-container>


	</liferay-ui:panel>
</liferay-ui:panel-container>


