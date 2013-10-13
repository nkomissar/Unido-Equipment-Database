package org.unido.eetdb;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import javax.portlet.PortletURL;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntitySearchResult;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.presentationUtil.EntityHelper;
import org.unido.eetdb.presentationUtil.TemplateHelper;
import org.unido.eetdb.util.ConfigWrapper;
import org.unido.eetdb.util.Mocks;

import com.liferay.portal.kernel.dao.search.SearchContainer;
import com.liferay.portal.kernel.exception.SystemException;

@Controller
@RequestMapping("view")
public class SearchController 
{

	@RenderMapping(params = "action=showSearch")
	public String setModelAndView(Integer selectedTemplate, ModelMap model, RenderRequest request, RenderResponse response) 
	{

		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");
			 
		}
		RestTemplate tmpl = new RestTemplate();
		
		EntityTemplate[] templates = tmpl.getForObject(
				ConfigWrapper.getServUrl(request) + "/templates",
				EntityTemplate[].class);
		
		if(selectedTemplate != null)
		{
			EntityTemplate loadedTemplate = tmpl.getForObject(
					ConfigWrapper.getServUrl(request) + "/template/{id};skip_childs=0",
					EntityTemplate.class, selectedTemplate);
			
			Set<EntityTemplateProperty> searchTerms = new HashSet<EntityTemplateProperty>();
			
			for(EntityTemplateProperty property : loadedTemplate.getProperties())
			{
				
				if (property.isSearchable())
				{
					searchTerms.add(property);
				}
				
			}
			
			model.addAttribute("searchableProperties", searchTerms);
			
		}
		
		
		model.addAttribute("templates", templates);
		
		return "search";
	}
	
	@RenderMapping(params = "action=doSearch")
	public String doSearch(Integer selectedTemplate, ModelMap model, RenderRequest request, RenderResponse response) 
	{

		this.setModelAndView(selectedTemplate, model, request, response);
		
		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");
			 
		}
	
		if(selectedTemplate != null)
		{
			
			doAdvancedSearch(selectedTemplate, model, request, response);
		
		}
		else
		{

			doBasicSearch(model, request, response);
			
		}
		
		return "search";
	}

	private void doAdvancedSearch(Integer selectedTemplate, ModelMap model, RenderRequest request, RenderResponse response) 
	{
		PortletURL entitiesIteratorUrl = response.createRenderURL();
		entitiesIteratorUrl.setParameter("action", "doSearch");

		List<NameValuePair> searchParams = new LinkedList<NameValuePair>();

		EntityTemplate[] templates = (EntityTemplate[]) model.get("templates");
		
		for(EntityTemplate template: templates)
		{
			if(template.getId() == selectedTemplate)
			{
				
				searchParams.add(new BasicNameValuePair("templateId", String.valueOf(template.getId())));
				searchParams.add(new BasicNameValuePair("templateCode", template.getCode()));

				entitiesIteratorUrl.setParameter("selectedTemplate", String.valueOf(template.getId()));

				break;
			}
		}			

		
		@SuppressWarnings("unchecked")
		Set<EntityTemplateProperty> searchTerms = (Set<EntityTemplateProperty>) model.get("searchableProperties");
		
		for(EntityTemplateProperty property: searchTerms)
		{
			if (TemplateHelper.IsNumeric(property))
			{
				String fieldMinName = property.getCode()+"min";
				String fieldMaxName = property.getCode()+"max";
				
				searchParams.add(new BasicNameValuePair(fieldMinName, request.getParameter(fieldMinName)));
				searchParams.add(new BasicNameValuePair(fieldMaxName, request.getParameter(fieldMaxName)));
				
				entitiesIteratorUrl.setParameter(fieldMinName, request.getParameter(fieldMinName));
				entitiesIteratorUrl.setParameter(fieldMaxName, request.getParameter(fieldMaxName));
				
			}
			else
			{
				
				searchParams.add(new BasicNameValuePair(property.getCode(), request.getParameter(property.getCode())));
				
				entitiesIteratorUrl.setParameter(property.getCode(), request.getParameter(property.getCode()));
				
			}
		}

		Entity[] entities;
		
		try
		{
			RestTemplate tmpl = new RestTemplate();
			entities = tmpl.getForObject(
				ConfigWrapper.getServUrl(request) + "/search?" + URLEncodedUtils.format(searchParams, "utf-8"), 
				Entity[].class);
		}
		catch(Exception ex)
		{
			entities = Mocks.GetMockEntities(15, 6);
			ex.printStackTrace();
		}

		EntityHelper.BuildEntitiesGridViewModel(entities, model, entitiesIteratorUrl, request);
		
	}

	private void doBasicSearch(ModelMap model, RenderRequest request, RenderResponse response) 
	{
		PortletURL entitiesIteratorUrl = response.createRenderURL();
		entitiesIteratorUrl.setParameter("action", "doSearch");

		entitiesIteratorUrl.setParameter("keywords", request.getParameter("keywords"));

		EntitySearchResult[] entities;
		
		try
		{
			RestTemplate tmpl = new RestTemplate();
			entities = tmpl.getForObject(
					ConfigWrapper.getServUrl(request) + "/search-for-entities?param={query}", 
					EntitySearchResult[].class,  request.getParameter("keywords"));
		}
		catch(Exception ex)
		{
			entities = Mocks.GetMockEntitySearchResults(15);
			ex.printStackTrace();
		}
		
		//entities = Mocks.GetMockEntitySearchResults(15);
		
		try {

			SearchContainer<EntitySearchResult> searchContainer = EntityHelper.BuildEntitySearchResultGrid(
					Arrays.asList(entities), request, entitiesIteratorUrl);
			model.addAttribute("basicSearchContainer", searchContainer);

		} catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
