package org.unido.eetdb.service;

import java.util.List;
import java.util.Set;

import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.common.model.ValueType;

public interface DataAccessService
{
    public Entity getEntity(Long entityId, boolean skipChilds);
    public Entity createEntity(Entity entity);
    public Entity updateEntity(Entity entity);
    public void deleteEntity(Entity entity);

    public Topic getTopic(Long topicId);
    public Set<Topic> getRootTopics();

    public EntityTemplate getEntityTemplate(Long templateId, boolean skipChilds);
    public Set<EntityTemplate> getEntityTemplates();
    public EntityTemplate createEntityTemplate(EntityTemplate template);
    public EntityTemplate updateEntityTemplate(EntityTemplate template);
    public void deleteEntityTemplate(EntityTemplate template);
    
    public Set<ValueType> getValueTypes();
    
    public List<Topic> searchForTopics(String param);
}