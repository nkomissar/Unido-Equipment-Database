package org.unido.eetdb.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.service.dbmodel.DbEntity;
import org.unido.eetdb.service.dbmodel.DbEntityProperty;
import org.unido.eetdb.service.dbmodel.DbEntityTemplate;
import org.unido.eetdb.service.dbmodel.DbEntityTemplateProperty;
import org.unido.eetdb.service.dbmodel.DbTopic;

public class DbToDomainMapper
{
    public static EntityTemplate mapEntityTemplate(DbEntityTemplate dbEntityTemplate,
            boolean skipChilds)
    {
        EntityTemplate template = new EntityTemplate();

        template.setId(dbEntityTemplate.getId());
        template.setName(dbEntityTemplate.getName());
        template.setCode(dbEntityTemplate.getCode());
        template.setLastUpdatedDate(dbEntityTemplate.getLastUpdatedDate().getTime());

        if (!skipChilds)
            template.setProperties(mapEntityTemplateProperties(dbEntityTemplate.getProperties()));

        return template;
    }

    public static List<EntityTemplate> mapEntityTemplates(List<DbEntityTemplate> dbEntityTemplates,
            boolean skipChilds)
    {
        List<EntityTemplate> templates = new ArrayList<EntityTemplate>();

        for (DbEntityTemplate dbEntityTemplate : dbEntityTemplates)
        {
            templates.add(mapEntityTemplate(dbEntityTemplate, skipChilds));
        }

        return templates;
    }

    public static Set<EntityTemplateProperty> mapEntityTemplateProperties(
            Set<DbEntityTemplateProperty> dbProperties)
    {
        Set<EntityTemplateProperty> properties = new HashSet<EntityTemplateProperty>();

        for (DbEntityTemplateProperty dbProperty : dbProperties)
        {
            properties.add(mapEntityTemplateProperty(dbProperty));
        }

        return properties;
    }

    public static EntityTemplateProperty mapEntityTemplateProperty(
            DbEntityTemplateProperty dbTemplateProperty)
    {
        EntityTemplateProperty templateProperty = new EntityTemplateProperty();

        templateProperty.setId(dbTemplateProperty.getId());
        templateProperty.setName(dbTemplateProperty.getName());
        templateProperty.setDisplayInGrid(dbTemplateProperty.isDisplayInGrid());
        templateProperty.setMandatory(dbTemplateProperty.isMandatory());
        templateProperty.setUnitOfMeasure(dbTemplateProperty.getUnitOfMeasure());
        templateProperty.setCode(dbTemplateProperty.getCode());

        templateProperty.setLastUpdatedDate(dbTemplateProperty.getLastUpdatedDate().getTime());

        return templateProperty;
    }

    public static Topic mapTopic(DbTopic dbTopic, boolean skipChilds)
    {
        Topic topic = new Topic();

        topic.setId(dbTopic.getId());
        topic.setName(dbTopic.getName());
        topic.setDescription(dbTopic.getDescription());
        
        topic.setLastUpdatedDate(dbTopic.getLastUpdatedDate().getTime());

        if(!skipChilds)
            topic.setEntitiesOfTopic(mapEntities(dbTopic.getEntitiesOfTopic()));

        topic.setChildTopics(mapTopics(dbTopic.getChildTopics()));

        return topic;
    }

    public static Set<Topic> mapTopics(Set<DbTopic> dbTopics)
    {
        Set<Topic> topics = new HashSet<Topic>();

        for (DbTopic dbTopic : dbTopics)
        {
            topics.add(mapTopic(dbTopic, true));
        }

        return topics;
    }

    public static Set<Entity> mapEntities(Set<DbEntity> dbEntities)
    {
        Set<Entity> entities = new HashSet<Entity>();

        for (DbEntity dbEntity : dbEntities)
        {
            entities.add(mapEntity(dbEntity));
        }

        return entities;
    }

    public static Entity mapEntity(DbEntity dbEntity)
    {
        Entity entity = new Entity();

        entity.setId(dbEntity.getId());
        entity.setEntityType(dbEntity.getEntityTemplate().getName());
        entity.setName(dbEntity.getName());
        entity.setTypeId(dbEntity.getEntityTemplate().getId());
        
        entity.setLastUpdatedDate(dbEntity.getLastUpdatedDate().getTime());

        entity.setProperties(mapProperties(dbEntity.getProperties()));

        return entity;
    }

    public static EntityProperty mapProperty(DbEntityProperty dbEntityProperty)
    {
        EntityProperty entityProperty = new EntityProperty();

        entityProperty.setId(dbEntityProperty.getId());
        entityProperty.setPropertyTypeId(dbEntityProperty.getTemplateProperty().getId());
        entityProperty.setName(dbEntityProperty.getTemplateProperty().getName());
        entityProperty.setDisplayInGrid(dbEntityProperty.getTemplateProperty().isDisplayInGrid());
        entityProperty.setMandatory(dbEntityProperty.getTemplateProperty().isMandatory());
        entityProperty.setValue(dbEntityProperty.getValue());

        entityProperty.setFormat(dbEntityProperty.getValueType().getFormat());
        entityProperty.setType(dbEntityProperty.getValueType().getType());
        entityProperty.setUnitOfMeasure(dbEntityProperty.getTemplateProperty().getUnitOfMeasure());
        
        entityProperty.setLastUpdatedDate(dbEntityProperty.getLastUpdatedDate().getTime());

        return entityProperty;
    }

    public static Set<EntityProperty> mapProperties(Set<DbEntityProperty> dbProperties)
    {
        Set<EntityProperty> properties = new HashSet<EntityProperty>();

        for (DbEntityProperty property : dbProperties)
        {
            properties.add(mapProperty(property));
        }

        return properties;
    }
}
