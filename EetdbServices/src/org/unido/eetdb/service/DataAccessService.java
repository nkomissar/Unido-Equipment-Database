package org.unido.eetdb.service;

import java.util.List;
import java.util.Set;

import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.Topic;

public interface DataAccessService
{
    public Entity getEntity(Long entityId, boolean loadChilds);

    public Topic getTopic(Long topicId);
    public Set<Topic> getRootTopics();

    public EntityTemplate getEntityTemplate(Long templateId);
    public List<EntityTemplate> getEntityTemplates();
    
    public EntityTemplate createEntityTemplate(EntityTemplate template);
    public EntityTemplate updateEntityTemplate(EntityTemplate template);
    public void deleteEntityTemplate(EntityTemplate template);
}