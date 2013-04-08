package org.unido.eetdb;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.portlet.PortletURL;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.presentationUtil.TopicHelper;
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

@Controller
@RequestMapping("view")
public class TopicsController {

	@RenderMapping(params = "action=showTopic")
	public String setModelAndView(
			@RequestParam long topicId, 
			ModelMap model,
			RenderRequest request, 
			RenderResponse response) 
	{

		if (ConfigWrapper.useFiddlerProxy(request)) {

			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");

		}
		RestTemplate tmpl = new RestTemplate();

		Topic topic = tmpl.getForObject(ConfigWrapper.getServUrl(request) + "/topic/{0};skip_childs=0", Topic.class, topicId);

		if(false)
		{
			Set<Entity> entities = new HashSet<Entity>();
			for (int j = 0, i = 0; i < 21; i++) {
	
				j++;
				Entity entity = null;
				try {
	
					/*
					 * entity = tmpl.getForObject( ConfigWrapper.getServUrl(request)
					 * + "/entity/{id};skip_childs=0", Entity.class, j);
					 */
	
					EntityTemplate templ = new EntityTemplate();
					templ.setId((i % 2) + 1);
					templ.setCode("code" + ((i % 2) + 1));
					templ.setName("MockTemplateName" + ((i % 2) + 1));
	
					entity = new Entity();
					entity.setId(j);
					entity.setName("name" + j);
					entity.setEntityTemplate(templ);
	
					entities.add(entity);
	
				} catch (Exception ex) {
					i--;
				}
			}
			topic.setEntitiesOfTopic(entities);
		}

		Map<EntityTemplate, List<Entity>> entitiesByTemplate = TopicHelper
				.groupEntitiesByTemplate(topic);

		try {

			Map<EntityTemplate, SearchContainer<Entity>> searchContainers = buildEntities(
					topic, entitiesByTemplate, request, response);
			model.addAttribute("searchContainers", searchContainers);

		} catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("topic", topic);

		return "topic";
	}

	private static Map<EntityTemplate, SearchContainer<Entity>> buildEntities(
			Topic topic, 
			Map<EntityTemplate, List<Entity>> entitiesByTemplate,
			RenderRequest renderRequest, 
			RenderResponse renderResponse)
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
					String.valueOf(SearchContainer.DEFAULT_DELTA - 18));

			scDelta.put(key, ParamUtil.get(renderRequest, key + "DeltaParam",
					deltaFromReq));

		}

		for (EntityTemplate template : entitiesByTemplate.keySet()) 
		{
			
			String key = TopicHelper.getKey(template);

			PortletURL entitiesIteratorUrl = renderResponse.createRenderURL();

			entitiesIteratorUrl.setParameter("action", "showTopic");
			entitiesIteratorUrl.setParameter("topicId", Long.toString(topic.getId()));

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
}
