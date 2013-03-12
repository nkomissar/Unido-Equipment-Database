package org.unido.eetdb.service;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.common.model.ValueType;

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
    public Entity getEntity(Long entityId)
    {
        return (Entity) sessionFactory.getCurrentSession().load(Entity.class, entityId);
    }

    @Override
    @Transactional(readOnly = true)
    public Topic getTopic(Long topicId)
    {
        return (Topic) sessionFactory.getCurrentSession().load(Topic.class, topicId);
    }

    @Override
    @Transactional(readOnly = true)
    public EntityTemplate getEntityTemplate(Long templateId)
    {
        return (EntityTemplate) sessionFactory.getCurrentSession().load(EntityTemplate.class, templateId);
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional(readOnly = true)
    public Set<EntityTemplate> getEntityTemplates()
    {
        return new HashSet<EntityTemplate>(sessionFactory.getCurrentSession().createQuery("from EntityTemplate").list());
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional(readOnly = true)
    public Set<Topic> getRootTopics()
    {
        return new HashSet<Topic>(sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM V_ROOT_TOPIC").addEntity(Topic.class).list());
    }

    @Override
    @Transactional
    public EntityTemplate createEntityTemplate(EntityTemplate template)
    {
        Helper.ensureParent(template);

        sessionFactory.getCurrentSession().save(template);

        return template;
    }

    @Override
    @Transactional
    public void deleteEntityTemplate(EntityTemplate template)
    {
        sessionFactory.getCurrentSession().delete(template);
    }

    @Override
    @Transactional
    public EntityTemplate updateEntityTemplate(EntityTemplate template)
    {
        Helper.ensureParent(template);

        template = (EntityTemplate)sessionFactory.getCurrentSession().merge(template);
        
        sessionFactory.getCurrentSession().flush();

        return template;
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional
    public Set<ValueType> getValueTypes()
    {
        return new HashSet<ValueType>(sessionFactory.getCurrentSession().createQuery("from ValueType").list());
    }
    
    private static class Helper
    {
        public static void ensureParent(EntityTemplate template)
        {
            for(EntityTemplateProperty property : template.getProperties())
            {
                property.setParentTemplate(template);
            }
        }
    }
}