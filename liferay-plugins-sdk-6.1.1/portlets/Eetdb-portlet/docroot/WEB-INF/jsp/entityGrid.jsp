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
									className="org.unido.eetdb.common.model.Entity" 
									keyProperty="id"
									modelVar="entity">
									
									<portlet:renderURL var="showEnityURL">
					      				<portlet:param name="action" value="showEntity" />
					      				<portlet:param name="entityId" value="${entity.id}" />
					    			</portlet:renderURL>
					
									<liferay-ui:search-container-column-text name="Id" property="id" orderable="true" orderableProperty="id" href="${showEnityURL}"/>
									<liferay-ui:search-container-column-text name="Название" property="name" orderable="true" orderableProperty="name" href="${showEnityURL}"/>
									<!-- liferay-ui:search-container-column-text name="Тип" value="${entity.entityTemplate.name}" /-->
									
									<c:forEach items="${eetdb:sortPropertyByCode(entity.properties)}" var="property">
									
										<c:if test="${property.templateProperty.displayInGrid}">
											
											<liferay-ui:search-container-column-text name="${eetdb:getPropertyNameDecorated(property)}" orderable="false">
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
