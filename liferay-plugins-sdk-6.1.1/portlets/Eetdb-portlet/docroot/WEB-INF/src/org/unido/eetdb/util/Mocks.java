package org.unido.eetdb.util;

import java.util.HashSet;
import java.util.Set;

import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntitySearchResult;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.common.model.ValueType;

public class Mocks 
{

	public static Entity[] GetMockEntities(int entityCount, int propertyCount) 
	{
	
		Set<Entity> entities = new HashSet<Entity>();
		for (int j = 0, i = 0; i < entityCount; i++) {

			j++;
			Entity subentity = null;
			try {

				/*
				 * entity = tmpl.getForObject( ConfigWrapper.getServUrl(request)
				 * + "/entity/{id};skip_childs=0", Entity.class, j);
				 */

				EntityTemplate templ = new EntityTemplate() {
					{
						setId(1);
						setCode("code");
						setName("MockTemplateName");
					}
				};

				subentity = new Entity();
				subentity.setId(j);
				subentity.setName("name" + j);
				subentity.setEntityTemplate(templ);
				
				Set<EntityProperty> properties = new HashSet<EntityProperty>();
				
				for(int p = 0; p < propertyCount; p++)
				{
					
					ValueType vType = new ValueType();
					vType.setType("STRING");
					
					EntityTemplateProperty templateProp = new EntityTemplateProperty();
					templateProp.setCode("code" + p);
					templateProp.setName("The Name" + p);
					templateProp.setDisplayInGrid(true);
					templateProp.setUnitOfMeasure("สร/AM");
					templateProp.setSearchable(true);
					templateProp.setValueType(vType);
					
					EntityProperty prop = new EntityProperty();
					prop.setValue("Value"+ j + p);
					prop.setTemplateProperty(templateProp);
					
					properties.add(prop);
					
				}
				
				subentity.setProperties(properties);

				entities.add(subentity);

			} catch (Exception ex) {
				i--;
			}
		}

		return entities.toArray(new Entity[0]);

	}


	public static EntitySearchResult[] GetMockEntitySearchResults(int count) 
	{
	
		Set<EntitySearchResult> entities = new HashSet<EntitySearchResult>();
		for (int j = 0, i = 0; i < count; i++) {

			j++;
			EntitySearchResult subentity = null;
			try {

				subentity = new EntitySearchResult();
				subentity.setEntityId(String.valueOf(j));
				subentity.setEntityName("name" + j);
				
				StringBuilder description = new StringBuilder("description" + j);
				for(int d = 0; d < 100; d++)
				{
					description.append("description" + j);
				}
				
				subentity.setEntityDescription(description.toString());

				entities.add(subentity);

			} catch (Exception ex) {
				i--;
			}
		}

		return entities.toArray(new EntitySearchResult[0]);

	}



}
