package org.unido.eetdb.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.service.dbmodel.DbEntity;
import org.unido.eetdb.service.dbmodel.DbEntityProperty;
import org.unido.eetdb.service.dbmodel.DbEntityTemplateProperty;

@Repository
public class EntityServiceImpl implements EntityService
{
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory)
    {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional(readOnly = true)
    public Entity getEntity(Long entityId, boolean loadChilds)
    {
        DbEntity dbEntity = (DbEntity)sessionFactory.getCurrentSession().load(DbEntity.class, entityId); 
        Entity entity = new Entity();

        entity.setEntityType(dbEntity.getEntityTemplate().getName());
        entity.setName(dbEntity.getName());
        entity.setId(dbEntity.getId());

        Map<String, EntityProperty> properties = new HashMap<String, EntityProperty>();

        for(DbEntityProperty property : dbEntity.getProperties())
        {
            EntityProperty entityProperty = new EntityProperty();
            
            entityProperty.setId(property.getId());
            entityProperty.setName(property.getTemplateProperty().getName());
            entityProperty.setDisplayInGrid(property.getTemplateProperty().isDisplayInGrid());
            entityProperty.setMandatory(property.getTemplateProperty().isMandatory());
            
            properties.put(entityProperty.getName(), entityProperty);
        }
        
        entity.setProperties(properties);

        return entity;
    }

    @Override
    public Topic getTopic(Long topicId)
    {
        return null;
    }
}