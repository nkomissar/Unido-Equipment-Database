package org.unido.eetdb.service;

import java.util.ArrayList;

import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.Topic;

public interface DataAccessService
{
    public Entity getEntity(Long entityId, boolean loadChilds);
    public Topic getTopic(Long topicId);
    public EntityTemplate getEntityTemplate(Long templateId);
    public ArrayList<EntityTemplate> getEntityTemplates();
}