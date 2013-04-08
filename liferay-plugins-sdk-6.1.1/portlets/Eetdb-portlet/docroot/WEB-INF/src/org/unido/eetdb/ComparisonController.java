package org.unido.eetdb;

import java.util.Properties;

import javax.portlet.ActionRequest;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.presentationUtil.ComparisonHelper;
import org.unido.eetdb.util.ConfigWrapper;


	@Controller
	@RequestMapping("view")
	public class ComparisonController {
		
		
		@ActionMapping(params = "actionCompare=add")
		public void addEntityToComparison(@RequestParam long entityId, ActionRequest actionRequest) 
		{
			
			if (ConfigWrapper.useFiddlerProxy(actionRequest))
			{
				
				Properties props = System.getProperties();
				props.put("http.proxyHost", "localhost");
				props.put("http.proxyPort", "8888");
				 
			}
			RestTemplate tmpl = new RestTemplate();
			
			Entity entity = tmpl.getForObject(
									ConfigWrapper.getServUrl(actionRequest) + "/entity/{0};skip_childs=1", 
									Entity.class, 
									    entityId);
			
			ComparisonHelper.addToComparison(entity, actionRequest);
			
		}
		
		@ActionMapping(params = "actionCompare=add")
		public void removeEntityFromComparison(@RequestParam long entityId, ActionRequest actionRequest) 
		{
			
			if (ConfigWrapper.useFiddlerProxy(actionRequest))
			{
				
				Properties props = System.getProperties();
				props.put("http.proxyHost", "localhost");
				props.put("http.proxyPort", "8888");
				 
			}
			
			ComparisonHelper.removeFromComparison(entityId, actionRequest);
			
		}		
		
		
		//@RenderMapping(params = "action=showEntity")
		public String setModelAndView(@RequestParam long entityId, ModelMap model, RenderRequest request, RenderResponse response) 
		{
			
		
			if (ConfigWrapper.useFiddlerProxy(request))
			{
				
				Properties props = System.getProperties();
				props.put("http.proxyHost", "localhost");
				props.put("http.proxyPort", "8888");
				 
			}
			RestTemplate tmpl = new RestTemplate();
			
			Entity entity = tmpl.getForObject(ConfigWrapper.getServUrl(request) + "/entity/{0};skip_childs=0", Entity.class, entityId);
			
			return "dummy";
		}
}
