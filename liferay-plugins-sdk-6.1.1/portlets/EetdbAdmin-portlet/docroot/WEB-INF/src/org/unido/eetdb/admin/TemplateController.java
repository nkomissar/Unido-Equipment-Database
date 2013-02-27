package org.unido.eetdb.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.servlet.View;
import org.unido.eetdb.common.model.EntityTemplate;

@Controller
@RequestMapping("view")
public class TemplateController {

	@Autowired
	@Qualifier("jsonview")
	private View jsonView;
	
	@RenderMapping(params = "action=doEntityTemplateList")
	public ModelAndView loadEntityTemplateList() 
	{

		RestTemplate tmpl = new RestTemplate();
		
		EntityTemplate[] templates = tmpl.getForObject("http://localhost:8080/EetdbServices/templates", EntityTemplate[].class);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("templates", templates);

		return new ModelAndView(jsonView, data);

	}

	@RenderMapping(params = "action=doEntityTemplateLoad")
	public ModelAndView loadEntityTemplate(@RequestParam long entityTemplateId) 
	{

		RestTemplate tmpl = new RestTemplate();
		
		EntityTemplate template = tmpl.getForObject("http://localhost:8080/EetdbServices/template/{id}", EntityTemplate.class, entityTemplateId);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("template", template);

		return new ModelAndView(jsonView, data);

	}
	
}
