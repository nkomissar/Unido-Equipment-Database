package org.unido.eetdb.util;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.service.dbmodel.DbEntity;
import org.unido.eetdb.service.dbmodel.DbEntityProperty;
import org.unido.eetdb.service.dbmodel.DbTopic;

public class DbToDomainMapper
{
    public static Topic mapTopic(DbTopic dbTopic)
    {
        Topic topic = new Topic();

        topic.setName(dbTopic.getName());
        topic.setId(dbTopic.getId());

        topic.setEntitiesOfTopic(mapEntities(dbTopic.getEntitiesOfTopic()));
        topic.setChildTopics(mapTopics(dbTopic.getChildTopics()));

        return topic;
    }
    
    public static Set<Topic> mapTopics(Set<DbTopic> dbTopics)
    {
        Set<Topic> topics = new HashSet<Topic>();

        for(DbTopic dbTopic : dbTopics)
        {
            Topic topic = mapTopic(dbTopic);

            topics.add(topic);
        }
        
        return topics;
    }
    
    public static Set<Entity> mapEntities(Set<DbEntity> dbEntities)
    {
        Set<Entity> entities = new HashSet<Entity>();

        for(DbEntity dbEntity : dbEntities)
        {
            Entity entity = mapEntity(dbEntity);

            entities.add(entity);
        }
        
        return entities;
    }
    
    public static Entity mapEntity(DbEntity dbEntity)
    {
        Entity entity = new Entity();

        entity.setEntityType(dbEntity.getEntityTemplate().getName());
        entity.setName(dbEntity.getName());
        entity.setId(dbEntity.getId());

        entity.setProperties(mapProperties(dbEntity.getProperties()));

        return entity;
    }

    public static EntityProperty mapProperty(DbEntityProperty dbEntityProperty)
    {
        EntityProperty entityProperty = new EntityProperty();
        
        entityProperty.setId(dbEntityProperty.getId());
        entityProperty.setName(dbEntityProperty.getTemplateProperty().getName());
        entityProperty.setDisplayInGrid(dbEntityProperty.getTemplateProperty().isDisplayInGrid());
        entityProperty.setMandatory(dbEntityProperty.getTemplateProperty().isMandatory());
        entityProperty.setValue(dbEntityProperty.getValue());
        
        entityProperty.setFormat(dbEntityProperty.getValueType().getFormat());
        entityProperty.setType(dbEntityProperty.getValueType().getType());
        entityProperty.setUnitOfMeasure(dbEntityProperty.getValueType().getUnitOfMeasure());

        return entityProperty;
    }
    
    public static Map<String, EntityProperty> mapProperties(Set<DbEntityProperty> dbProperties)
    {
        Map<String, EntityProperty> properties = new HashMap<String, EntityProperty>();

        for(DbEntityProperty property : dbProperties)
        {
            EntityProperty entityProperty = mapProperty(property);

            properties.put(entityProperty.getName(), entityProperty);
        }
        
        return properties;
    }
}
