package org.unido.eetdb.presentationUtil;

import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntityTemplateProperty;

public class EntityHelper {
	
	public static EntityProperty getPropertyByCode(Entity entity, String code)
	{
		
		for(EntityProperty entityProperty: entity.getProperties())
		{
			EntityTemplateProperty templatePoperty = entityProperty.getTemplateProperty();
			if(templatePoperty.getCode() == code)
			{
				return entityProperty;
			}
		}
		
		return null;
		
	}
}
