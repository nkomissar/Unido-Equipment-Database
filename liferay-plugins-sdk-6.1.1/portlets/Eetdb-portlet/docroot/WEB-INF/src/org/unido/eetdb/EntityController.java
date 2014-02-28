package org.unido.eetdb;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
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
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.presentationUtil.ComparisonHelper;
import org.unido.eetdb.presentationUtil.EntityHelper;
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
		
		Set<String> refCodes = new HashSet<String>();
		Map<String, Entity> referencedEntities = new HashMap<String, Entity>();
		
		model.addAttribute("entity", entity);
		model.addAttribute("isInComparison", ComparisonHelper.isInComparison(entity, request));
		model.addAttribute("comparisonCount", ComparisonHelper.getComparison(request).size());
		model.addAttribute("referencedEntities", EntityHelper.fetchReferencedEntities(request, referencedEntities, refCodes, entity));
		model.addAttribute("blobMeta", EntityHelper.fetchBlobMeta(request, entity));
		
		return "entity";
	}
}
