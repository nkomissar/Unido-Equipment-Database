<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>

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
<%@ page import="org.unido.eetdb.common.model.EntityTemplate"%>
<%@ page import="org.unido.eetdb.util.CustomComparatorUtil"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Collections"%>
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

<%
	Map<String, EntityTemplate> distinctTemplates = new HashMap<String, EntityTemplate>();
	Map<String, List<Entity>> entitiesByTemplate = new HashMap<String, List<Entity>>();

	for(Entity entity : tp.getEntitiesOfTopic())
	{
		EntityTemplate temp = entity.getEntityTemplate();
		String key = temp.getCode();
		
		if(!distinctTemplates.containsKey(key))
		{
			distinctTemplates.put(key, temp);
			entitiesByTemplate.put(key, new ArrayList<Entity>());
		}
		
		List<Entity> sameTemplateEntities = entitiesByTemplate.get(key);
		sameTemplateEntities.add(entity);
	}  
	
	
	Map<String, String> scDelta = new HashMap<String, String>();
	Map<String, String> scCur = new HashMap<String, String>();
	
	for(EntityTemplate templ : distinctTemplates.values())
	{
		String key = templ.getCode();
		
		//Getting "cur" value from request.
		//This value is used to display corresponding page.
		//e.g. page 2 of 10
		scCur.put(key, ParamUtil.getString(renderRequest, key + "CurParam"));
		
		// Getting "delta" value from request.
		// We get this parameter from request only when we change "items per page (delta)" for any search container
		// Search container set the changed delta parameter as "delta + {curParam value defined in search container tag}"
		// Substracting 18 as default delta value is 20, but we have only 5 records for testing
		String deltaFromReq = ParamUtil.get(request,
				"delta" + key + "CurParam",
				String.valueOf(SearchContainer.DEFAULT_DELTA - 18));
				
		scDelta.put(key, ParamUtil.get(request, key + "DeltaParam", deltaFromReq));
		
	}
	
	Map<String, PortletURL> scIteratorUrl = new HashMap<String, PortletURL>();
	
	for(EntityTemplate templ : distinctTemplates.values())
	{
		String key = templ.getCode();

		PortletURL entitiesIteratorUrl = renderResponse.createRenderURL();
		
		entitiesIteratorUrl.setParameter("action", "showTopic");
		entitiesIteratorUrl.setParameter("topicId", Long.toString(tp.getId()));
		
		for(String subKey : scCur.keySet())
		{
			entitiesIteratorUrl.setParameter("delta" + subKey + "CurParam", scDelta.get(subKey));
			entitiesIteratorUrl.setParameter(subKey + "CurParam", scCur.get(subKey));
		}
		
		scIteratorUrl.put(key, entitiesIteratorUrl);
	}
	
	
%>

<aui:layout>
	<c:forEach var="oddOrEvenTemplates" begin="0" end="1" step="1">
		<aui:column>
			<c:forEach var="template" items="<%= distinctTemplates.values() %>"
				varStatus="distinctTemplateIndex">
				<%
					LoopTagStatus templateIndex = (LoopTagStatus)pageContext.getAttribute("distinctTemplateIndex");
					EntityTemplate template = (EntityTemplate)pageContext.getAttribute("template");
					String key = template.getCode();
					
					//sorting
					
					PortalPreferences portalPrefs = PortletPreferencesFactoryUtil.getPortalPreferences(request);
					String orderByCol = ParamUtil.getString(request, key + "OrderByColParam");
					String orderByType = ParamUtil.getString(request,  key + "OrderByTypeParam");
					//System.out.println("Col  "+ orderByCol);
					
					
					if (Validator.isNotNull(orderByCol) && Validator.isNotNull(orderByType)) 
					{
						portalPrefs.setValue("NAME_SPACE",  key + "order-by-col", orderByCol);
						portalPrefs.setValue("NAME_SPACE",  key + "order-by-type", orderByType);
					} 
					else 
					{
					
						orderByCol = portalPrefs.getValue("NAME_SPACE",  key + "order-by-col", "Date");
						orderByType = portalPrefs.getValue("NAME_SPACE",  key + "order-by-type", "asc");
					
					}			
				%>						
						
				<c:if test="${distinctTemplateIndex.getIndex() % 2 == oddOrEvenTemplates}">

					<liferay-ui:panel-container>
						<liferay-ui:panel id="childEntities" title="<%= \"Применяемое оборудование : \" + template.getName() %>"
							collapsible="true" extended="true">

							<liferay-ui:search-container 
								id="<%= key %>"
								deltaConfigurable="<%=true%>" 
								deltaParam="<%= key + \"DeltaParam\" %>"
								curParam="<%= key + \"CurParam\" %>" 
								iteratorURL="<%= scIteratorUrl.get(key)%>"
								delta="<%= Integer.parseInt(scDelta.get(key))%>"
								orderByCol="<%= orderByCol %>" 
								orderByColParam="<%= key + \"OrderByColParam\" %>"
								orderByType="<%= orderByType %>"
								orderByTypeParam="<%= key + \"OrderByTypeParam\" %>"
								emptyResultsMessage="нет записей">
					
								<liferay-ui:search-container-results>
									<%
										List<Entity> topicEntities = entitiesByTemplate.get(key);
										
										OrderByComparator orderByComparator =       
									           CustomComparatorUtil.getEntityOrderByComparator(orderByCol, orderByType);        
					
									    Collections.sort(topicEntities, orderByComparator);
					
										results = ListUtil.subList(topicEntities,
												searchContainer.getStart(),
												searchContainer.getEnd());
										
										total = topicEntities.size();
					
										pageContext.setAttribute("results", results);
										pageContext.setAttribute("total", total);
									%>
								</liferay-ui:search-container-results>
					
								<liferay-ui:search-container-row
									className="org.unido.eetdb.common.model.Entity" 
									keyProperty="id"
									modelVar="entity">
									
									<portlet:renderURL var="showEnityURL">
					      				<portlet:param name="action" value="showEntity" />
					      				<portlet:param name="entityId" value="<%= String.valueOf(entity.getId()) %>" />
					    			</portlet:renderURL>
					
									<liferay-ui:search-container-column-text name="Id" property="id" orderable="<%= true %>" orderableProperty="id" href="<%= showEnityURL %>"/>
									<liferay-ui:search-container-column-text name="Название" property="name" orderable="<%= true %>" orderableProperty="name" href="<%= showEnityURL %>"/>
									<liferay-ui:search-container-column-text name="Тип" value="${entity.entityTemplate.name}" />
					
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

