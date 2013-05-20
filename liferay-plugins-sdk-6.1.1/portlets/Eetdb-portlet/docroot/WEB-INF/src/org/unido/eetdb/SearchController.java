package org.unido.eetdb;

import java.util.Properties;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.unido.eetdb.common.model.EntityTemplate;
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
			
			model.addAttribute("loadedTemplate", loadedTemplate);
			
		}
		
		model.addAttribute("templates", templates);
		
		return "search";
	}
}
