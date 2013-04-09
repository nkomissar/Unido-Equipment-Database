package org.unido.eetdb.daemon.parser;

import java.io.File;
import java.util.List;

import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.common.model.Topic;
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
                    String propertyValue = dataAccessor.readValue(templateProperty.getCode());

                    if (propertyValue != null)
                    {

                        EntityProperty property = new EntityProperty();

                        property.setTemplateProperty(templateProperty);
                        property.setValue(propertyValue);

                        entity.getProperties().add(property);
                    }
                }

                boolean tiedToTopic = true;
                String topicCode = null;
                int categoryIndex = 1;

                while (tiedToTopic)
                {
                    topicCode = dataAccessor.readValue("CATEGORY" + categoryIndex++);

                    Topic topic = dbHelper.getTopic(topicCode);

                    if (topic != null)
                    {
                        entity.getParentTopics().add(topic);
                    }
                    else
                    {
                        tiedToTopic = false;
                    }
                }
            }

            return entity;
        }
    }
}