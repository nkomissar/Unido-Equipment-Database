package org.unido.eetdb.presentationUtil;

import org.unido.eetdb.common.model.EntityTemplateProperty;

public class TemplateHelper 
{

	public static Boolean IsNumeric(EntityTemplateProperty property)
	{
		return property.getValueType().getType().equals("NUMBER") 
				|| property.getValueType().getType().equals("INTEGER");
	}
}
