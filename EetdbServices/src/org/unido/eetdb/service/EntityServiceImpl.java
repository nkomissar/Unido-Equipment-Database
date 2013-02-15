package org.unido.eetdb.service;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.service.dbmodel.DbEntity;
import org.unido.eetdb.service.dbmodel.DbTopic;
import org.unido.eetdb.util.DbToDomainMapper;

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
        
        return DbToDomainMapper.mapEntity(dbEntity);
    }

    @Override
    public Topic getTopic(Long topicId)
    {
        DbTopic dbTopic = (DbTopic)sessionFactory.getCurrentSession().load(DbTopic.class, topicId);
        
        return DbToDomainMapper.mapTopic(dbTopic);
    }
}