package org.unido.eetdb.presentationUtil;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.portlet.PortletRequest;
import javax.portlet.PortletURL;
import javax.portlet.RenderRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.web.client.RestTemplate;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntitySearchResult;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.util.ConfigWrapper;
import org.unido.eetdb.util.CustomComparatorUtil;

import com.liferay.portal.kernel.dao.search.SearchContainer;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ListUtil;
import com.liferay.portal.kernel.util.OrderByComparator;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.PortalPreferences;
import com.liferay.portlet.PortletPreferencesFactoryUtil;

public class EntityHelper {
	
	public static EntityProperty getPropertyByCode(Entity entity, String code)
	{
		
		for(EntityProperty entityProperty: entity.getProperties())
		{
			EntityTemplateProperty templatePoperty = entityProperty.getTemplateProperty();
			if(code.equalsIgnoreCase(templatePoperty.getCode()))
			{
				return entityProperty;
			}
		}
		
		return null;
		
	}
	
	public static Map<String, Entity> fetchReferencedEntities(PortletRequest request, Map<String, Entity> referencedEntities, Set<String> refCodes, Entity sourceEntity)
	{
		
		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");
			 
		}
		RestTemplate tmpl = new RestTemplate();

		for(EntityProperty property: sourceEntity.getProperties())
		{
			EntityTemplateProperty templateProperty = 
					property.getTemplateProperty();
			
			if(!templateProperty
					.getValueType()
					.getType()
					.equalsIgnoreCase("REFERENCE"))
			{
				continue;
			}
			
			if (refCodes.contains(templateProperty.getCode()))
			{
				continue;
			}
			
			Entity[] result = 
					tmpl.getForObject(
							ConfigWrapper.getServUrl(request) + "/entities-by-code/{code}", 
							Entity[].class, 
							templateProperty.getCode());
			
			for(Entity refEnt: result)
			{
				String strId = String.valueOf(refEnt.getId());
				
				if (referencedEntities.containsKey(strId))
				{
					continue;
				}
				
				referencedEntities.put(strId, refEnt);
				
			}
			
			refCodes.add(templateProperty.getCode());
						
		}

		
		return referencedEntities;
	}

	public static String getFullName(EntityProperty property)
	{

		EntityTemplateProperty tProp = property.getTemplateProperty();
		
		return getFullName(tProp);
		
	}

	public static String getFullName(EntityTemplateProperty templateProperty)
	{
		
		String uom = templateProperty.getUnitOfMeasure();
		
		return uom == null || uom.length() == 0 
				? templateProperty.getName()
				: templateProperty.getName() + ", " + uom;
		
	}
	
	public static void BuildEntitiesGridViewModel(Entity[] entities, ModelMap model, PortletURL entitiesIteratorUrl, RenderRequest request)
	{
		
		Map<EntityTemplate, List<Entity>> entitiesByTemplate = TopicHelper
				.groupEntitiesByTemplate(Arrays.asList(entities));
		
		Set<String> refCodes = new HashSet<String>();
		Map<String, Entity> referencedEntities = new HashMap<String, Entity>();
		
		for(Entity entity: entities)
		{
			EntityHelper
				.fetchReferencedEntities(request, referencedEntities, refCodes, entity);
		}

		try {

			Map<EntityTemplate, SearchContainer<Entity>> searchContainers = EntityHelper.BuildEntityGrid(
					entitiesByTemplate, request, entitiesIteratorUrl);
			model.addAttribute("searchContainers", searchContainers);

		} catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("referencedEntities", referencedEntities);
		
	}
	
	public static Map<EntityTemplate, SearchContainer<Entity>> BuildEntityGrid(
			Map<EntityTemplate, List<Entity>> entitiesByTemplate,
			RenderRequest renderRequest, 
			PortletURL entitiesIteratorUrl)
			throws SystemException 
	{

		HttpServletRequest httpReq = PortalUtil
				.getOriginalServletRequest(PortalUtil
						.getHttpServletRequest(renderRequest));

		Map<EntityTemplate, SearchContainer<Entity>> searchContainers = new HashMap<EntityTemplate, SearchContainer<Entity>>();

		Map<String, String> scDelta = new HashMap<String, String>();
		Map<String, String> scCur = new HashMap<String, String>();

		for (EntityTemplate template : entitiesByTemplate.keySet()) 
		{
			String key = TopicHelper.getKey(template);

			String curFromReq = ParamUtil.getString(renderRequest, key 	+ "CurParam");

			// Getting "cur" value from request.
			// This value is used to display corresponding page.
			// e.g. page 2 of 10
			scCur.put(key, ParamUtil.get(httpReq, key + "CurParam", curFromReq));

			// Getting "delta" value from request.
			// We get this parameter from request only when we change
			// "items per page (delta)" for any search container
			// Search container set the changed delta parameter as
			// "delta + {curParam value defined in search container tag}"
			// Substracting 18 as default delta value is 20, but we have only 5
			// records for testing
			String deltaFromReq = ParamUtil.get(renderRequest, "delta" + key
					+ "CurParam",
					String.valueOf(SearchContainer.DEFAULT_DELTA - 10));

			scDelta.put(key, ParamUtil.get(renderRequest, key + "DeltaParam",
					deltaFromReq));

		}

		for (EntityTemplate template : entitiesByTemplate.keySet()) 
		{
			
			String key = TopicHelper.getKey(template);

			for (String subKey : scCur.keySet()) 
			{
				entitiesIteratorUrl.setParameter(subKey + "DeltaParam", scDelta.get(subKey));
				entitiesIteratorUrl.setParameter(subKey + "CurParam", scCur.get(subKey));
			}

			// sorting

			PortalPreferences portalPrefs = PortletPreferencesFactoryUtil.getPortalPreferences(httpReq);
			String orderByCol = ParamUtil.getString(renderRequest, key + "OrderByColParam");
			String orderByType = ParamUtil.getString(renderRequest, key + "OrderByTypeParam");


			if (Validator.isNotNull(orderByCol)
					&& Validator.isNotNull(orderByType)) 
			{
				portalPrefs.setValue("NAME_SPACE", key + "order-by-col", orderByCol);
				portalPrefs.setValue("NAME_SPACE", key + "order-by-type", orderByType);
			} 
			else 
			{

				orderByCol = portalPrefs.getValue("NAME_SPACE", key + "order-by-col", "id");
				orderByType = portalPrefs.getValue("NAME_SPACE", key + "order-by-type", "asc");
			}

			int cur = 0;
			int delta = SearchContainer.DEFAULT_DELTA;

			try 
			{
				cur = Integer.parseInt(scCur.get(key));
			} catch (NumberFormatException ex) {

			}
			try 
			{
				delta = Integer.parseInt(scDelta.get(key));
			} catch (NumberFormatException ex) {

			}

			SearchContainer<Entity> searchContainer = 
					new SearchContainer<Entity>(
							renderRequest, 
							null, // displayTerms
							null, // searchTerms,
							key + "CurParam", 
							cur, 
							delta, 
							entitiesIteratorUrl, 
							null, // headerNames,
							"нет записей");

			searchContainer.setId(key);
			searchContainer.setIteratorURL(entitiesIteratorUrl);
			searchContainer.setDeltaConfigurable(true);
			searchContainer.setDeltaParam(key + "DeltaParam");
			// searchContainer.setCurParam(key + "CurParam");
			searchContainer.setDelta(delta);
			searchContainer.setOrderByColParam(key + "OrderByColParam");
			searchContainer.setOrderByCol(orderByCol);
			searchContainer.setOrderByTypeParam(key + "OrderByTypeParam");
			searchContainer.setOrderByType(orderByType);

			List<Entity> topicEntities = entitiesByTemplate.get(template);

			OrderByComparator orderByComparator = CustomComparatorUtil
					.getEntityOrderByComparator(orderByCol, orderByType);

			Collections.sort(topicEntities, orderByComparator);

			searchContainer.setResults(ListUtil.subList(topicEntities,
					searchContainer.getStart(), searchContainer.getEnd()));

			searchContainer.setTotal(topicEntities.size());
			
			searchContainers.put(template, searchContainer);

		}

		return searchContainers;
	}
	
	public static SearchContainer<EntitySearchResult> BuildEntitySearchResultGrid(
			List<EntitySearchResult> entities,
			RenderRequest renderRequest, 
			PortletURL entitiesIteratorUrl)
			throws SystemException 
	{

		HttpServletRequest httpReq = PortalUtil
				.getOriginalServletRequest(PortalUtil
						.getHttpServletRequest(renderRequest));

		Map<EntityTemplate, SearchContainer<Entity>> searchContainers = new HashMap<EntityTemplate, SearchContainer<Entity>>();

		Map<String, String> scDelta = new HashMap<String, String>();
		Map<String, String> scCur = new HashMap<String, String>();

		String key = "basicSearch";

		String curFromReq = ParamUtil.getString(renderRequest, key 	+ "CurParam");

		// Getting "cur" value from request.
		// This value is used to display corresponding page.
		// e.g. page 2 of 10
		scCur.put(key, ParamUtil.get(httpReq, key + "CurParam", curFromReq));

		// Getting "delta" value from request.
		// We get this parameter from request only when we change
		// "items per page (delta)" for any search container
		// Search container set the changed delta parameter as
		// "delta + {curParam value defined in search container tag}"
		// Substracting 18 as default delta value is 20, but we have only 5
		// records for testing
		String deltaFromReq = ParamUtil.get(renderRequest, "delta" + key
				+ "CurParam",
				String.valueOf(SearchContainer.DEFAULT_DELTA - 10));

		scDelta.put(key, ParamUtil.get(renderRequest, key + "DeltaParam",
				deltaFromReq));

			for (String subKey : scCur.keySet()) 
			{
				entitiesIteratorUrl.setParameter(subKey + "DeltaParam", scDelta.get(subKey));
				entitiesIteratorUrl.setParameter(subKey + "CurParam", scCur.get(subKey));
			}

			// sorting

			PortalPreferences portalPrefs = PortletPreferencesFactoryUtil.getPortalPreferences(httpReq);
			String orderByCol = ParamUtil.getString(renderRequest, key + "OrderByColParam");
			String orderByType = ParamUtil.getString(renderRequest, key + "OrderByTypeParam");


			if (Validator.isNotNull(orderByCol)
					&& Validator.isNotNull(orderByType)) 
			{
				portalPrefs.setValue("NAME_SPACE", key + "order-by-col", orderByCol);
				portalPrefs.setValue("NAME_SPACE", key + "order-by-type", orderByType);
			} 
			else 
			{

				orderByCol = portalPrefs.getValue("NAME_SPACE", key + "order-by-col", "id");
				orderByType = portalPrefs.getValue("NAME_SPACE", key + "order-by-type", "asc");
			}

			int cur = 0;
			int delta = SearchContainer.DEFAULT_DELTA;

			try 
			{
				cur = Integer.parseInt(scCur.get(key));
			} catch (NumberFormatException ex) {

			}
			try 
			{
				delta = Integer.parseInt(scDelta.get(key));
			} catch (NumberFormatException ex) {

			}

			SearchContainer<EntitySearchResult> searchContainer = 
					new SearchContainer<EntitySearchResult>(
							renderRequest, 
							null, // displayTerms
							null, // searchTerms,
							key + "CurParam", 
							cur, 
							delta, 
							entitiesIteratorUrl, 
							null, // headerNames,
							"нет записей");

			searchContainer.setId(key);
			searchContainer.setIteratorURL(entitiesIteratorUrl);
			searchContainer.setDeltaConfigurable(true);
			searchContainer.setDeltaParam(key + "DeltaParam");
			// searchContainer.setCurParam(key + "CurParam");
			searchContainer.setDelta(delta);
			searchContainer.setOrderByColParam(key + "OrderByColParam");
			searchContainer.setOrderByCol(orderByCol);
			searchContainer.setOrderByTypeParam(key + "OrderByTypeParam");
			searchContainer.setOrderByType(orderByType);

			/*
			 OrderByComparator orderByComparator = CustomComparatorUtil
					.getEntityOrderByComparator(orderByCol, orderByType);

			Collections.sort(entities, orderByComparator);
			*/
			
			searchContainer.setResults(
						ListUtil.subList(
							CustomComparatorUtil.sortEntitySearchResultsById(entities),
							searchContainer.getStart(), 
							searchContainer.getEnd()));

			searchContainer.setTotal(entities.size());
			

		return searchContainer;
	}
	
}
