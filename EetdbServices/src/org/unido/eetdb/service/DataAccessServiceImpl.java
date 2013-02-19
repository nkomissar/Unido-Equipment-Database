package org.unido.eetdb.service;

import java.util.ArrayList;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.service.dbmodel.DbEntity;
import org.unido.eetdb.service.dbmodel.DbEntityTemplate;
import org.unido.eetdb.service.dbmodel.DbTopic;
import org.unido.eetdb.util.DbToDomainMapper;

@Repository
public class DataAccessServiceImpl implements DataAccessService
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
        
        return DbToDomainMapper.mapEntity(dbEntity);
    }

    @Override
    @Transactional(readOnly = true)
    public Topic getTopic(Long topicId)
    {
        DbTopic dbTopic = (DbTopic)sessionFactory.getCurrentSession().load(DbTopic.class, topicId);

        return DbToDomainMapper.mapTopic(dbTopic);
    }

    @Override
    @Transactional(readOnly = true)
    public EntityTemplate getEntityTemplate(Long templateId)
    {
        DbEntityTemplate dbEntityTemplate = (DbEntityTemplate)sessionFactory.getCurrentSession().load(DbEntityTemplate.class, templateId);

        return DbToDomainMapper.mapEntityTemplate(dbEntityTemplate);
    }

    @Override
    @Transactional(readOnly = true)
    public ArrayList<EntityTemplate> getEntityTemplates()
    {
        return new ArrayList<EntityTemplate>(sessionFactory.getCurrentSession().createQuery("from DbEntityTemplate").list());
    }
}