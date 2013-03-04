package org.unido.eetdb.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import org.unido.eetdb.util.DomainToDbMapper;

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
        DbEntity dbEntity = (DbEntity) sessionFactory.getCurrentSession().load(DbEntity.class,
                entityId);

        return DbToDomainMapper.mapEntity(dbEntity);
    }

    @Override
    @Transactional(readOnly = true)
    public Topic getTopic(Long topicId)
    {
        DbTopic dbTopic = (DbTopic) sessionFactory.getCurrentSession().load(DbTopic.class, topicId);

        return DbToDomainMapper.mapTopic(dbTopic, false);
    }

    @Override
    @Transactional(readOnly = true)
    public EntityTemplate getEntityTemplate(Long templateId)
    {
        DbEntityTemplate dbEntityTemplate = (DbEntityTemplate) sessionFactory.getCurrentSession()
                .load(DbEntityTemplate.class, templateId);

        return DbToDomainMapper.mapEntityTemplate(dbEntityTemplate, false);
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional(readOnly = true)
    public List<EntityTemplate> getEntityTemplates()
    {
        return DbToDomainMapper.mapEntityTemplates(sessionFactory.getCurrentSession()
                .createQuery("from DbEntityTemplate").list(), true);
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional(readOnly = true)
    public Set<Topic> getRootTopics()
    {
        return DbToDomainMapper.mapTopics(new HashSet<DbTopic>(sessionFactory.getCurrentSession()
                .createSQLQuery("SELECT * FROM V_ROOT_TOPIC").addEntity(DbTopic.class).list()));
    }

    @Override
    @Transactional
    public EntityTemplate createEntityTemplate(EntityTemplate template)
    {
        DbEntityTemplate dbTemplate = DomainToDbMapper.mapEntityTemplate(template);

        sessionFactory.getCurrentSession().save(dbTemplate);

        return DbToDomainMapper.mapEntityTemplate(dbTemplate, false);
    }

    @Override
    @Transactional
    public void deleteEntityTemplate(EntityTemplate template)
    {
        sessionFactory.getCurrentSession().delete(DomainToDbMapper.mapEntityTemplate(template));
    }

    @Override
    @Transactional
    public EntityTemplate updateEntityTemplate(EntityTemplate template)
    {
        DbEntityTemplate dbTemplate = DomainToDbMapper.mapEntityTemplate(template);

        sessionFactory.getCurrentSession().update(dbTemplate);

        return DbToDomainMapper.mapEntityTemplate(dbTemplate, false);
    }
}