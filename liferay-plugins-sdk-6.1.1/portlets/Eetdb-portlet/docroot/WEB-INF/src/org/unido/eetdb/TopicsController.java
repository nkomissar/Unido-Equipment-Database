package org.unido.eetdb;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import javax.portlet.PortletURL;
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
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.util.ConfigWrapper;

import com.liferay.portal.kernel.dao.search.SearchContainer;

@Controller
@RequestMapping("view")
public class TopicsController {
	
	

	@RenderMapping(params = "action=showTopic")
	public String setModelAndView(@RequestParam long topicId, ModelMap model, RenderRequest request, RenderResponse response) {
		
	
		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");
			 
		}
		RestTemplate tmpl = new RestTemplate();
		
		Topic topic = tmpl.getForObject(ConfigWrapper.getServUrl(request) + "/topic/{0}?skip_childs=0", Topic.class, topicId);
		
		Set<Entity> entities = new HashSet<Entity>();
		for (int j=0,i = 0; i < 5; i++){
			
			j ++;
			Entity entity = null;
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
				
				entity = new Entity();
				entity.setId(j);
				entity.setName("name" + j);
				entity.setEntityTemplate(templ);
		
				entities.add(entity);
				
			}
			catch(Exception ex) 
			{
				i--;
			}
		}
		topic.setEntitiesOfTopic(entities);
		
		model.addAttribute("topic", topic);	
		
		return "topic";
	}
}
