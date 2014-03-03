package org.unido.eetdb.service;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntitySearchResult;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.common.model.UploadError;
import org.unido.eetdb.common.model.UploadItem;
import org.unido.eetdb.common.model.ValueBlob;
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

    @SuppressWarnings("unchecked")
    @Override
    public Set<Entity> getEntitiesByTemplateCode(String code)
    {
        HashSet<Entity> retVal = new HashSet<Entity>(sessionFactory.getCurrentSession()
                .createQuery("from Entity as entity where entity.entityTemplate.code = ?")
                .setString(0, code).list());

        for (Entity entity : retVal)
        {
            Helper.ensureChilds(entity, true);
        }

        return retVal;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Set<Entity> getEntitiesByTopic(Long topicId)
    {
        HashSet<Entity> retVal = new HashSet<Entity>(sessionFactory
                .getCurrentSession()
                .createQuery(
                        "select entity from Entity entity "
                                + "inner join fetch entity.properties props "
                                + "inner join fetch entity.entityTemplate "
                                + "inner join fetch props.templateProperty tprop "
                                + "inner join fetch tprop.valueType "
                                + "join entity.parentTopics topic " + "where topic.id = ?")
                .setLong(0, topicId).list());

        for (Entity entity : retVal)
        {
            entity.setParentTopics(null);
            entity.setChildEntities(null);
            entity.getEntityTemplate().setProperties(null);
        }

        return retVal;
    }

    @Override
    public Entity createEntity(Entity entity)
    {
        Helper.ensureParent(entity);

        sessionFactory.getCurrentSession().save(entity);

        return entity;
    }

    @Override
    public Entity updateEntity(Entity entity)
    {
        Helper.ensureParent(entity);

        entity = (Entity) sessionFactory.getCurrentSession().merge(entity);
        
        for(Topic topic : entity.getParentTopics())
        {
            topic = (Topic) sessionFactory.getCurrentSession().merge(topic);
        }

        sessionFactory.getCurrentSession().flush();

        Helper.ensureChilds(entity, false);

        return entity;
    }

    @Override
    public void deleteEntity(Entity entity)
    {
        sessionFactory.getCurrentSession().delete(entity);
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

        for (EntityTemplate template : retVal)
        {
            Helper.ensureChilds(template, true);
        }

        return retVal;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Set<Topic> getRootTopics()
    {
        HashSet<Topic> retVal = new HashSet<Topic>(sessionFactory.getCurrentSession()
                .createSQLQuery("SELECT * FROM V_ROOT_TOPIC").addEntity(Topic.class).list());

        for (Topic topic : retVal)
        {
            Helper.ensureChilds(topic, true);
        }

        return retVal;
    }

    @Override
    public Topic getTopic(Long topicId)
    {
        Topic retVal = (Topic) sessionFactory.getCurrentSession().load(Topic.class, topicId);

        Helper.ensureChilds(retVal, false);

        return retVal;
    }

    @Override
    public Topic createTopic(Topic topic)
    {
        sessionFactory.getCurrentSession().save(topic);

        return topic;
    }

    @Override
    public Topic updateTopic(Topic topic)
    {
        topic = (Topic) sessionFactory.getCurrentSession().merge(topic);

        sessionFactory.getCurrentSession().flush();

        Helper.ensureChilds(topic, false);

        return topic;
    }

    @Override
    public void deleteTopic(Topic topic)
    {
        sessionFactory.getCurrentSession().delete(topic);

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

    @SuppressWarnings("unchecked")
    @Override
    public List<Topic> searchForTopics(String param)
    {
        Query query = sessionFactory.getCurrentSession().getNamedQuery("searchForTopics")
                .setParameter("param", param);

        List<Topic> retVal = query.list();

        for (Topic topic : retVal)
        {
            Helper.ensureChilds(topic, true);
        }

        return retVal;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<EntitySearchResult> searchForEntities(String param)
    {
        Query query = sessionFactory.getCurrentSession().getNamedQuery("searchForEntities")
                .setParameter("param", param);

        List<EntitySearchResult> retVal = query.list();

        return retVal;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Entity> searchForEntities(String templateCode, String params)
    {
        Query query = sessionFactory.getCurrentSession().getNamedQuery("searchForEntitiesWithParams")
                .setParameter("templateCode", templateCode)
                .setParameter("params", params);

        List<Object> resultSet = query.list();
        
        Map<Integer, Entity> entities = new HashMap<Integer, Entity>();
        
        for(int i = 0; i < resultSet.size(); i++)
        {
            Object[] row = (Object[])resultSet.get(i);
            Entity entity = null;
            EntityProperty property = new EntityProperty();
            EntityTemplateProperty templateProperty = new EntityTemplateProperty();
            ValueType valueType = new ValueType();
            
            if(entities.containsKey(row[0]))
                entity = entities.get(row[0]);
            else
            {
                entity = new Entity();
                
                entity.setName((String)row[2]);
                entity.setId((Integer)row[0]);
                
                entities.put((Integer)row[0], entity);
            }

            valueType.setId((Integer)row[6]);
            
            templateProperty.setId((Integer)row[4]);
            templateProperty.setValueType(valueType);
            templateProperty.setName((String)row[5]);
            
            property.setId((Integer)row[3]);
            property.setValue((String)row[7]);
            property.setTemplateProperty(templateProperty);
            
            entity.getProperties().add(property);
        }

        return new ArrayList<Entity>(entities.values());
    }

    @Override
    public ValueBlob getValueBlob(Long blobId)
    {
        return (ValueBlob) sessionFactory.getCurrentSession().load(ValueBlob.class, blobId);
    }
    
    @SuppressWarnings("unchecked")
	@Override
    public Set<ValueBlob> getValueBlobMetaForEntity(Long entityId)
    {
        HashSet<ValueBlob> retVal = new HashSet<ValueBlob>(sessionFactory
                .getCurrentSession()
                .createQuery(
                        "select blob from ValueBlob blob "
                		+ "where blob.id in ("
//                        		+ "select SUBSTR(csv,1,INSTR(csv,',')-1) as csv from ("
	                				+ "select props.value as csv from Entity entity "
	                                + "inner join entity.properties props "
	                                + "inner join entity.entityTemplate "
	                                + "inner join props.templateProperty tprop "
	                                + "inner join tprop.valueType valType "
	                                + "where valType.type IN ('FILE','IMG') "
	                                + "and entity.id = ? "
//                                + ")"
                        + ")"
                                )
                .setLong(0, entityId).list());

        /*for (ValueBlob entity : retVal)
        {
            entity.setParentTopics(null);
            entity.setChildEntities(null);
            entity.getEntityTemplate().setProperties(null);
        }*/

        return retVal;
    }
    
    public ValueBlob saveValueBlob(ValueBlob valueBlob, byte[] blobData)
    {
        Blob blob = Hibernate.getLobCreator(sessionFactory.getCurrentSession()).createBlob(blobData);
            
        valueBlob.setContent(blob);
        
        sessionFactory.getCurrentSession().save(valueBlob);

        sessionFactory.getCurrentSession().flush();
        
        return valueBlob;
    }
    
    @Override
    public UploadItem getUploadItem(Long uploadItemId)
    {

    	UploadItem retVal = (UploadItem) sessionFactory.getCurrentSession().load(UploadItem.class, uploadItemId);

        return retVal;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public Set<UploadItem> getUploadItems()
    {
        Set<UploadItem> retVal = new HashSet<UploadItem>(sessionFactory.getCurrentSession()
                .createQuery("from UploadItem").list());

        /*for (UploadItem template : retVal)
        {
            Helper.ensureChilds(template, true);
        }*/

        return retVal;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Set<UploadError> getUploadErrors(Long uploadItemId)
    {
        Set<UploadError> retVal = new HashSet<UploadError>(sessionFactory.getCurrentSession()
                .createQuery("from UploadError as uploadError where uploadError.uploadItem.id = ?")
                .setLong(0, uploadItemId)
                .list());

        return retVal;
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

        public static void ensureChilds(Topic topic, boolean doAbort)
        {
            if (doAbort)
            {
                topic.setChildTopics(null);
            }
            else
            {
                for (Topic childTopic : topic.getChildTopics())
                {
                    childTopic.setChildTopics(null);
                }
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
                entity.setProperties(null);
                entity.setParentTopics(null);
            }
            else
            {
                for (Entity child : entity.getChildEntities())
                {
                    ensureChilds(child, true);
                }

                for (Topic topic : entity.getParentTopics())
                {
                    ensureChilds(topic, true);
                }

                entity.getProperties().size();
                entity.getParentTopics().size();
            }

            ensureChilds(entity.getEntityTemplate(), doAbort);
        }
    }
}