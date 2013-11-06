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
	
	/*String key = "<replace with the id of your <liferay-ui:search-toggle> tag";
	SessionClicks.put(request, key, "advanced");
	*/
%>

<portlet:renderURL var="doSearchURL">
	<portlet:param name="action" value="doSearch" />
</portlet:renderURL>

<portlet:renderURL var="showSearchURL">
	<portlet:param name="action" value="showSearch" />
</portlet:renderURL>

<aui:form action="<%=doSearchURL%>" name="search">

	<liferay-ui:search-toggle displayTerms="<%=displayTerms%>"
		id="toggle_id_eetdb_portlet_entity_search" buttonLabel="Поиск">


	
		<aui:select name="selectedTemplate" label="Тип оборудования"
			id="selectedTemplate"
			onChange="<%=\"submitForm(document.\"
								+ renderResponse.getNamespace() +\"search, '\"
								+ showSearchURL +\"');\"%>"
			inlineLabel="false" showEmptyOption="true" >

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
									test="${eetdb:isNumeric(templateProperty)}">
									
									<c:set var="keyMin" value="${templateProperty.code}min" />
									<c:set var="keyMax" value="${templateProperty.code}max" />
									
									<aui:field-wrapper 
										label="${eetdb:getTemplatePropertyNameDecorated(templateProperty)}" cssClass="eetdb-search">
										
									<aui:input name="${keyMin}"
										label=""
										placeholder="MIN"
										cssClass="eetdb-search-min-max"
										value="${requestScope[keyMin]}"/>

									<aui:input name="${keyMax}"
										label=""
										placeholder="MAX" 
										cssClass="eetdb-search-min-max"
										value="${requestScope[keyMax]}"/>
										
									</aui:field-wrapper>
								</c:when>
								<c:when test="${templateProperty.valueType.type == 'REFERENCE'}">
									<aui:select name="${templateProperty.code}"
												label="${eetdb:getTemplatePropertyNameDecorated(templateProperty)}">
										<aui:option />
										<c:forEach items="${refEntities[templateProperty.code]}" var="refEntity">
											<aui:option value="${refEntity.id}" 
														label="${refEntity.name}" />
										</c:forEach>
									</aui:select>
								</c:when>
								<c:otherwise>

									<aui:input name="${templateProperty.code}"
										label="${eetdb:getTemplatePropertyNameDecorated(templateProperty)}"
										value="${requestScope[templateProperty.code]}"/>

								</c:otherwise>
							</c:choose>

					</c:forEach>
		</aui:fieldset>
	</liferay-ui:search-toggle>


</aui:form>


<c:set var="searchContainer" value="${searchContainers.entrySet().iterator().next().value}"/>

<%@include file="entityGrid.jsp" %>					

<c:set var="searchContainer" value="${basicSearchContainer}"/>

<div class="eetdb-basic-search-results">
<%@include file="entitySearchResultGrid.jsp" %>					
</div>

