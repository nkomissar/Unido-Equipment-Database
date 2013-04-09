package org.unido.eetdb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
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
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.presentationUtil.ComparisonHelper;
import org.unido.eetdb.presentationUtil.EntityHelper;
import org.unido.eetdb.util.ConfigWrapper;

import com.liferay.portal.util.PortalUtil;


	@Controller
	@RequestMapping("view")
	public class ComparisonController {
		
		
		@ActionMapping(value = "addToCompare")
		public void addEntityToComparison(@RequestParam long entityId, ActionRequest actionRequest, ActionResponse actionResponse) 
		{
			
			if (ConfigWrapper.useFiddlerProxy(actionRequest))
			{
				
				Properties props = System.getProperties();
				props.put("http.proxyHost", "localhost");
				props.put("http.proxyPort", "8888");
				 
			}
			RestTemplate tmpl = new RestTemplate();
			
			Entity entity = tmpl.getForObject(
									ConfigWrapper.getServUrl(actionRequest) + "/entity/{0};skip_childs=0", 
									Entity.class, 
									    entityId);
			
			ComparisonHelper.addToComparison(entity, actionRequest);
			
			PortalUtil.copyRequestParameters(actionRequest, actionResponse);
			
		}
		
		@ActionMapping(value = "removeFromCompare")
		public void removeEntityFromComparison(@RequestParam long entityId, ActionRequest actionRequest, ActionResponse actionResponse) 
		{
			
			ComparisonHelper.removeFromComparison(entityId, actionRequest);
			
			PortalUtil.copyRequestParameters(actionRequest, actionResponse);
			
		}		
		
		
		@RenderMapping(params = "action=doCompare")
		public String setModelAndView(ModelMap model, RenderRequest request, RenderResponse response) 
		{
			
			List<Entity> entities = ComparisonHelper.getComparison(request);
			
			Map<String, List<String>> results = new HashMap<String, List<String>>();
			Map<String, EntityTemplateProperty> uniqueProperties = new HashMap<String, EntityTemplateProperty>();
						
			for(Entity entity: entities)
			{
				for(EntityProperty entityProperty: entity.getProperties())
				{
					
					EntityTemplateProperty templateProperty = entityProperty.getTemplateProperty();
					
					String code = templateProperty.getCode();
					
					if(results.containsKey(code)
							|| !templateProperty.isDisplayInGrid())
					{
						continue;
					}
					
					results.put(code, new ArrayList<String>());
					uniqueProperties.put(code, templateProperty);
					
				}
			}
			
		
			for(Entry<String, List<String>> entry: results.entrySet())
			{
				for(Entity entity: entities)
				{
					
					EntityProperty entityProperty = EntityHelper.getPropertyByCode(entity, entry.getKey());
					List<String> record = entry.getValue();
					
					record.add(entityProperty == null ? "-" : entityProperty.getValue());
					
				}
			}
			
			
			model.addAttribute("entities", entities);
			model.addAttribute("compareResults", new ArrayList<Entry<String, List<String>>>(results.entrySet()));
			model.addAttribute("uniqueProperties", uniqueProperties);

			
			return "comparison";
		}
}
