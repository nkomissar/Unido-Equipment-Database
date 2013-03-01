package org.unido.eetdb;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.unido.eetdb.common.model.Topic;;

@Controller
@RequestMapping("view")
public class TopicsController {

	@RenderMapping
	public String setModelAndView(ModelMap model) {
		
		RestTemplate tmpl = new RestTemplate();
		
		Topic[] topics = tmpl.getForObject("http://localhost:8080/EetdbServices/topics", Topic[].class);

		model.addAttribute("listOfTopics", topics);
		
		//return view name for "topics.jsp"
		return "topics";
	}
}
