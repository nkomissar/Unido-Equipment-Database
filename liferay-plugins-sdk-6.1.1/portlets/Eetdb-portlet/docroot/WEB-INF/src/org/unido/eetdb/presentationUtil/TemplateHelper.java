package org.unido.eetdb.presentationUtil;

import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;

public class TemplateHelper 
{

	public static Boolean IsNumeric(EntityTemplateProperty property)
	{
		return property.getValueType().getType().equals("NUMBER") 
				|| property.getValueType().getType().equals("INTEGER");
	}
	
	public static EntityTemplate[] FilterReference(EntityTemplate[] templates)
	{
		
		int count = 0;
		
		for(EntityTemplate template: templates)
		{
			if (!template.getIsReference())
			{
				count++;
			}
		}
		
		EntityTemplate[] result = new EntityTemplate[count];
		count = 0;
		
		//traverse twice for less memory consumption
		for(EntityTemplate template: templates)
		{
			if (!template.getIsReference())
			{
				result[count++] = template;
			}
		}
		
		return result;
		
	}
}
