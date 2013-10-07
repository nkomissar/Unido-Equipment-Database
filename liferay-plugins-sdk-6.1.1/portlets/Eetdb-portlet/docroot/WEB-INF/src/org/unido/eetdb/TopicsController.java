package org.unido.eetdb;

import java.util.Properties;

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
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.presentationUtil.EntityHelper;
import org.unido.eetdb.util.ConfigWrapper;
import org.unido.eetdb.util.Mocks;

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
		
		Entity[] entities = tmpl.getForObject(ConfigWrapper.getServUrl(request) + "/entities-by-topic/{topicId}", Entity[].class, topicId);
		//Entity[] entities = Mocks.GetMockEntities(20, 4);
		
		PortletURL entitiesIteratorUrl = response.createRenderURL();

		entitiesIteratorUrl.setParameter("action", "showTopic");
		entitiesIteratorUrl.setParameter("topicId", Long.toString(topic.getId()));
		
		EntityHelper.BuildEntitiesGridViewModel(entities, model, entitiesIteratorUrl, request);

		model.addAttribute("topic", topic);
		
		return "topic";
	}

}
