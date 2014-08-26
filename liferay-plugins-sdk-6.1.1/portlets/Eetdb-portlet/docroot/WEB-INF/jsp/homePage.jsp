<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>

<%@ page import="com.liferay.portlet.PortletURLFactory"%>
<%@ page import="com.liferay.portal.theme.ThemeDisplay" %>

<portlet:defineObjects />
<liferay-theme:defineObjects />

<H1>Каталог энергосберегающих технологий и оборудования</H1>
<h3>В этом разделе представлена информация о технологиях, мероприятиях и оборудовании, внедрение которых позволяет более эффективно использовать топливно-энергетические ресурсы и существенно снизить денежные затраты.</h3>

<liferay-ui:panel-container>
	<liferay-ui:panel id="rootTopics" title="Рубрикаторы" collapsible="true"
		extended="true">

		<aui:layout>
			<c:forEach var="oddOrEven" begin="0" end="1" step="1">
				<aui:column>
					<c:forEach var="topic" items="${listOfTopics}" varStatus="index">
						 <c:if test="${index.index % 2 == oddOrEven}">
							<h3>
								
								<portlet:renderURL var="topicDetailsUrl">
									<portlet:param name="action" value="showTopic" />
									<portlet:param name="topicId" value="${topic.id}" />
								</portlet:renderURL>
								
								<aui:a href="${topicDetailsUrl}">
									<c:out value="${topic.name}" />
								</aui:a>
								
							</h3>
						</c:if>
					</c:forEach>
				</aui:column>
			</c:forEach>
		</aui:layout>

	</liferay-ui:panel>
</liferay-ui:panel-container>

<liferay-ui:panel-container>
	<liferay-ui:panel id="searchEetdb" title="Поиск по базе данных" collapsible="true"
		extended="true"
		cssClass="eetdb-home-search"
		>

		<aui:form method="post" name="search">
		
			<aui:fieldset>
		 
		 			<aui:input name="keywords" 
								placeholder="Введите критерий поиска" 
								label=""  
								cssClass="eetdb-home-search-terms"/>
					
					<aui:input type="hidden" 
								name="advancedSearch" 
								id="advancedSearch"/>
		
					<aui:button value="Поиск" 
								cssClass="eetdb-home-search-button-basic"/>
											
					<aui:button value="Расширенный Поиск"
								cssClass="eetdb-show-advanced-search"/>

			</aui:fieldset>
	
		</aui:form>

	</liferay-ui:panel>
</liferay-ui:panel-container>

<aui:script use="aui-io-request">
	A.all('.eetdb-home-search .eetdb-show-advanced-search').on(
		'click',
		function() 
		{
				
			var strUrl = '<portlet:renderURL><portlet:param name="action" value="showSearch" /></portlet:renderURL>';
			var form = document.<portlet:namespace />search;
			
			A.io.request(
			'<%= themeDisplay.getPathMain() %>/portal/session_click',
			{
				data: 
				{
					'toggle_id_eetdb_portlet_entity_search': 'advanced'
				},
				on: 
				{   
					success: function() 
							{
								submitForm(form, strUrl);   
							}   
				}
			}
			);
		}
	);
	A.all('.eetdb-home-search .eetdb-home-search-button-basic').on(
		'click',
		function() 
		{
				
			var strUrl = '<portlet:renderURL><portlet:param name="action" value="doSearch" /></portlet:renderURL>';
			var form = document.<portlet:namespace />search;
			
			A.io.request(
			'<%= themeDisplay.getPathMain() %>/portal/session_click',
			{
				data: 
				{
					'toggle_id_eetdb_portlet_entity_search': 'basic'
				},
				on: 
				{   
					success: function() 
							{
								submitForm(form, strUrl);   
							}   
				}
			}
			);
		}
	);
</aui:script>
