package org.unido.eetdb.presentationUtil;

import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.portlet.PortletRequest;

import org.springframework.web.client.RestTemplate;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.util.ConfigWrapper;

public class EntityHelper {
	
	public static EntityProperty getPropertyByCode(Entity entity, String code)
	{
		
		for(EntityProperty entityProperty: entity.getProperties())
		{
			EntityTemplateProperty templatePoperty = entityProperty.getTemplateProperty();
			if(code.equalsIgnoreCase(templatePoperty.getCode()))
			{
				return entityProperty;
			}
		}
		
		return null;
		
	}
	
	public static Map<String, Entity> fetchReferencedEntities(PortletRequest request, Map<String, Entity> referencedEntities, Set<String> refCodes, Entity sourceEntity)
	{
		
		if (ConfigWrapper.useFiddlerProxy(request))
		{
			
			Properties props = System.getProperties();
			props.put("http.proxyHost", "localhost");
			props.put("http.proxyPort", "8888");
			 
		}
		RestTemplate tmpl = new RestTemplate();

		for(EntityProperty property: sourceEntity.getProperties())
		{
			EntityTemplateProperty templateProperty = 
					property.getTemplateProperty();
			
			if(!templateProperty
					.getValueType()
					.getType()
					.equalsIgnoreCase("REFERENCE"))
			{
				continue;
			}
			
			if (refCodes.contains(templateProperty.getCode()))
			{
				continue;
			}
			
			Entity[] result = 
					tmpl.getForObject(
							ConfigWrapper.getServUrl(request) + "/entities-by-code/{code}", 
							Entity[].class, 
							templateProperty.getCode());
			
			for(Entity refEnt: result)
			{
				String strId = String.valueOf(refEnt.getId());
				
				if (referencedEntities.containsKey(strId))
				{
					continue;
				}
				
				referencedEntities.put(strId, refEnt);
				
			}
			
			refCodes.add(templateProperty.getCode());
						
		}

		
		return referencedEntities;
	}

	public static String getFullName(EntityProperty property)
	{

		EntityTemplateProperty tProp = property.getTemplateProperty();
		
		return getFullName(tProp);
		
	}

	public static String getFullName(EntityTemplateProperty templateProperty)
	{
		
		String uom = templateProperty.getUnitOfMeasure();
		
		return uom == null || uom.length() == 0 
				? templateProperty.getName()
				: templateProperty.getName() + ", " + uom;
		
	}
}
