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
		<aui:column>
			<aui:input name="firstName" size="20" value="" />

			<aui:input name="screenName" size="20" value="" />
		</aui:column>

		<aui:column>
			<aui:input name="middleName" size="20" value="" />

			<aui:input name="emailAddress" size="20" value="" />
		</aui:column>

		<aui:column>
			<aui:input name="lastName" size="20" value="" />


		</aui:column>
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
			<c:forEach var="oddOrEven" begin="0" end="1" step="1">
				<aui:column>

					<c:forEach var="templateProperty" items="${searchableProperties}"
						varStatus="index">
						<c:if test="${index.getIndex() % 2 == oddOrEven}">

							<c:choose>
								<c:when
									test="${templateProperty.valueType.type == 'NUMBER' || templateProperty.valueType.type == 'INTEGER'}">

									<!--<aui:fieldset label="${eetdb:getTemplatePropertyNameDecorated(templateProperty)}" column="false">-->
									<aui:input name="${templateProperty.code}min"
										label="${eetdb:getTemplatePropertyNameDecorated(templateProperty)}"
										inlineLabel="right" class="text" size="5" />

									<aui:input name="${templateProperty.code}max"
										label="-&nbsp;&nbsp;" inlineLabel="right" 
										class="text" size="5" />
									<!--</aui:fieldset>-->

								</c:when>
								<c:otherwise>

									<aui:input name="${templateProperty.code}"
										label="${eetdb:getTemplatePropertyNameDecorated(templateProperty)}"
										size="40" />

								</c:otherwise>
							</c:choose>

						</c:if>
					</c:forEach>
				</aui:column>
			</c:forEach>
		</aui:fieldset>
	</liferay-ui:search-toggle>


	<aui:button-row>
		<aui:button type='submit' value="Поиск" />
	</aui:button-row>

</aui:form>


