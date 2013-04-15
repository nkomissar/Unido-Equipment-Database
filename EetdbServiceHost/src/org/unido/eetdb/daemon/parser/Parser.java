package org.unido.eetdb.daemon.parser;

import java.io.File;
import java.util.ArrayList;
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

        private static String buildCommaSeparatedValues(List<Long> values)
        {
            StringBuffer retVal = new StringBuffer();
            String strSeparator = ",";

            if (values.size() > 0)
            {
                retVal.append(values.get(0));

                for (int i = 1; i < values.size(); i++)
                {
                    retVal.append(strSeparator).append(values.get(i));
                }
            }

            return retVal.toString();
        }

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
                                List<Long> refValues = new ArrayList<Long>();

                                for (String value : values)
                                {
                                    Long id = catalog.get(value.trim().toUpperCase());

                                    if (id != null)
                                    {
                                        refValues.add(id);
                                    }
                                    else
                                    {
                                        logger.error(String.format(
                                                "No catalog value for reference property: %s",
                                                value));
                                    }
                                }

                                if (refValues.size() > 0)
                                {
                                    property.setTemplateProperty(templateProperty);
                                    property.setValue(buildCommaSeparatedValues(refValues));

                                    entity.getProperties().add(property);
                                }
                            }
                            else
                            {
                                logger.error(String.format("No catalog for reference property: %s",
                                        templateProperty.getCode()));
                            }
                        }
                        else
                        {
                            property.setTemplateProperty(templateProperty);
                            property.setValue(propertyValue);

                            entity.getProperties().add(property);
                        }
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

                    if (topicCode != null)
                    {

                        Topic topic = dbHelper.getTopic(topicCode);

                        if (topic != null)
                        {
                            entity.getParentTopics().add(topic);
                        }
                        else
                        {
                            logger.error(String.format("Unknown topic: %s", topicCode));
                        }
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