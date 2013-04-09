package org.unido.eetdb;

import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.presentationUtil.ComparisonHelper;
import org.unido.eetdb.util.ConfigWrapper;

@Controller
@RequestMapping("view")
public class EntityController {
	
	

	@RenderMapping(params = "action=showEntity")
	public String setModelAndView(@RequestParam long entityId, ModelMap model, RenderRequest request, RenderResponse response) {
		
	
		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");
			 
		}
		RestTemplate tmpl = new RestTemplate();
		
		Entity entity = tmpl.getForObject(ConfigWrapper.getServUrl(request) + "/entity/{0};skip_childs=0", Entity.class, entityId);
		
		if (false)
		{
			Set<Entity> entities = new HashSet<Entity>();
			for (int j=0,i = 0; i < 5; i++){
				
				j ++;
				Entity subentity = null;
				try 
				{
				
					/*entity = tmpl.getForObject(
						ConfigWrapper.getServUrl(request) + "/entity/{id};skip_childs=0",
						Entity.class, j);*/
					
					EntityTemplate templ = new EntityTemplate(){{
						setId(1);
						setCode("code");
						setName("MockTemplateName");
					}};
					
					subentity = new Entity();
					subentity.setId(j);
					subentity.setName("name" + j);
					subentity.setEntityTemplate(templ);
			
					entities.add(subentity);
					
				}
				catch(Exception ex) 
				{
					i--;
				}
			}
			entity.setChildEntities(entities);
		}
		
		model.addAttribute("entity", entity);
		model.addAttribute("isInComparison", ComparisonHelper.isInComparison(entity, request));
		model.addAttribute("comparisonCount", ComparisonHelper.getComparison(request).size());
		
		return "entity";
	}
}
