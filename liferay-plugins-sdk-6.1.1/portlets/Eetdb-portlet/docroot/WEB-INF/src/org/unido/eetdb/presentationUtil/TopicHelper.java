package org.unido.eetdb.presentationUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.Topic;


public class TopicHelper {
	
	//for quick param prefix change, if required
	public static String getKey(EntityTemplate template)
	{
		return template.getCode();
	}
	
	public static Map<EntityTemplate, List<Entity>> groupEntitiesByTemplate(Topic topic)
	{
		
		Map<EntityTemplate, List<Entity>> entitiesByTemplate = new HashMap<EntityTemplate, List<Entity>>();
		
		/*for(Entity entity : topic.getEntitiesOfTopic())
		{

			EntityTemplate template = entity.getEntityTemplate();
			
			if (!entitiesByTemplate.containsKey(template)){
				entitiesByTemplate.put(template,  new ArrayList<Entity>());
			}
			
			List<Entity> sameTemplateEntities = entitiesByTemplate.get(template);
			sameTemplateEntities.add(entity);
			
		} */
		
		return entitiesByTemplate;
	}
}
