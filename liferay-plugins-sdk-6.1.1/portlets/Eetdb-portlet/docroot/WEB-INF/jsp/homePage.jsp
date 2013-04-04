<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>

<%@ page import="com.liferay.portlet.PortletURLFactory"%>

<portlet:defineObjects />

<portlet:renderURL var="doSearchURL">
	<portlet:param name="action" value="doSearch" />
</portlet:renderURL>

<liferay-ui:panel-container>
	<liferay-ui:panel id="rootTopics" title="Отрасли" collapsible="true"
		extended="true">

		<aui:layout>
			<c:forEach var="oddOrEven" begin="0" end="1" step="1">
				<aui:column>
					<c:forEach var="topic" items="${listOfTopics}" varStatus="index">
						<c:if test="${index.getIndex() % 2 == oddOrEven}">
							<h1>
								
								<portlet:renderURL var="topicDetailsUrl">
									<portlet:param name="action" value="showTopic" />
									<portlet:param name="topicId" value="${topic.id}" />
								</portlet:renderURL>
								
								<aui:a href="${topicDetailsUrl}">
									<c:out value="${topic.name}" />
								</aui:a>
								
							</h1>
						</c:if>
					</c:forEach>
				</aui:column>
			</c:forEach>
		</aui:layout>

	</liferay-ui:panel>
</liferay-ui:panel-container>



