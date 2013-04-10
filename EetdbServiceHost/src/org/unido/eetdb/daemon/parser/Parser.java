package org.unido.eetdb.daemon.parser;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.daemon.db.DbHelper;

public interface Parser
{
    public List<Entity> parse(File file) throws Exception;

    public static class EntityFiller
    {
        private static final Logger logger = Logger.getLogger(EntityFiller.class);

        public static Entity fillEntity(DataAccessor dataAccessor, DbHelper dbHelper)
        {
            Entity entity = null;
            String templateCode = dataAccessor.readValue("CODE");
            EntityTemplate template = dbHelper.getEntityTemplate(templateCode);

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

                        if (templateProperty.getValueType().getType().equalsIgnoreCase("REFERENCE"))
                        {
                            Map<String, Long> catalog = dbHelper.getCatalog(templateProperty
                                    .getCode());

                            if (catalog != null)
                            {
                                String[] values = propertyValue.split(",");

                                for (String value : values)
                                {
                                    Long id = catalog.get(value.trim().toUpperCase());
                                }
                            }
                            else
                            {
                                logger.info(String.format("No catalog for reference property: %s",
                                        templateProperty.getCode()));
                            }
                        }
                        else
                        {
                            property.setTemplateProperty(templateProperty);
                            property.setValue(propertyValue);
                        }

                        entity.getProperties().add(property);
                    }
                    else
                    {
                        logger.info(String.format("No data for property: %s",
                                templateProperty.getCode()));
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
            else
            {
                logger.error(String.format("Unknown template: %s", templateCode));
            }

            return entity;
        }
    }
}