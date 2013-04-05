package org.unido.eetdb;

import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

import javax.portlet.RenderRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.util.ConfigWrapper;

@Controller
@RequestMapping("view")
public class HomePageController {
	
	@RenderMapping
	public String setModelAndView(ModelMap model, RenderRequest request) {
		
		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");
			 
		}
		RestTemplate tmpl = new RestTemplate();
		
		Topic[] topics =  tmpl.getForObject(ConfigWrapper.getServUrl(request) + "/topics?skip_childs=0", Topic[].class);
		
		/*Set<Topic> tt = new HashSet<Topic>();
		for (int j=0,i = 0; i < 5; i++){
			
			j ++;
			Topic topic = null;
			try 
			{
			
				topic = tmpl.getForObject(
					ConfigWrapper.getServUrl(request) + "/topic/{id};skip_childs=0",
					Topic.class, j);
		
				tt.add(topic);
				
			}
			catch(Exception ex) 
			{
				i--;
			}
		}
		
		topics = tt.toArray(new Topic[0]);*/

		model.addAttribute("listOfTopics", topics);
		
		return "homePage";
		
		
	}
}
