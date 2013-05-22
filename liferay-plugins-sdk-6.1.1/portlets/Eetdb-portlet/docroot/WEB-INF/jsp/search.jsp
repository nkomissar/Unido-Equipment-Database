<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="/WEB-INF/tld/eetdb.tld" prefix="eetdb"%>

<%@ page import="com.liferay.portal.service.persistence.PortletUtil"%>
<%@ page import="com.liferay.portal.util.PortalUtil"%>
<%@ page import="com.liferay.portal.kernel.dao.search.DisplayTerms"%>

<%@ page import="javax.portlet.PortletURL"%>
<%@ page import="javax.portlet.PortletPreferences"%>

<portlet:defineObjects />

<%
	PortalUtil.addPortletBreadcrumbEntry(request, "Поиск",
			PortalUtil.getCurrentURL(request));

	DisplayTerms displayTerms = new DisplayTerms(request);
%>
<portlet:renderURL var="doSearchURL">
	<portlet:param name="action" value="doSearch" />
</portlet:renderURL>

<portlet:renderURL var="showSearchURL">
	<portlet:param name="action" value="showSearch" />
</portlet:renderURL>

<aui:form action="<%=doSearchURL%>" method="post" name="search">

	<liferay-ui:search-toggle displayTerms="<%=displayTerms%>"
		id="toggle_id_eetdb_portlet_entity_search" buttonLabel="Поиск">

<aui:fieldset>
			<aui:input name="firstName" size="20" value="" />

			<aui:input name="screenName" size="20" value="" />
			<aui:input name="middleName" size="20" value="" />

			<aui:input name="emailAddress" size="20" value="" />

			<aui:input name="lastName" size="20" value="" />


	</aui:fieldset>
	
		<aui:select name="selectedTemplate" label="Тип оборудования"
			id="selectedTemplate"
			onChange="<%=\"submitForm(document.\"
								+ renderResponse.getNamespace() +\"search, '\"
								+ showSearchURL +\"');\"%>"
			inlineLabel="false">

			<c:forEach items="${templates}" var="template">
				<aui:option value="${template.id}" label="${template.name}"
					selected="${selectedTemplate == template.id}" />
			</c:forEach>

		</aui:select>

		<aui:fieldset>

					<c:forEach var="templateProperty" items="${searchableProperties}"
						varStatus="index">

							<c:choose>
								<c:when
									test="${templateProperty.valueType.type == 'NUMBER' || templateProperty.valueType.type == 'INTEGER'}">
									
									<aui:field-wrapper 
										label="${eetdb:getTemplatePropertyNameDecorated(templateProperty)}" >
										
									<aui:input name="${templateProperty.code}min"
										label=""
										placeholder="MIN"
										cssClass="mycss"/>

									<aui:input name="${templateProperty.code}max"
										label=""
										placeholder="MAX" 
										cssClass="mycss"/>
									</aui:field-wrapper>
								</c:when>
								<c:otherwise>

									<aui:input name="${templateProperty.code}"
										label="${eetdb:getTemplatePropertyNameDecorated(templateProperty)}"
										size="40" />

								</c:otherwise>
							</c:choose>

					</c:forEach>
		</aui:fieldset>
	</liferay-ui:search-toggle>


	<aui:button-row>
		<aui:button type='submit' value="Поиск" />
	</aui:button-row>

</aui:form>


