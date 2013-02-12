package org.unido.eetdb.service;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.Topic;

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
    public Entity getEntity(long entityId, boolean loadChilds)
    {
        return null;
    }

    @Override
    public Topic getTopic(long topicId)
    {
        return null;
    }
}