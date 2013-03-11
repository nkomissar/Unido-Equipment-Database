package org.unido.eetdb.admin;

import java.util.HashMap;
import java.util.Map;

import javax.portlet.RenderRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.servlet.View;
import org.unido.eetdb.admin.util.ConfigWrapper;
import org.unido.eetdb.common.model.Entity;

@Controller
@RequestMapping("view")
public class EntityController 
{
	@Autowired
	@Qualifier("jsonview")
	private View jsonView;
	
	@RenderMapping(params = "action=doEntitySearch")
	public ModelAndView loadEntity(@RequestParam String query, RenderRequest renderRequest) 
	{

		RestTemplate tmpl = new RestTemplate();
		
		Entity[] entities = new Entity[5];

		for (int i=0; i<entities.length; i++)
		{
			entities[i] = tmpl.getForObject(ConfigWrapper.getServUrl(renderRequest) + "/entity/{i}", Entity.class, i+1);
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", Boolean.TRUE);
		data.put("entities", entities);

		return new ModelAndView(jsonView, data);

	}
}