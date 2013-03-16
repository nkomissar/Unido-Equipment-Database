package org.unido.eetdb.service;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.common.model.ValueType;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public class DataAccessServiceImpl implements DataAccessService
{
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory)
    {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public Entity getEntity(Long entityId, boolean skipChilds)
    {
        Entity retVal = (Entity) sessionFactory.getCurrentSession().load(Entity.class, entityId);

        Helper.ensureChilds(retVal, skipChilds);

        return retVal;
    }

    @Override
    public Topic getTopic(Long topicId)
    {
        return (Topic) sessionFactory.getCurrentSession().load(Topic.class, topicId);
    }

    @Override
    public EntityTemplate getEntityTemplate(Long templateId, boolean skipChilds)
    {
        EntityTemplate template = (EntityTemplate) sessionFactory.getCurrentSession().load(
                EntityTemplate.class, templateId);

        Helper.ensureChilds(template, skipChilds);

        return template;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Set<EntityTemplate> getEntityTemplates()
    {
        Set<EntityTemplate> retVal = new HashSet<EntityTemplate>(sessionFactory.getCurrentSession()
                .createQuery("from EntityTemplate").list());
        
        for(EntityTemplate template : retVal)
        {
            Helper.ensureChilds(template, true);
        }

        return retVal;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Set<Topic> getRootTopics()
    {
        return new HashSet<Topic>(sessionFactory.getCurrentSession()
                .createSQLQuery("SELECT * FROM V_ROOT_TOPIC").addEntity(Topic.class).list());
    }

    @Override
    public EntityTemplate createEntityTemplate(EntityTemplate template)
    {
        Helper.ensureParent(template);

        sessionFactory.getCurrentSession().save(template);

        return template;
    }

    @Override
    public void deleteEntityTemplate(EntityTemplate template)
    {
        sessionFactory.getCurrentSession().delete(template);
    }

    @Override
    public EntityTemplate updateEntityTemplate(EntityTemplate template)
    {
        Helper.ensureParent(template);

        template = (EntityTemplate) sessionFactory.getCurrentSession().merge(template);

        sessionFactory.getCurrentSession().flush();

        return template;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Set<ValueType> getValueTypes()
    {
        return new HashSet<ValueType>(sessionFactory.getCurrentSession()
                .createQuery("from ValueType").list());
    }

    private static class Helper
    {
        public static void ensureParent(EntityTemplate template)
        {
            for (EntityTemplateProperty property : template.getProperties())
            {
                property.setParentTemplate(template);
            }
        }
        
        public static void ensureParent(Entity entity)
        {
            for (EntityProperty property : entity.getProperties())
            {
                property.setParentEntity(entity);
            }
        }

        public static void ensureChilds(EntityTemplate template, boolean doAbort)
        {
            if (doAbort)
            {
                template.setProperties(null);
            }
            else
            {
                template.getProperties().size();
            }
        }

        public static void ensureChilds(Entity entity, boolean doAbort)
        {
            if (doAbort)
            {
                entity.setChildEntities(null);
            }
            else
            {
                for (Entity child : entity.getChildEntities())
                {
                    ensureChilds(child, false);
                }
            }

            ensureChilds(entity.getEntityTemplate(), doAbort);
        }
    }
}