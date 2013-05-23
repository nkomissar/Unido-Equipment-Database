package org.unido.eetdb;

import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import java.util.Set;

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
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.presentationUtil.TemplateHelper;
import org.unido.eetdb.util.ConfigWrapper;

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
				
				if (property.isDisplayInGrid())
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

		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");
			 
		}
		RestTemplate tmpl = new RestTemplate();
		
		if(selectedTemplate != null)
		{
			EntityTemplate loadedTemplate = tmpl.getForObject(
					ConfigWrapper.getServUrl(request) + "/template/{id};skip_childs=0",
					EntityTemplate.class, selectedTemplate);
			
			Set<EntityTemplateProperty> searchTerms = new HashSet<EntityTemplateProperty>();
			
			for(EntityTemplateProperty property : loadedTemplate.getProperties())
			{
				
				if (property.isDisplayInGrid())
				{
					searchTerms.add(property);
				}
				
			}
			
			model.addAttribute("searchableProperties", searchTerms);
			
			List<NameValuePair> searchParams = new LinkedList<NameValuePair>();
			
			for(EntityTemplateProperty property: searchTerms)
			{
				if (TemplateHelper.IsNumeric(property))
				{
					String fieldMinName = property.getCode()+"min";
					String fieldMaxName = property.getCode()+"max";
					
					searchParams.add(new BasicNameValuePair(fieldMinName, request.getParameter(fieldMinName)));
					searchParams.add(new BasicNameValuePair(fieldMaxName, request.getParameter(fieldMaxName)));
					
				}
				else
				{
					searchParams.add(new BasicNameValuePair(property.getCode(), request.getParameter(property.getCode())));
				}
			}

			URLEncodedUtils.format(searchParams, "utf-8");

			
		}
		
		
		
		
		return "search";
	}

}
