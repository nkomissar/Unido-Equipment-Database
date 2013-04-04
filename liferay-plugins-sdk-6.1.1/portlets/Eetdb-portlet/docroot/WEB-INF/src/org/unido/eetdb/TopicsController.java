package org.unido.eetdb;

import java.util.ArrayList;
import java.util.Properties;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.unido.eetdb.common.model.Entity;
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
		
		SearchContainer<Entity> childEntities = new SearchContainer<Entity>(request, response.createRenderURL(), null, "no records" );
		
		childEntities.setResults(new ArrayList<Entity>(topic.getEntitiesOfTopic()));

		model.addAttribute("topic", topic);	
		model.addAttribute("childEntities", childEntities);
		model.addAttribute("entitiesOfTopic", new ArrayList<Entity>(topic.getEntitiesOfTopic()));
		
		return "topic";
	}
}
