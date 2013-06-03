<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui"%>
<%@ taglib prefix="eetdb" uri="/WEB-INF/tld/eetdb.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>
<%@ taglib prefix="aui" uri="http://liferay.com/tld/aui"%>

							<liferay-ui:search-container
								searchContainer="${searchContainer}"
								orderByCol="${searchContainer.orderByCol}"
								orderByColParam="${searchContainer.orderByColParam}"
 								orderByType="${searchContainer.orderByType}"
								orderByTypeParam="${searchContainer.orderByTypeParam}"> 
					
								<liferay-ui:search-container-results results="${searchContainer.results}" total="${searchContainer.total}" />
					
								<liferay-ui:search-container-row
									className="org.unido.eetdb.common.model.EntitySearchResult" 
									keyProperty="entityId"
									modelVar="entity">
									
									<portlet:renderURL var="showEnityURL">
					      				<portlet:param name="action" value="showEntity" />
					      				<portlet:param name="entityId" value="${entity.entityId}" />
					    			</portlet:renderURL>
					
									<liferay-ui:search-container-column-text name="Id" property="entityId" orderable="true" orderableProperty="entityId" href="${showEnityURL}"/>
									<liferay-ui:search-container-column-text name="Название" property="entityName" orderable="true" orderableProperty="entityName" href="${showEnityURL}"/>
									
					
								</liferay-ui:search-container-row>
					
								<liferay-ui:search-iterator />
					
							</liferay-ui:search-container>
