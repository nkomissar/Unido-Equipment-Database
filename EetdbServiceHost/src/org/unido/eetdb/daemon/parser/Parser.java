package org.unido.eetdb.daemon.parser;

import java.io.File;
import java.util.List;

import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.daemon.db.DbHelper;

public interface Parser
{
    public List<Entity> parse(File file) throws Exception;

    public static class entityFiller
    {
        public static Entity fillEntity(DataAccessor dataAccessor, DbHelper dbHelper)
        {
            Entity entity = null;
            EntityTemplate template = dbHelper.getEntityTemplate(dataAccessor.readValue("CODE"));

            if (template != null)
            {
                entity = new Entity();

                entity.setName(dataAccessor.readValue("TITLE"));
                entity.setEntityTemplate(template);

                for (EntityTemplateProperty templateProperty : template.getProperties())
                {
                    EntityProperty property = new EntityProperty();

                    property.setTemplateProperty(templateProperty);
                    property.setValue(dataAccessor.readValue(templateProperty.getCode()));

                    entity.getProperties().add(property);
                }
            }

            return entity;
        }
    }
}